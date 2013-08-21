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
import com.fenghuang.entiey.Dingdaoyou;
import com.fenghuang.service.IdingdaoyouService;
import com.fenghuang.util.DateJsonValueProcessor;
import com.fenghuang.util.Pagination;

@Controller
public class DingdaoyouController {
	@Autowired
	IdingdaoyouService iddys;
	//添加
			@RequestMapping("fenghuang/dingdaoyouAdd.do")
			@ResponseBody
			public Map<String,Object> dingdaoyouAdd(HttpServletRequest request,HttpServletResponse response,
					String tuanNo,String daoyouId,String beizhu){
				Dingdaoyou ddy=new Dingdaoyou();
				ddy.setTuanNo(tuanNo);
				if(daoyouId!=null && !"".equals(daoyouId)){
				ddy.setDaoyouId(Integer.parseInt(daoyouId));
				}
				ddy.setBeizhu(beizhu);
				  Map<String,Object> result=new HashMap<String,Object>();
				  boolean bl=false;
					try{
						iddys.dingdaoyouAdd(ddy);
						bl=true;   
					}catch(Exception e){
						e.printStackTrace();
					}
					result.put("success", bl);
					return result;
				}
			//修改
			@RequestMapping("fenghuang/dingdaoyouUpdate.do")
			@ResponseBody
			public Map<String,Object> dingdaoyouUpdate(HttpServletRequest request,HttpServletResponse response,
					String tuanNo,String daoyouId,String beizhu){
				Dingdaoyou ddy=new Dingdaoyou();
				ddy.setTuanNo(tuanNo);
				if(daoyouId!=null && !"".equals(daoyouId)){
				ddy.setDaoyouId(Integer.parseInt(daoyouId));
				}
				ddy.setBeizhu(beizhu);
				  Map<String,Object> result=new HashMap<String,Object>();
				  boolean bl=false;
					try{
						iddys.dingdaoyouUpdate(ddy);
						bl=true;   
					}catch(Exception e){
						e.printStackTrace();
					}
					result.put("success", bl);
					return result;
				}
			// 查询
			@RequestMapping("fenghuang/dingdaoyouSelect.do")
			@ResponseBody
			public Map<String,Object> dingdaoyouSelect(HttpServletRequest request,HttpServletResponse response,
					 Integer page,Integer rows,Dingdaoyou ddy){
				try {
					Pagination<Dingdaoyou> pagination=(Pagination<Dingdaoyou>)iddys.dingdaoyouSelect(page, rows, ddy);
					List<Map<String, Object>> dingdaoyouList = pagination.getResultList();
					Map<String,Object> returnValue  = new HashMap<String, Object>();
					for(int i = 0 ;i<dingdaoyouList.size();i++){
						for(Entry<String, Object> entry : dingdaoyouList.get(i).entrySet()){
							if(entry.getValue() == null){
								entry.setValue("") ;
							}
						}
					}
					returnValue.put("total",  pagination.getTotalRows());
					returnValue.put("rows", dingdaoyouList);	
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
}
