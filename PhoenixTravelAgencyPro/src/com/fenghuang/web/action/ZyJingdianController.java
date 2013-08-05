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

import com.fenghuang.entiey.Jingdian;
import com.fenghuang.service.IZyHangkongService;
import com.fenghuang.service.IZyJingdianService;
import com.fenghuang.util.DateJsonValueProcessor;
import com.fenghuang.util.Pagination;

@Controller
public class ZyJingdianController {
	@Autowired
	public IZyJingdianService izjs;
	private Object returnValue;
	
	@RequestMapping("fenghuang/JingdianSelect.do")
	@ResponseBody
	public Map<String,Object> jingdianSelect(HttpServletRequest request,
			HttpServletResponse response, Integer page,Integer rows,String name,String chengsiId,String jiage){
		 try{
	    	   Pagination<Jingdian> pagination=(Pagination<Jingdian>)izjs.jingdianSelect(page, rows,name,chengsiId,jiage);
				List<Map<String, Object>> jingdanList = pagination.getResultList();
				Map<String,Object> returnValue  = new HashMap<String, Object>();
				for(int i = 0 ;i<jingdanList.size();i++){
					for(Entry<String, Object> entry : jingdanList.get(i).entrySet()){
						if(entry.getValue() == null){
							entry.setValue("") ;
						}
					}
				}
				returnValue.put("total",  pagination.getTotalRows());
				returnValue.put("rows", jingdanList);	
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

	@RequestMapping("fenghuang/jingdanAdd.do")
	@ResponseBody
	public Map<String,Object> jingdianAdd(HttpServletRequest request,HttpServletResponse response,
			String name,String name2,String chengsiId,String jiage,String bizongId,String kftimeqi,
			String kftimezhi,String timekb,String lianxiren,String dianhua,String chuanzhen,String email,
			String dcmr,String dizhi,String ywdz,String jdms){
		Jingdian jd=new Jingdian();
		
		jd.setName(name);
		jd.setName2(name2);
		if(chengsiId !=null && !"".equals(chengsiId)){
		jd.setChengsiId(Integer.parseInt(chengsiId));
		}
		if(jiage !=null && !"".equals(jiage)){
		jd.setJiage(Integer.parseInt(jiage));
		}
		 if(bizongId !=null && !"".equals(bizongId)){
		jd.setBizongId(Integer.parseInt(bizongId));
		 }
		jd.setKftimeqi(kftimeqi);
		jd.setKftimezhi(kftimezhi);
		 if(timekb !=null && !"".equals(timekb)){
		jd.setTimekb(Integer.parseInt(timekb));
		 }
		jd.setLianxiren(lianxiren);
		jd.setDianhua(dianhua);
		jd.setChuanzhen(chuanzhen);
		jd.setEmail(email);
		 if(dcmr !=null && !"".equals(dcmr)){
		jd.setDcmr(Integer.parseInt(dcmr));
		 }
		jd.setDizhi(dizhi);
		jd.setYwdz(ywdz);
		jd.setJdms(jdms);
		
         Map<String,Object> result=new HashMap<String,Object>();
         boolean bl=false;
		try{
		  bl=izjs.jingdianAdd(jd);
		}catch(Exception e){
			e.printStackTrace();
		}
		result.put("success", bl);
		return result;
     }

	@RequestMapping("fenghuang/jingdianDelete.do")
	@ResponseBody
	public Map<String,Object> jingdianDelete(HttpServletRequest request,HttpServletResponse response,long id){
		Map<String,Object> result=new HashMap<String,Object>();
		boolean bl=false;
      try{
		 bl=izjs.jingdianDelete(id);
		}catch(Exception e){
			e.printStackTrace();
		}
      result.put("success", bl);
		return result;
	}
	@RequestMapping("fenghuang/jingdianUpdate.do")
	@ResponseBody
	public Map<String,Object> jingdianUpdate(HttpServletRequest request,HttpServletResponse response,
			String name,String name2,String chengsiId,String jiage,String bizongId,String kftimeqi,
			String kftimezhi,String timekb,String lianxiren,String dianhua,String chuanzhen,String email,
			String dcmr,String dizhi,String ywdz,String jdms,long id){
		Jingdian jd=new Jingdian();

		jd.setName(name);
		jd.setName2(name2);
		if(chengsiId !=null && !"".equals(chengsiId)){
		jd.setChengsiId(Integer.parseInt(chengsiId));
		}
		if(jiage !=null && !"".equals(jiage)){
		jd.setJiage(Integer.parseInt(jiage));
		}
		 if(bizongId !=null && !"".equals(bizongId)){
		jd.setBizongId(Integer.parseInt(bizongId));
		 }
		jd.setKftimeqi(kftimeqi);
		jd.setKftimezhi(kftimezhi);
		 if(timekb !=null && !"".equals(timekb)){
		jd.setTimekb(Integer.parseInt(timekb));
		 }
		jd.setLianxiren(lianxiren);
		jd.setDianhua(dianhua);
		jd.setChuanzhen(chuanzhen);
		jd.setEmail(email);
		if(timekb !=null && !"".equals(timekb)){
		jd.setDcmr(Integer.parseInt(dcmr));
		}
		jd.setDizhi(dizhi);
		jd.setYwdz(ywdz);
		jd.setJdms(jdms);
		jd.setId(id);	
		Map<String,Object> result=new HashMap<String,Object>();
		boolean bl=false;
       try{
		bl=	izjs.jingdianUpdate(jd);
		}catch(Exception e){
			e.printStackTrace();
		} 
       result.put("success", bl);
		return result;
	}
	@RequestMapping("fenghuang/jingdianSelectId.do")
	@ResponseBody
	public Map<String,Object> jingdianSelectId(HttpServletRequest request,
			HttpServletResponse response, Integer page,Integer rows,long id){
		Map<String,Object> result=new HashMap<String,Object>();
		try{
			 List<Map<String, Object>> jdlist=izjs.jingdianSelectId(id);
			 for(int i = 0 ;i<jdlist.size();i++){
					for(Entry<String, Object> entry : jdlist.get(i).entrySet()){
						if(entry.getValue() == null){
							entry.setValue("") ;
						}
					}
				}
				result.put("rows",jdlist);
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

