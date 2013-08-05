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

import com.fenghuang.entiey.Hangkong;
import com.fenghuang.entiey.Jiaotong;
import com.fenghuang.entiey.Jiudian;
import com.fenghuang.service.IZyHangkongService;
import com.fenghuang.util.DateJsonValueProcessor;
import com.fenghuang.util.Pagination;

@Controller
public class ZyHangkongController {
	@Autowired
	public IZyHangkongService izhs;
	private Object returnValue;
	
	@RequestMapping("fenghuang/hangkongSelect.do")
	@ResponseBody
	public Map<String,Object> hangkongSelect(HttpServletRequest request,
			HttpServletResponse response, Integer page,Integer rows){
		 try{
	    	   Pagination<Hangkong> pagination=(Pagination<Hangkong>)izhs.hangkongSelect(page, rows);
				List<Map<String, Object>> hangkongList = pagination.getResultList();
				Map<String,Object> returnValue  = new HashMap<String, Object>();
				for(int i = 0 ;i<hangkongList.size();i++){
					for(Entry<String, Object> entry : hangkongList.get(i).entrySet()){
						if(entry.getValue() == null){
							entry.setValue("") ;
						}
					}
				}
				returnValue.put("total",  pagination.getTotalRows());
				returnValue.put("rows", hangkongList);	
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

	@RequestMapping("fenghuang/hangkongAdd.do")
	@ResponseBody
	public Map<String,Object> jiaotongAdd(HttpServletRequest request,HttpServletResponse response,
			String daima,String name,String shui,String bizongId){
		Hangkong hk=new Hangkong();
		hk.setDaima(daima);
		hk.setName(name);
		if(shui !=null && !"".equals(shui)){
		hk.setShui(Float.parseFloat(shui));
		}
		if(bizongId !=null && !"".equals(bizongId)){
		hk.setBizongId(Integer.parseInt(bizongId));
		}
         Map<String,Object> result=new HashMap<String,Object>();
         boolean bl=false;
		try{
		  bl=izhs.hangkongAdd(hk);
		}catch(Exception e){
			e.printStackTrace();
		}
		result.put("success", bl);
		return result;
     }

	@RequestMapping("fenghuang/hangkongDelete.do")
	@ResponseBody
	public Map<String,Object> hangkongDelete(HttpServletRequest request,HttpServletResponse response,long id){
		Map<String,Object> result=new HashMap<String,Object>();
		boolean bl=false;
      try{
		 bl=izhs.hangkongDelete(id);
		}catch(Exception e){
			e.printStackTrace();
		}
      result.put("success", bl);
		return result;
	}
	@RequestMapping("fenghuang/hangkongUpdate.do")
	@ResponseBody
	public Map<String,Object> hangkongUpdate(HttpServletRequest request,HttpServletResponse response,
			String daima,String name,String shui,String bizongId,long id){
		Hangkong hk=new Hangkong();

		hk.setDaima(daima);
		hk.setName(name);
		if(shui !=null && !"".equals(shui)){
		hk.setShui(Float.parseFloat(shui));
		}
		if(bizongId !=null && !"".equals(bizongId)){
		hk.setBizongId(Integer.parseInt(bizongId));
		}
		hk.setId(id);
		Map<String,Object> result=new HashMap<String,Object>();
		boolean bl=false;
       try{
		bl=	izhs.hangkongUpdate(hk);
		}catch(Exception e){
			e.printStackTrace();
		} 
       result.put("success", bl);
		return result;
	}
	@RequestMapping("fenghuang/hangkongSelectId.do")
	@ResponseBody
	public Map<String,Object> hangkongSelectId(HttpServletRequest request,
			HttpServletResponse response, Integer page,Integer rows,long id){
		Map<String,Object> result=new HashMap<String,Object>();
		try{
			 List<Map<String, Object>> hklist=izhs.hangkongSelectId(id);
			 for(int i = 0 ;i<hklist.size();i++){
					for(Entry<String, Object> entry : hklist.get(i).entrySet()){
						if(entry.getValue() == null){
							entry.setValue("") ;
						}
					}
				}
				result.put("rows",hklist);
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
	  //模糊查询
		@RequestMapping("fenghuang/hangkongSelectLike.do")
		@ResponseBody
			public Map<String,Object> hangkongSelectLike(HttpServletRequest request,HttpServletResponse response,
					Integer page,Integer rows,String daima,String name){
				try{
					Pagination<Hangkong> pagination=(Pagination<Hangkong>)izhs.hangkongSelectLike(page, rows, daima, name);
					List<Map<String, Object>> hangkongList = pagination.getResultList();
					Map<String,Object> returnValue  = new HashMap<String, Object>();
					for(int i = 0 ;i<hangkongList.size();i++){
						for(Entry<String, Object> entry : hangkongList.get(i).entrySet()){
							if(entry.getValue() == null){
								entry.setValue("") ;
							}
						}
					}
					returnValue.put("total",  pagination.getTotalRows());
					returnValue.put("rows", hangkongList);	
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

}
