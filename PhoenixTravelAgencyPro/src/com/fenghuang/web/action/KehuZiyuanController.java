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
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import com.fenghuang.entiey.Jiudian;
import com.fenghuang.entiey.KuhuZiyuan;
import com.fenghuang.service.IKehuZiyuanService;
import com.fenghuang.util.DateJsonValueProcessor;
import com.fenghuang.util.Pagination;

@Controller
public class KehuZiyuanController {
	@Autowired
	public IKehuZiyuanService ikzs;
	private Object returnValue;
	// 查询
	@RequestMapping("fenghuang/KehuSelect.do")
	@ResponseBody
	public Map<String,Object> KehuSelect(HttpServletRequest request,
			HttpServletResponse response, Integer page,Integer rows,String name, String shuoming, String tishi,String type) {
		try {
			Pagination<KuhuZiyuan> pagination=(Pagination<KuhuZiyuan>)ikzs.kehuSelect(page, rows, name, shuoming, tishi, type);
			List<Map<String, Object>> kehuList = pagination.getResultList();
			Map<String,Object> returnValue  = new HashMap<String, Object>();
			for(int i = 0 ;i<kehuList.size();i++){
				for(Entry<String, Object> entry : kehuList.get(i).entrySet()){
					if(entry.getValue() == null){
						entry.setValue("") ;
					}
				}
			}
			returnValue.put("total",  pagination.getTotalRows());
			returnValue.put("rows", kehuList);	
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
		@RequestMapping("fenghuang/KehuAdd.do")
		@ResponseBody
		public Map<String,Object> KehuAdd(HttpServletRequest request,HttpServletResponse response,
				String name,String shuoming,String tishi,String type){
			
			KuhuZiyuan khzy=new KuhuZiyuan();
			khzy.setName(name);
			khzy.setShuoming(shuoming);
			khzy.setTishi(tishi);
			khzy.setType(Integer.parseInt(type));
			
			  
			  Map<String,Object> result=new HashMap<String,Object>();
			  boolean bl=false;
				try{
					ikzs.kehuAdd(khzy);
					bl=true;   
				}catch(Exception e){
					e.printStackTrace();
				}
				result.put("success", bl);
				return result;
			}
	  
		//删除
		@RequestMapping("fenghuang/KehuDelete.do")
		@ResponseBody
		public Map<String,Object> KehuDelete(HttpServletRequest request,HttpServletResponse response,long id){
			Map<String,Object> result=new HashMap<String,Object>();
			boolean bl=false;
			try{
			 bl=ikzs.kehuDelete(id);
			}catch(Exception e){
				e.printStackTrace();
			}
			result.put("success", bl);
			return result;
		}
		//按id查询
		@RequestMapping("fenghuang/KehuSelectId.do")
		@ResponseBody
		public Map<String,Object> KehuSelectId(HttpServletRequest request,HttpServletResponse response,long id){
			Map<String,Object> result=new HashMap<String,Object>();
			try{
				 List<Map<String, Object>> khlist=ikzs.kehuSelectId(id);
				 for(int i = 0 ;i<khlist.size();i++){
						for(Entry<String, Object> entry : khlist.get(i).entrySet()){
							if(entry.getValue() == null){
								entry.setValue("") ;
							}
						}
					}
					result.put("rows",khlist);
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
		@RequestMapping("fenghuang/KehuUpdate.do")
		@ResponseBody
		public Map<String,Object> KehuUpdate(HttpServletRequest request,HttpServletResponse response,
				String name,String shuoming,String tishi){

			KuhuZiyuan khzy=new KuhuZiyuan();
			khzy.setName(name);
			khzy.setShuoming(shuoming);
			khzy.setTishi(tishi);
			
			  Map<String,Object> result=new HashMap<String,Object>();
			  boolean bl=false;
				try{
					ikzs.kehuUpdate(khzy);
					bl=true;   
				}catch(Exception e){
					e.printStackTrace();
				}
				result.put("success", bl);
				return result;
			}
		


	}

