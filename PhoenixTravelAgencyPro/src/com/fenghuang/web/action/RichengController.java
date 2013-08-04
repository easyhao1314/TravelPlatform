package com.fenghuang.web.action;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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

import com.fenghuang.entiey.Richeng;
import com.fenghuang.entiey.Sanpinzhongxin;
import com.fenghuang.service.IRichengService;
import com.fenghuang.util.DateJsonValueProcessor;
import com.fenghuang.util.Pagination;

@Controller
public class RichengController {
	@Autowired
	private IRichengService is;
	@RequestMapping("fenghuang/selectricheng.do")
	@ResponseBody
	public Map<String,Object> selectricheng(HttpServletRequest request,
			HttpServletResponse response, Integer page,Integer rows,
			String riid
			){
		Richeng r = new Richeng();
		if(riid!=null && !"".equals(riid)){
			r.setRiid(Long.parseLong(riid));
		}
		if(page==null){
			page=1;
		}
		if(rows==null){
			rows=1;
		}
		
		try {
			
			Pagination<Richeng> pagination=(Pagination<Richeng>)is.select(page, rows, r);
			List<Map<String, Object>> testUsers = pagination.getResultList();
			Map<String,Object> returnValue  = new HashMap<String, Object>();
			for(int i = 0 ;i<testUsers.size();i++){
				for(Entry<String, Object> entry : testUsers.get(i).entrySet()){
					if(entry.getValue() == null){
						entry.setValue("") ;
					}
				}
			}
			returnValue.put("total",  pagination.getTotalRows());
			returnValue.put("rows", testUsers);	
			JsonConfig config = new JsonConfig();
	     	config.registerJsonValueProcessor(Timestamp.class,new DateJsonValueProcessor("yyyy-MM-dd"));
	     			//把MAP转换成JSON，返回到前台
	     	JSONObject fromObject = JSONObject.fromObject(returnValue,config);
	     	System.out.println(fromObject+"执行");
			return fromObject;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	@RequestMapping("fenghuang/addricheng.do")
	@ResponseBody
	public Map<String, Object> Addsanpin(HttpServletRequest request,
			HttpServletResponse response,String richenganpai,String chengshiid){
			Richeng r = new Richeng();
			if(richenganpai!=null && !"".equals(richenganpai)){
				r.setRichenganpai(richenganpai);
			}
			if(chengshiid!=null && !"".equals(chengshiid)){
				r.setChengshiid(Long.parseLong(chengshiid));
			}
			boolean isSuccess = false;
			Map<String,Object> result = new HashMap<String, Object>();
		try {
			is.insert(r);
			isSuccess=true;
		} catch (Exception e) {
			isSuccess=false;
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		result.put("success", isSuccess);
		return result;
	}
	@RequestMapping("fenghuang/updatericheng.do")
	@ResponseBody
	public Map<String, Object> updatericheng(HttpServletRequest request,HttpServletResponse response,
			String riid,String richenganpai,String huodong,String chengshiid,String jiudian,String jiaotong,String zao,String zhong,String wan){
		boolean isSuccess = false;
		Map<String,Object> result = new HashMap<String, Object>();	
		Richeng r = new Richeng();
			if(riid!=null && !"".equals(riid)){
				r.setRiid(Long.parseLong(riid));
			}
			r.setHuodong(huodong);
			r.setRichenganpai(richenganpai);
			if(chengshiid!=null && !"".equals(chengshiid)){
				r.setChengshiid(Long.parseLong(chengshiid));
			}
			if(jiudian !=null && !"".equals(jiudian)){
				r.setJiudian(Long.parseLong(jiudian));
			}
			if(jiaotong!=null && !"".equals(jiaotong)){
				r.setJiaotong(Long.parseLong(jiaotong));
			}
			if(zao !=null && !"".equals(zao)){
				r.setZao(Long.parseLong(zao));		
			}
			if(zhong !=null && !"".equals(zhong)){
				r.setZhong(Long.parseLong(zhong));		
			}
			if(wan !=null && !"".equals(wan)){
				r.setWan(Long.parseLong(wan));		
			}
		try {
			is.update(r);
			isSuccess=true;
		} catch (Exception e) {
			isSuccess=false;
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		result.put("success", isSuccess);
		return result;
	}
	
	@RequestMapping("fenghuang/deletericheng.do")
	@ResponseBody
	public Map<String, Object> deletericheng(HttpServletRequest request,
			HttpServletResponse response,String riid,String richenganpai,String chengshiid){
		boolean isSuccess = false;
		Map<String,Object> result = new HashMap<String, Object>();	
		Richeng r = new Richeng();
			if(riid!=null && !"".equals(riid)){
				r.setRiid(Long.parseLong(riid));
			}
		try {
			is.delete(r);
			isSuccess=true;
		} catch (Exception e) {
			isSuccess=false;
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		result.put("success", isSuccess);
		return result;
	}
}
