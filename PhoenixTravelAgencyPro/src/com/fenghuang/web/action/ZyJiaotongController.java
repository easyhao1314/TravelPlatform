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

import com.fenghuang.entiey.Jiaotong;
import com.fenghuang.entiey.Jiudian;
import com.fenghuang.service.IZyJiaotongService;
import com.fenghuang.util.DateJsonValueProcessor;
import com.fenghuang.util.Pagination;

@Controller
public class ZyJiaotongController {
	
	@Autowired
	public IZyJiaotongService izjs;
	private Object returnValue;
	
	@RequestMapping("fenghuang/jiaotongSelect.do")
	@ResponseBody
	public Map<String,Object> jiaotongSelect(HttpServletRequest request,
			HttpServletResponse response, Integer page,Integer rows,String name,String chengshiId,String lianxiren,String hzjbId){
       try{
    	   Pagination<Jiaotong> pagination=(Pagination<Jiaotong>)izjs.jiaotongSelect(page, rows	,name,chengshiId,lianxiren,hzjbId);
			List<Map<String, Object>> jiaotongList = pagination.getResultList();
			Map<String,Object> returnValue  = new HashMap<String, Object>();
			for(int i = 0 ;i<jiaotongList.size();i++){
				for(Entry<String, Object> entry : jiaotongList.get(i).entrySet()){
					if(entry.getValue() == null){
						entry.setValue("") ;
					}
				}
			}
			returnValue.put("total",  pagination.getTotalRows());
			returnValue.put("rows", jiaotongList);	
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
	
	@RequestMapping("fenghuang/jiaotongAdd.do")
	@ResponseBody
	public Map<String,Object> jiaotongAdd(HttpServletRequest request,HttpServletResponse response,
			String name,String lianxiren,int chengshiId,String dizhi,int dianhua,int shouji,String email,
			String chuanzhen,String wangzhi,int jiage,int hzjbId,int whfsid,String beizhu){
		 Jiaotong jt=new Jiaotong();
		 jt.setName(name);
		 jt.setLianxiren(lianxiren);
		 jt.setChengshiId(chengshiId);
		 jt.setDizhi(dizhi);
		 jt.setDianhua(dianhua);
		 jt.setShouji(shouji);
		 jt.setEmail(email);
		 jt.setChuanzhen(chuanzhen);
		 jt.setWangzhi(wangzhi);
         jt.setJiage(jiage);
         jt.setHzjbId(hzjbId);
         jt.setWhfsid(whfsid);
         jt.setBeizhu(beizhu);
         Map<String,Object> result=new HashMap<String,Object>();
         boolean bl=false;
		try{
		  bl=izjs.jiaotongAdd(jt);
		}catch(Exception e){
			e.printStackTrace();
		}
		result.put("success", bl);
		return result;
     }

	@RequestMapping("fenghuang/jiaotongDelete.do")
	@ResponseBody
	public Map<String,Object> jiaotongDelete(HttpServletRequest request,HttpServletResponse response,long id){
		Map<String,Object> result=new HashMap<String,Object>();
		boolean bl=false;
      try{
		 bl=izjs.jiaotongDelete(id);
		}catch(Exception e){
			e.printStackTrace();
		}
      result.put("success", bl);
		return result;
	}
	@RequestMapping("fenghuang/jiaotongUpdate.do")
	@ResponseBody
	public Map<String,Object> jiaotongUpdate(HttpServletRequest request,HttpServletResponse response,
			String name,String lianxiren,int chengshiId,String dizhi,int dianhua,int shouji,String email,
			String chuanzhen,String wangzhi,int jiage,int hzjbId,int whfsid,String beizhu,long id){
		 Jiaotong jt=new Jiaotong();
		 jt.setName(name);
		 jt.setLianxiren(lianxiren);
		 jt.setChengshiId(chengshiId);
		 jt.setDizhi(dizhi);
		 jt.setDianhua(dianhua);
		 jt.setShouji(shouji);
		 jt.setEmail(email);
		 jt.setChuanzhen(chuanzhen);
		 jt.setWangzhi(wangzhi);
         jt.setJiage(jiage);
         jt.setHzjbId(hzjbId);
         jt.setWhfsid(whfsid);
         jt.setBeizhu(beizhu);
		 jt.setId(id);
		Map<String,Object> result=new HashMap<String,Object>();
		boolean bl=false;
       try{
		bl=	izjs.jiaotongUpdate(jt);
		}catch(Exception e){
			e.printStackTrace();
		} 
       result.put("success", bl);
		return result;
	}
	@RequestMapping("fenghuang/jiaotongSelectId.do")
	@ResponseBody
	public Map<String,Object> jiaotongSelectId(HttpServletRequest request,
			HttpServletResponse response, Integer page,Integer rows,long id){
		Map<String,Object> result=new HashMap<String,Object>();
		try{
			 List<Map<String, Object>> jtlist=izjs.jiaotongSelectId(id);
			 for(int i = 0 ;i<jtlist.size();i++){
					for(Entry<String, Object> entry : jtlist.get(i).entrySet()){
						if(entry.getValue() == null){
							entry.setValue("") ;
						}
					}
				}
				result.put("rows",jtlist);
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