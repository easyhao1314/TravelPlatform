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

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
	@RequestMapping("/fenghuang/customInfoList.do")
	public void customInfoList(HttpServletRequest request,HttpServletResponse response,String kw,Integer page,Integer rows){
		Pagination<CustomerInfo> teams = iCustomerCenterService.getCustomInfoListPaginations(page==null?1:page, rows==null?10:rows,kw);
		List<Map<String, Object>> teamsRows = teams.getResultList();
		Map<String, Object> returnValue = new HashMap<String, Object>();
		
		
		for(int i = 0 ;i<teamsRows.size();i++){
			for(Entry<String, Object> entrySet :teamsRows.get(i).entrySet()){
				if("city".equals(entrySet.getKey())){
					if(entrySet.getValue()!=null){
						String name = iCustomerCenterService.findCityNameById((Long)entrySet.getValue());
						teamsRows.get(i).put("cityName", name);
						break;
					}
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
	@RequestMapping("/fenghuang/deleteCustomInfo.do")
	@ResponseBody
	public Map<String ,Object> deleteCustom(String deleteRow){
		Map<String, Object> result = new HashMap<String, Object>();
		boolean isSuccess = false;
		try {
			isSuccess = iCustomerCenterService.deleteCustom(deleteRow);
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
	 * 准备数据：客户名称和城市名， 用于下拉框显示
	 * @return
	 */
	@RequestMapping("/fenghuang/findCustomAndCityName.do")
	@ResponseBody
	public Map<String ,Object> selectCustomNameAndCity(){
		Map<String, Object> result = new HashMap<String, Object>();
		//所有客户名称
		List<Map<String,Object>> nameList = iCustomerCenterService.findAllCustomName();
		//所有城市名称
		List<Map<String,Object>> cityList = iCustomerCenterService.findAllCityName();
		//所有省份名称
		List<Map<String,Object>> provinceList = iCustomerCenterService.findAllProvionceName();
		result.put("customNames", nameList);
		result.put("cityNames", cityList);
		result.put("provinceNames", provinceList);
		//把MAP转换成JSON，返回到前台
		JSONObject fromObject = JSONObject.fromObject(result);
		return fromObject ; 
	}
	
	/**
	 * 新增联系人信息
	 * @param contactInfo
	 * @param nameId
	 * @return
	 */
	@RequestMapping("/fenghuang/addContact.do")
	@ResponseBody
	public Map<String ,Object> addContact(CustomerInfo contactInfo){
		Map<String, Object> result = new HashMap<String, Object>();
		boolean isSuccess = false ; 
		try{
			//根据城市Id查询省份
			long provinceId = iCustomerCenterService.findProvinceByCityId(contactInfo.getCity());
			contactInfo.setProvince(provinceId);
			isSuccess = iCustomerCenterService.addCustom(contactInfo);
		}catch(Exception e) {
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
	
	
	
	/**
	 * 修改客户信息
	 * @param customerInfo
	 * @return
	 */
	@RequestMapping("/fenghuang/updateCustom.do")
	@ResponseBody
	public Map<String , Object> updateCostom(CustomerInfo customerInfo){
		Map<String , Object> result = new HashMap<String ,Object>();
		boolean isSuccess = false ;
		try {
			isSuccess = iCustomerCenterService.updateCustom(customerInfo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		result.put("success", isSuccess);
		return result  ;
	}
	
	
	/**
	 * 修改联系人信息
	 * @param customerInfo
	 * @return
	 */
	@RequestMapping("/fenghuang/updateContact.do")
	@ResponseBody
	public Map<String , Object> updateContact(CustomerInfo contactInfo){
		Map<String , Object> result = new HashMap<String ,Object>();
		boolean isSuccess = false ;
		try {
			long provinceId = iCustomerCenterService.findProvinceByCityId(contactInfo.getCity());
			contactInfo.setProvince(provinceId);
			isSuccess = iCustomerCenterService.updateContact(contactInfo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		result.put("success", isSuccess);
		return result  ;
	}
	
	/**
	 * 客户VIP字典列表
	 * @param page
	 * @param rows
	 * @return
	 */
	@RequestMapping("/fenghuang/customerVIPDic.do")
	@ResponseBody
	public Map<String,Object> CustomerVIPList(Integer page,Integer rows){
		Pagination<TeamProgressStateDictionary> teams = iCustomerCenterService.getCustomVIPListPaginations(page,rows);
		List<Map<String, Object>> teamsRows = teams.getResultList();
		
		Map<String, Object> returnValue = new HashMap<String, Object>();
		setJsonValueToEmptyString(teamsRows);
		returnValue.put("total", teams.getTotalRows());
		returnValue.put("rows", teamsRows);
		
		JSONObject fromObject = JSONObject.fromObject(returnValue);
		
		return fromObject ;
	}
	
	/**
	 * 新增客户VIP
	 */
	@RequestMapping("/fenghuang/addCustomerVIP.do")
	@ResponseBody
	public Map<String , Object> addCustomVIP(@RequestBody TeamProgressStateDictionary team){
		Map<String ,Object> result = new HashMap<String ,Object>();
		boolean isSuccess = false ; 
		try {
			isSuccess = iCustomerCenterService.addCustomVIP(team);
		} catch (Exception e) {
			e.printStackTrace();
		}
		result.put("success", isSuccess);
		return result ;
	}
	
	/**
	 * 删除客户VIP
	 * @param deleteRow
	 * @return
	 */
	@RequestMapping("/fenghuang/deleteCustomVIP.do")
	@ResponseBody
	public Map<String ,Object> deleteCustomVIP(String deleteRow){
		Map<String ,Object> result = new HashMap<String, Object>();
		boolean isSuccess = false ;
		try {
			isSuccess = iCustomerCenterService.deleteCustomVIP(deleteRow);
		} catch (Exception e) {
			e.printStackTrace();
		}
		result.put("success", isSuccess);
		return result ;
	}
	
	/**
	 * 修改客户VIP
	 * @param updateRow
	 * @param originalTdspNo
	 * @return
	 */
	@RequestMapping("/fenghuang/updateCustomVIP.do")
	@ResponseBody
	public Map<String ,Object> updateCustomVIP(String updateRow) {
		
		//解决JSON传递到Controller中文乱码问题
		try {
			updateRow = URLDecoder.decode(updateRow,"UTF-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		Map<String ,Object> result = new HashMap<String, Object>();
		JSONArray jsonArray =  JSONArray.fromObject(updateRow);
		List<TeamProgressStateDictionary>  teamProList = JSONArray.toList(jsonArray, TeamProgressStateDictionary.class);
		boolean isSuccess = false ;
		try {
			iCustomerCenterService.updateCustomVIPs(teamProList);
			isSuccess =  true ;
		} catch (Exception e) {
			e.printStackTrace();
		}
		result.put("success", isSuccess);
		return result ;
	}
	
	/**
	 * 查询客户VIP
	 * @param tpsdNo
	 * @param tpsdName
	 * @param tpsdHelp
	 * @param tpsdSort
	 * @return
	 */
	@RequestMapping("fenghuang/searchCustomVIP.do")
	@ResponseBody
	public Map<String ,Object> searchCustomVIP(String tpsdNo,String tpsdName,String tpsdHelp,String tpsdSort){
		List<Map<String, Object>> customVIPs = iCustomerCenterService.searchCustomVIP(tpsdNo,tpsdName,tpsdHelp,tpsdSort);
		Map<String, Object> returnValue = new HashMap<String, Object>();
		returnValue.put("rows", customVIPs);
		
		JSONObject fromObject = JSONObject.fromObject(returnValue);
		return fromObject;
		
	}
}
