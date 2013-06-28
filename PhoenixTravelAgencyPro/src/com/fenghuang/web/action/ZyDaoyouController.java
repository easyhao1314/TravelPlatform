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

import com.fenghuang.entiey.Daoyou;
import com.fenghuang.entiey.Hangkong;
import com.fenghuang.service.IZyDaoyouService;
import com.fenghuang.service.IZyHangkongService;
import com.fenghuang.util.DateJsonValueProcessor;
import com.fenghuang.util.Pagination;

@Controller
public class ZyDaoyouController {
	@Autowired
	public IZyDaoyouService izds;
	private Object returnValue;
	
	@RequestMapping("fenghuang/daoyouSelect.do")
	@ResponseBody
	public Map<String,Object> daoyouSelect(HttpServletRequest request,
			HttpServletResponse response, Integer page,Integer rows){
		 try{
	    	   Pagination<Daoyou> pagination=(Pagination<Daoyou>)izds.daoyouSelect(page, rows);
				List<Map<String, Object>> daoyouList = pagination.getResultList();
				Map<String,Object> returnValue  = new HashMap<String, Object>();
				for(int i = 0 ;i<daoyouList.size();i++){
					for(Entry<String, Object> entry : daoyouList.get(i).entrySet()){
						if(entry.getValue() == null){
							entry.setValue("") ;
						}
					}
				}
				returnValue.put("total",  pagination.getTotalRows());
				returnValue.put("rows", daoyouList);	
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

	@RequestMapping("fenghuang/daoyouAdd.do")
	@ResponseBody
	public Map<String,Object> daoyouAdd(HttpServletRequest request,HttpServletResponse response,
			long id,long guojiaId,String name,String name2,String name3,String zjlx,String zjhm,int chengshiId,String dinhua,String lxfs1,String lxfs2,
			String lxfs3,String email,String shouji,String fax,int dyfy,int hzjbId,String bz){
		Daoyou dy=new Daoyou();
		dy.setId(id);
		dy.setGuojiaId(guojiaId);
		dy.setName(name);
		dy.setName2(name2);
		dy.setName3(name3);
		dy.setZjlx(zjlx);
		dy.setZjhm(zjhm);
		dy.setChengshiId(chengshiId);
		dy.setDinhua(dinhua);
		dy.setLxfs1(lxfs1);
		dy.setLxfs2(lxfs2);
		dy.setLxfs3(lxfs3);
        dy.setEmail(email);
        dy.setShouji(shouji);
        dy.setFax(fax);
        dy.setDyfy(dyfy);
        dy.setHzjbId(hzjbId);
        dy.setBz(bz);
         Map<String,Object> result=new HashMap<String,Object>();
         boolean bl=false;
		try{
		  bl=izds.daoyouAdd(dy);
		}catch(Exception e){
			e.printStackTrace();
		}
		result.put("success", bl);
		return result;
     }

	@RequestMapping("fenghuang/daoyouDelete.do")
	@ResponseBody
	public Map<String,Object> daoyouDelete(HttpServletRequest request,HttpServletResponse response,long id){
		Map<String,Object> result=new HashMap<String,Object>();
		boolean bl=false;
      try{
		 bl=izds.daoyouDelete(id);
		}catch(Exception e){
			e.printStackTrace();
		}
      result.put("success", bl);
		return result;
	}
	@RequestMapping("fenghuang/daoyouUpdate.do")
	@ResponseBody
	public Map<String,Object> daoyouUpdate(HttpServletRequest request,HttpServletResponse response,
			long guojiaId,String name,String name2,String name3,String zjlx,String zjhm,int chengshiId,String dinhua,String lxfs1,String lxfs2,
			String lxfs3,String email,String shouji,String fax,int dyfy,int hzjbId,String bz,long id){
		Daoyou dy=new Daoyou();

		dy.setGuojiaId(guojiaId);
		dy.setName(name);
		dy.setName2(name2);
		dy.setName3(name3);
		dy.setZjlx(zjlx);
		dy.setZjhm(zjhm);
		dy.setChengshiId(chengshiId);
		dy.setDinhua(dinhua);
		dy.setLxfs1(lxfs1);
		dy.setLxfs2(lxfs2);
		dy.setLxfs3(lxfs3);
        dy.setEmail(email);
        dy.setShouji(shouji);
        dy.setFax(fax);
        dy.setDyfy(dyfy);
        dy.setHzjbId(hzjbId);
        dy.setBz(bz);
		dy.setId(id);
		Map<String,Object> result=new HashMap<String,Object>();
		boolean bl=false;
       try{
		bl=	izds.daoyouUpdate(dy);
		}catch(Exception e){
			e.printStackTrace();
		} 
       result.put("success", bl);
		return result;
	}
	@RequestMapping("fenghuang/daoyouSelectId.do")
	@ResponseBody
	public Map<String,Object> daoyouSelectId(HttpServletRequest request,
			HttpServletResponse response, Integer page,Integer rows,long id){
		Map<String,Object> result=new HashMap<String,Object>();
		try{
			 List<Map<String, Object>> dylist=izds.daoyouSelectId(id);
			 for(int i = 0 ;i<dylist.size();i++){
					for(Entry<String, Object> entry : dylist.get(i).entrySet()){
						if(entry.getValue() == null){
							entry.setValue("") ;
						}
					}
				}
				result.put("rows",dylist);
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
		@RequestMapping("fenghuang/daoyouSelectLike.do")
		@ResponseBody
			public Map<String,Object> daoyouSelectLike(HttpServletRequest request,HttpServletResponse response,
					Integer page,Integer rows,String daima,int chengshi){
				try{
					Pagination<Daoyou> pagination=(Pagination<Daoyou>)izds.daoyouSelectLike(page, rows, daima, chengshi);
					List<Map<String, Object>> daoyouList = pagination.getResultList();
					Map<String,Object> returnValue  = new HashMap<String, Object>();
					for(int i = 0 ;i<daoyouList.size();i++){
						for(Entry<String, Object> entry : daoyouList.get(i).entrySet()){
							if(entry.getValue() == null){
								entry.setValue("") ;
							}
						}
					}
					returnValue.put("total",  pagination.getTotalRows());
					returnValue.put("rows", daoyouList);	
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
