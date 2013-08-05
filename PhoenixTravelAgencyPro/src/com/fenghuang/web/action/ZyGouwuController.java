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

import com.fenghuang.entiey.Dijie;
import com.fenghuang.entiey.Gouwu;
import com.fenghuang.service.IZyGouwuService;
import com.fenghuang.util.DateJsonValueProcessor;
import com.fenghuang.util.Pagination;

@Controller
public class ZyGouwuController{
	@Autowired
	public IZyGouwuService izgs;
	private Object returnValue;
	
	@RequestMapping("fenghuang/gouwuSelect.do")
	@ResponseBody
	public Map<String,Object> gouwuSelect(HttpServletRequest request,
			HttpServletResponse response, Integer page,Integer rows,String name,String chengshiId,String hzjbId){
		 try{
	    	   Pagination<Gouwu> pagination=(Pagination<Gouwu>)izgs.gouwuSelect(page, rows, name, chengshiId, hzjbId);
				List<Map<String, Object>> gouwuList = pagination.getResultList();
				Map<String,Object> returnValue  = new HashMap<String, Object>();
				for(int i = 0 ;i<gouwuList.size();i++){
					for(Entry<String, Object> entry : gouwuList.get(i).entrySet()){
						if(entry.getValue() == null){
							entry.setValue("") ;
						}
					}
				}
				returnValue.put("total",  pagination.getTotalRows());
				returnValue.put("rows", gouwuList);	
				JsonConfig config = new JsonConfig();
		     	config.registerJsonValueProcessor(Timestamp.class,new DateJsonValueProcessor("yyyy-MM-dd"));
		     			//把MAP转换成JSON，返回到前台
		     	JSONObject fromObject = JSONObject.fromObject(returnValue,config);
		     	//System.out.println(fromObject);
				return fromObject;
			}catch(Exception e){
				e.printStackTrace();
			}
			return null;
	}
	@RequestMapping("fenghuang/gouwuAdd.do")
	@ResponseBody
	public Map<String,Object> gouwuAdd(HttpServletRequest request,HttpServletResponse response,
			String lianxiren,String name,String chuanzhen,String chengshiId,String dizhi,
			String dianhua,String shouji,String email,String hzjbId,String bz){
		Gouwu gw=new Gouwu();
	
		gw.setLianxiren(lianxiren);
		gw.setName(name);
		gw.setChuanzhen(chuanzhen);
		if(chengshiId !=null && !"".equals(chengshiId)){
		gw.setChengshiId(Integer.parseInt(chengshiId));
		}
		gw.setDizhi(dizhi);
		gw.setDianhua(dianhua);
		gw.setShouji(shouji);
		gw.setEmail(email);
		if(hzjbId !=null && !"".equals(hzjbId)){
		gw.setHzjbId(Integer.parseInt(hzjbId));
		}
		gw.setBz(bz);
         Map<String,Object> result=new HashMap<String,Object>();
         boolean bl=false;
		try{
		  bl=izgs.gouwuAdd(gw);
		}catch(Exception e){
			e.printStackTrace();
		}
		result.put("success", bl);
		return result;
     }
	@RequestMapping("fenghuang/gouwuDelete.do")
	@ResponseBody
	public Map<String,Object> gouwuDelete(HttpServletRequest request,HttpServletResponse response,long id){
		Map<String,Object> result=new HashMap<String,Object>();
		boolean bl=false;
      try{
		 bl=izgs.gouwuDelete(id);
		}catch(Exception e){
			e.printStackTrace();
		}
      result.put("success", bl);
		return result;
	}
	@RequestMapping("fenghuang/gouwuUpdate.do")
	@ResponseBody
	public Map<String,Object> gouwuUpdate(HttpServletRequest request,HttpServletResponse response,
			String lianxiren,String name,String chuanzhen,String chengshiId,String dizhi,
			String dianhua,String shouji,String email,String hzjbId,String bz,long id){
		Gouwu gw=new Gouwu();
		
		gw.setLianxiren(lianxiren);
		gw.setName(name);
		gw.setChuanzhen(chuanzhen);
		if(chengshiId !=null && !"".equals(chengshiId)){
		gw.setChengshiId(Integer.parseInt(chengshiId));
		}
		gw.setDizhi(dizhi);
		gw.setDianhua(dianhua);
		gw.setShouji(shouji);
		gw.setEmail(email);
		if(hzjbId !=null && !"".equals(hzjbId)){
		gw.setHzjbId(Integer.parseInt(hzjbId));
		}
		gw.setBz(bz);
		gw.setId(id);
		Map<String,Object> result=new HashMap<String,Object>();
		boolean bl=false;
       try{
		bl=	izgs.gouwuUpdate(gw);
		}catch(Exception e){
			e.printStackTrace();
		} 
       result.put("success", bl);
		return result;
	}
	@RequestMapping("fenghuang/gouwuSelectId.do")
	@ResponseBody
	public Map<String,Object> gouwuSelectId(HttpServletRequest request,
			HttpServletResponse response, Integer page,Integer rows,long id){
		Map<String,Object> result=new HashMap<String,Object>();
		try{
			 List<Map<String, Object>> gouwulist=izgs.gouwuSelectId(id);
			 for(int i = 0 ;i<gouwulist.size();i++){
					for(Entry<String, Object> entry : gouwulist.get(i).entrySet()){
						if(entry.getValue() == null){
							entry.setValue("") ;
						}
					}
				}
				result.put("rows",gouwulist);
				JsonConfig config = new JsonConfig();
		     	config.registerJsonValueProcessor(Timestamp.class,new DateJsonValueProcessor("yyyy-MM-dd"));
		     			//把MAP转换成JSON，返回到前台
		     	JSONObject fromObject = JSONObject.fromObject(result,config);
				return fromObject;
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}


}
