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


import com.fenghuang.entiey.Jiudian;
import com.fenghuang.entiey.Zifei;
import com.fenghuang.service.IZyZifeiService;
import com.fenghuang.util.DateJsonValueProcessor;
import com.fenghuang.util.Pagination;
@Controller
public class ZyZifeiController {
	@Autowired
	public IZyZifeiService izzs;
	private Object returnValue;
	// 查询
	@RequestMapping("fenghuang/zifeiSelect.do")
	@ResponseBody
	public Map<String,Object> zifeiSelect(HttpServletRequest request,
			HttpServletResponse response, Integer page,Integer rows,String name,String chengshiId,String miaoshu) {
		try {
			Pagination<Zifei> pagination=(Pagination<Zifei>)izzs.zifeiSelect(page, rows,name,chengshiId,miaoshu);
			List<Map<String, Object>> zifeiList = pagination.getResultList();
			Map<String,Object> returnValue  = new HashMap<String, Object>();
			for(int i = 0 ;i<zifeiList.size();i++){
				for(Entry<String, Object> entry : zifeiList.get(i).entrySet()){
					if(entry.getValue() == null){
						entry.setValue("") ;
					}
				}
			}
			returnValue.put("total",  pagination.getTotalRows());
			returnValue.put("rows", zifeiList);	
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
	//添加
		@RequestMapping("fenghuang/zifeiAdd.do")
		@ResponseBody
		public Map<String,Object> zifeiAdd(HttpServletRequest request,HttpServletResponse response,
				long id,String name,int feiyong,int bizhongId,int chengshiId,String kftimeqi,
				String kftimezhi,int timekb,int djaptime,String miaoshu){
			Zifei zf=new Zifei();
			zf.setId(id);
			zf.setName(name);
			zf.setFeiyong(feiyong);
			zf.setBizhongId(bizhongId);
			zf.setChengshiId(chengshiId);
			zf.setKftimeqi(kftimeqi);
			zf.setKftimezhi(kftimezhi);
			zf.setTimekb(timekb);
			zf.setDjaptime(djaptime);
			zf.setMiaoshu(miaoshu);
			  Map<String,Object> result=new HashMap<String,Object>();
			  boolean bl=false;
				try{
					izzs.zifeiAdd(zf);
					bl=true;   
				}catch(Exception e){
					e.printStackTrace();
				}
				result.put("success", bl);
				return result;
			}
	  
		//删除
		@RequestMapping("fenghuang/zifeiDelete.do")
		@ResponseBody
		public Map<String,Object> zifeiDelete(HttpServletRequest request,HttpServletResponse response,long id){
			Map<String,Object> result=new HashMap<String,Object>();
			boolean bl=false;
			try{
			 bl=izzs.zifeiDelete(id);
			}catch(Exception e){
				e.printStackTrace();
			}
			result.put("success", bl);
			return result;
		}
		//按id查询
		@RequestMapping("fenghuang/zifeiSelectId.do")
		@ResponseBody
		public Map<String,Object> zifeiSelectId(HttpServletRequest request,HttpServletResponse response,long id){
			Map<String,Object> result=new HashMap<String,Object>();
			try{
				 List<Map<String, Object>> zifeilist=izzs.zifeiSelectId(id);
				 for(int i = 0 ;i<zifeilist.size();i++){
						for(Entry<String, Object> entry : zifeilist.get(i).entrySet()){
							if(entry.getValue() == null){
								entry.setValue("") ;
							}
						}
					}
					result.put("rows",zifeilist);
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
		// 修改
		@RequestMapping("fenghuang/zifeiUpdate.do")
		@ResponseBody
		public Map<String,Object> zifeiUpdate(HttpServletRequest request,HttpServletResponse response,
				String name,int feiyong,int bizhongId,int chengshiId,String kftimeqi,
				String kftimezhi,int timekb,int djaptime,String miaoshu,long id){
			Zifei zf=new Zifei();

			zf.setName(name);
			zf.setFeiyong(feiyong);
			zf.setBizhongId(bizhongId);
			zf.setChengshiId(chengshiId);
			zf.setKftimeqi(kftimeqi);
			zf.setKftimezhi(kftimezhi);
			zf.setTimekb(timekb);
			zf.setDjaptime(djaptime);
			zf.setMiaoshu(miaoshu);
			zf.setId(id);
			  
			  Map<String,Object> result=new HashMap<String,Object>();
			  boolean bl=false;
				try{
					izzs.zifeiUpdate(zf);
					bl=true;   
				}catch(Exception e){
					e.printStackTrace();
				}
				result.put("success", bl);
				return result;
			}
		



}
