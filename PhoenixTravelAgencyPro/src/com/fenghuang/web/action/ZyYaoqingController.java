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
import com.fenghuang.entiey.Yaoqinghan;
import com.fenghuang.service.IZyYaoqingService;
import com.fenghuang.util.DateJsonValueProcessor;
import com.fenghuang.util.Pagination;

@Controller
public class ZyYaoqingController {
	@Autowired
	public IZyYaoqingService izys;
	private Object returnValue;
	// 查询
	@RequestMapping("fenghuang/yaoqinghanSelect.do")
	@ResponseBody
	public Map<String,Object> yaoqinghanSelect(HttpServletRequest request,
			HttpServletResponse response, Integer page,Integer rows,String guoduid,String miaoshu) {
		try {
			Pagination<Yaoqinghan> pagination=(Pagination<Yaoqinghan>)izys.yaoqingSelect(page, rows,guoduid,miaoshu);
			List<Map<String, Object>> yaoqingList = pagination.getResultList();
			Map<String,Object> returnValue  = new HashMap<String, Object>();
			for(int i = 0 ;i<yaoqingList.size();i++){
				for(Entry<String, Object> entry : yaoqingList.get(i).entrySet()){
					if(entry.getValue() == null){
						entry.setValue("") ;
					}
				}
			}
			returnValue.put("total",  pagination.getTotalRows());
			returnValue.put("rows", yaoqingList);	
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
		@RequestMapping("fenghuang/yaoqingAdd.do")
		@ResponseBody
		public Map<String,Object> yaoqingAdd(HttpServletRequest request,HttpServletResponse response,
				String guoduid,String miaoshu,String chengben,String bizhongId,String shiyongid){
			Yaoqinghan yq=new Yaoqinghan();
		    if(guoduid !=null &&!"".equals(guoduid)){			
			yq.setGuoduid(Integer.parseInt(guoduid));
		    }
		    if(miaoshu !=null &&!"".equals(miaoshu)){
			yq.setMiaoshu(miaoshu);
		    }
		    if(chengben !=null &&!"".equals(chengben)){
			 yq.setChengben(chengben);
		    }
			 if(bizhongId !=null &&!"".equals(bizhongId)){
			 yq.setBizhongId(Integer.parseInt(bizhongId));
			 }
			 if(shiyongid !=null &&!"".equals(shiyongid)){
			 yq.setShiyongid(Integer.parseInt(shiyongid));
			 }
			  Map<String,Object> result=new HashMap<String,Object>();
			  boolean bl=false;
				try{
					izys.yaoqingAdd(yq);
					bl=true;   
				}catch(Exception e){
					e.printStackTrace();
				}
				result.put("success", bl);
				return result;
			}
	  
		//删除
		@RequestMapping("fenghuang/yaoqingDelete.do")
		@ResponseBody
		public Map<String,Object> yaoqingDelete(HttpServletRequest request,HttpServletResponse response,long id){
			Map<String,Object> result=new HashMap<String,Object>();
			boolean bl=false;
			try{
			 bl=izys.yaoqingDelete(id);
			}catch(Exception e){
				e.printStackTrace();
			}
			result.put("success", bl);
			return result;
		}
		//按id查询
		@RequestMapping("fenghuang/yaoqingSelectId.do")
		@ResponseBody
		public Map<String,Object> yaoqingSelectId(HttpServletRequest request,HttpServletResponse response,long id){
			Map<String,Object> result=new HashMap<String,Object>();
			try{
				 List<Map<String, Object>> yqlist=izys.yaoqingSelectId(id);
				 for(int i = 0 ;i<yqlist.size();i++){
						for(Entry<String, Object> entry : yqlist.get(i).entrySet()){
							if(entry.getValue() == null){
								entry.setValue("") ;
							}
						}
					}
					result.put("rows",yqlist);
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
		@RequestMapping("fenghuang/yaoqingUpdate.do")
		@ResponseBody
		public Map<String,Object> yaoqingUpdate(HttpServletRequest request,HttpServletResponse response,
				String guoduid,String miaoshu,String chengben,String bizhongId,String shiyongid,long id){
			Yaoqinghan yq=new Yaoqinghan();

			if(guoduid !=null &&!"".equals(guoduid)){			
				yq.setGuoduid(Integer.parseInt(guoduid));
			    }
			yq.setMiaoshu(miaoshu);
			yq.setChengben(chengben);
		   if(guoduid !=null &&!"".equals(guoduid)){
				 yq.setBizhongId(Integer.parseInt(bizhongId));
				 }
			if(shiyongid !=null &&!"".equals(shiyongid)){
				 yq.setShiyongid(Integer.parseInt(shiyongid));
				 }
			  yq.setId(id);
			
			  Map<String,Object> result=new HashMap<String,Object>();
			  boolean bl=false;
				try{
					izys.yaoqingUpdate(yq);
					bl=true;   
				}catch(Exception e){
					e.printStackTrace();
				}
				result.put("success", bl);
				return result;
			}
		


	
}
