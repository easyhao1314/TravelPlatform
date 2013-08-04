package com.fenghuang.web.action;


import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.ezmorph.object.DateMorpher;
import net.sf.json.JSON;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.util.JSONUtils;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fenghuang.entiey.CustomerAreaWeihu;
import com.fenghuang.entiey.CustomerInfo;
import com.fenghuang.entiey.DictionaryDesc;
import com.fenghuang.entiey.TeamProgressStateDictionary;
import com.fenghuang.service.ICustomerCenterService;
import com.fenghuang.util.DateJsonValueProcessor;
import com.fenghuang.util.Pagination;

/**
 * 客户中心
 * @author 陈家海
 *
 */
@Controller
public class CustomerCenterController {

	@Resource
	private ICustomerCenterService iCustomerCenterService ;
	
	/**
	 * 客户信息/联系人信息列表
	 * @param request
	 * @param response
	 * @param kw 查询关键字
	 * @param page
	 * @param rows
	 */
	@RequestMapping("fenghuang/customInfoList.do")
	public void customInfoList(HttpServletRequest request,HttpServletResponse response,Integer page,Integer rows,
			String tuanNo,String name, String type, String lxr,String moblePhone,String telePhone,String qq,String msn, String daqu, String city, String hzjb, String xiaoshou,String zhtime,String jituan){
		Pagination<CustomerInfo> teams = iCustomerCenterService.getCustomInfoListPaginations(page==null?1:page, rows==null?10:rows,tuanNo,name,type,lxr,moblePhone,telePhone,qq,msn,daqu,city,hzjb,xiaoshou,zhtime,jituan);
		List<Map<String, Object>> teamsRows = teams.getResultList();
		Map<String, Object> returnValue = new HashMap<String, Object>();
		
		
		for(int i = 0 ;i<teamsRows.size();i++){
			for(Entry<String, Object> entrySet :teamsRows.get(i).entrySet()){
				
					if(entrySet.getValue() == null){
						entrySet.setValue("") ;
					}
				
			}
		}
		
		returnValue.put("total", teams.getTotalRows());
		returnValue.put("rows", teamsRows);
		//MAP中的Date类型转换成JSON格式不正确，需要转换时间格式
		JsonConfig config = new JsonConfig();
		config.registerJsonValueProcessor(Timestamp.class,new DateJsonValueProcessor("yyyy-MM-dd HH:mm:ss"));
		//把MAP转换成JSON，返回到前台
		JSONObject fromObject = JSONObject.fromObject(returnValue,config);
		System.out.println(fromObject);
		PrintWriter out =null ;
		try {
			out = response.getWriter();
			out.print(fromObject);
		} catch (IOException e) {
			e.printStackTrace();
		}
		out.flush();
	}
	
	/**
	 * 删除一条客户信息记录
	 * @param deleteRow
	 * @return
	 */
	@RequestMapping("fenghuang/deleteCustomInfo.do")
	@ResponseBody
	public Map<String ,Object> deleteCustom(String deleteRow){
		Map<String, Object> result = new HashMap<String, Object>();
		boolean isSuccess = false;
		try {
			isSuccess = iCustomerCenterService.deleteCustomById(deleteRow);
		} catch (Exception e) {
			e.printStackTrace();
		}	
		result.put("success", isSuccess);
		return result;
	}
	
	/**
	 * 新增客户信息
	 * @param customInfo
	 * @return
	 */
	@RequestMapping("/fenghuang/addCustom.do")
	@ResponseBody
	public Map<String,Object> addCustom(CustomerInfo customInfo){
		Map<String, Object> result = new HashMap<String, Object>();
		boolean isSuccess = false;
		try {
			isSuccess = iCustomerCenterService.addCustom(customInfo);
		} catch (Exception e) {
			e.printStackTrace();
		}	
		result.put("success", isSuccess);
		return result ; 
	}
		
	
	/**
	 * 将JSON中NULL数据转换成空字符串
	 * @param resultSet
	 */
	private void setJsonValueToEmptyString(List<Map<String,Object>> resultSet){
		if(resultSet!=null){
			for(int i = 0 ;i<resultSet.size();i++){
				for(Entry<String, Object> entry : resultSet.get(i).entrySet()){
					if(entry.getValue() == null){
						entry.setValue("") ;
					}
				}
			}
		}
	}
	
	/**
	 * 修改前， 准备客户信息数据
	 * @param updateId
	 * @return
	 */
	@RequestMapping("/fenghuang/preparedCustomInfo.do")
	@ResponseBody
	public Map<String ,Object> preparedUpdateCustom(String updateId){
		Map<String, Object> result = new HashMap<String, Object>();
		
		List<Map<String,Object>> customInfo = iCustomerCenterService.findCustomerInfoById(updateId);
		//JSON数据中有NULL值。不能进入回调函数。把所有NULL都设置成"".
		setJsonValueToEmptyString(customInfo);
		result.put("rows", customInfo);
		JSONObject fromObject = JSONObject.fromObject(result);
		return fromObject ; 
	}
	//修改客户信息面板模式
	@RequestMapping("fenghuang/updateCustomer.do")
	@ResponseBody
	public Map<String,Object> updateCustomer(HttpServletRequest request,
			HttpServletResponse response,CustomerInfo customer){
		Map<String,Object> result=new HashMap<String,Object>();
		boolean isSuccess=false;
		try{
			isSuccess=iCustomerCenterService.updateCustom(customer);
		}catch(Exception e){
			e.printStackTrace();
		}
		result.put("success", isSuccess);
		return result;
	}
	/**
	 * 修改客户信息
	 * @param customerInfo
	 * @return
	 */
	@RequestMapping("fenghuang/updateCustom.do")
	@ResponseBody
	public Map<String , Object> updateCostom(HttpServletRequest request,
			HttpServletResponse response,String updateRows){
		response.setContentType("application/json;charset=UTF-8");
		response.setCharacterEncoding("utf-8");

		Map<String,Object>  result = new HashMap<String, Object>();
		 JSONUtils.getMorpherRegistry().registerMorpher( new  DateMorpher( new String[]{
                 "yyyy-MM-dd HH:mm:ss" ,
                 "yyyy-MM-dd"
        })); 
		
		JSONArray jsonArray = JSONArray.fromObject(updateRows);
		List<CustomerInfo> Cust = JSONArray.toList(jsonArray,CustomerInfo.class);
		boolean isSuccess = false ;
		try {
			isSuccess = iCustomerCenterService.updatekehuzhongxin(Cust);
		} catch (Exception e) {
			e.printStackTrace();
		}
		result.put("success", isSuccess);
		return result  ;
	}
	/**转移销售
	 * 
	 * @param customerInfo
	 * @return
	 */
	@RequestMapping("fenghuang/updateXiaoshou.do")
	@ResponseBody
	public Map<String , Object> updateXiaoshou(CustomerInfo Customer){
		Map<String , Object> result = new HashMap<String ,Object>();
		boolean isSuccess = false ;
		try {
			isSuccess = iCustomerCenterService.updateXiaoshou(Customer);
		} catch (Exception e) {
			e.printStackTrace();
		}
		result.put("success", isSuccess);
		return result  ;
	}
	
	
	
}
