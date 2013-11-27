package com.fenghuang.web.action;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fenghuang.entiey.Canyin;
import com.fenghuang.entiey.Richeng;
import com.fenghuang.entiey.Xianlu;
import com.fenghuang.service.IRichengService;
import com.fenghuang.service.IXianluService;
import com.fenghuang.util.DateJsonValueProcessor;
import com.fenghuang.util.Pagination;

@Controller
public class XianluController {
	@Autowired
	IXianluService xlservice;
	@Autowired
	IRichengService rs;
	@RequestMapping("fenghuang/xianluinfo.do")
	@ResponseBody
	public Map<String,Object> xianluinfo(HttpServletRequest request,
			HttpServletResponse response, Integer page,Integer rows,String xianid,String xingchengku){
		try{
			Xianlu x = new Xianlu();
			if(xianid!=null && !"".equals(xianid)){
				x.setXianid(Long.parseLong(xianid));
			}
			if(xingchengku!=null && !"".equals(xingchengku)){
				x.setXingchengku(Integer.parseInt(xingchengku));
			}
			if(page==null){
				page=1;
			}
			if(rows==null){
				rows=1;
			}
			Pagination<Xianlu> pagination=(Pagination<Xianlu>)xlservice.xianluinfo(page, rows,x);
			List<Map<String, Object>> xlservice=pagination.getResultList();
			Map<String,Object> returnValue  = new HashMap<String, Object>();
			for(int i = 0 ;i<xlservice.size();i++){
				for(Entry<String, Object> entry : xlservice.get(i).entrySet()){
					if(entry.getValue() == null){
						entry.setValue("");
					}
				}
			}
			returnValue.put("total",  pagination.getTotalRows());
			returnValue.put("rows", xlservice);	
			JsonConfig config = new JsonConfig();
	     	config.registerJsonValueProcessor(Timestamp.class,new DateJsonValueProcessor("yyyy-MM-dd"));
	     			//把MAP转换成JSON，返回到前台
	     	JSONObject fromObject = JSONObject.fromObject(returnValue,config);
	     	//System.out.println(fromObject);
			return fromObject;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	@RequestMapping("fenghuang/addXianlu.do")
	@ResponseBody
	public Map<String,Object> addXianlu(HttpServletRequest request,
			HttpServletResponse response,Xianlu x){
		Map<String,Object> result=new HashMap<String,Object>();
		boolean isSuccess=false;
		 int count=0;
		try {
		count=xlservice.AddXianlu(x);
		Richeng r = new Richeng();
		/*
		for(int i=0;i<x.getTianshu();i++){
			
			r.setXianluid(count);
		
		rs.insert(r);
		}
		*/
		
		if(count>0){
			isSuccess=true;
		}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		result.put("success", isSuccess);
		return result;
	}
	
	@RequestMapping("fenghuang/updateXianluSave.do")
	@ResponseBody
	public Map<String,Object> updateXianlu(HttpServletRequest request,HttpServletResponse response,Xianlu x){
		Map<String,Object> result=new HashMap<String,Object>();
		boolean isSuccess=false;
		try{
			isSuccess=xlservice.updateXianlu(x);
		}catch(Exception e){
			e.printStackTrace();
		}
		result.put("success", isSuccess);
	    return result;	
	}
	@RequestMapping("fenghuang/submitxingchengku.do")
	@ResponseBody
	public Map<String,Object> submitxingchengku(HttpServletRequest request,HttpServletResponse response,Xianlu x){
		Map<String,Object> result=new HashMap<String,Object>();
		Xianlu xian = new Xianlu();
		xian.setXingchengku(1);
		xian.setGuojia(x.getGuojia());
		xian.setTianshu(x.getTianshu());
		xian.setWeihuren(x.getWeihuren());
		xian.setXianluname(x.getXianluname());
		
		
		Richeng r = new Richeng();
		r.setXianluid(x.getXianid());
		
		boolean isSuccess=false;
		try{
			Pagination<Richeng> pagination = rs.select(1, 50, r);
			List<Map<String,Object>> list = pagination.getResultList();
			Integer newxianluid = xlservice.AddXianlu(xian);
			Richeng ri;
			System.out.println(list.size()+"日程数量");
			for (int i = 0; i < list.size(); i++) {
				ri = new Richeng();
				ri.setXianluid(Long.parseLong(newxianluid.toString()));
				ri.setRichenganpai(""+list.get(i).get("richenganpai"));
				ri.setJiudian(""+list.get(i).get("jiudian"));
				ri.setZao(""+list.get(i).get("zao"));
				ri.setZhong(""+list.get(i).get("zhong"));
				ri.setWan(""+list.get(i).get("wan"));
				ri.setJiaotongchengshi(""+list.get(i).get("jiaotongchengshi"));
				rs.insert(ri);
			}

			System.out.println(list.get(0).get("jiaotongchengshi")+"日程安排！！！");
			isSuccess=true;
		}catch(Exception e){
			e.printStackTrace();
		}
		result.put("success", isSuccess);
	    return result;	
	}
	
	@RequestMapping("fenghuang/savesanpinxingcheng.do")
	@ResponseBody
	public Map<String,Object> savesanpinxingcheng(HttpServletRequest request,HttpServletResponse response,String xlid,String xianid){
		Map<String,Object> result=new HashMap<String,Object>();
		Richeng r = new Richeng();
		r.setXianluid(Long.parseLong(xianid));
		boolean isSuccess=false;
		try{
			Pagination<Richeng> pagination = rs.select(1, 50, r);
			List<Map<String,Object>> list = pagination.getResultList();
			Richeng ri;
			for (int i = 0; i < list.size(); i++) {
				ri = new Richeng();
				ri.setXianluid(Long.parseLong(xlid));
				ri.setRichenganpai(""+list.get(i).get("richenganpai"));
				ri.setJiudian(""+list.get(i).get("jiudian"));
				ri.setZao(""+list.get(i).get("zao"));
				ri.setZhong(""+list.get(i).get("zhong"));
				ri.setWan(""+list.get(i).get("wan"));
				ri.setJiaotongchengshi(""+list.get(i).get("jiaotongchengshi"));
				rs.insert(ri);
			}
			isSuccess=true;
		}catch(Exception e){	
			e.printStackTrace();
		}
		result.put("success", isSuccess);
	    return result;	
	}
	
	
	
}
