/**
 * 
 */
package com.fenghuang.web.action;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fenghuang.entiey.Company;
import com.fenghuang.service.ICompanyService;
import com.fenghuang.util.Pagination;

/**
 * @author 鲍国浩
 * 
 *         版本 ： 1.0
 * 
 *         日期 ：2013-6-25
 * 
 *         描述 ：公司的请求处理类
 * 
 * 
 */
@Controller
public class CompanyController {
	@Autowired
	public ICompanyService iCompanyService;
    @RequestMapping("fenghuang/getCompanys.do")
    @ResponseBody
	public Map<String, Object> getCompanys(HttpServletRequest request,
			HttpServletResponse response, Integer page, Integer rows,
			String companyNumber, String companyName, String parentNumber) {
		Company company = new Company();
		company.setCompanyName(companyName);
		company.setCompanyNumber(companyNumber);
		company.setParentNumber(parentNumber);
		try {

			Pagination<Company> paginCompanys = iCompanyService
					.getPaginationCompanys(page, rows, company);
			Map<String, Object> returnValue = new HashMap<String, Object>();
			if (paginCompanys != null) {
				List<Map<String, Object>> companyRows = paginCompanys
						.getResultList();

				returnValue.put("total", paginCompanys.getTotalRows());
				returnValue.put("rows", companyRows);
			} else {
				returnValue.put("total", 0);
				returnValue.put("rows", new ArrayList<Map<String, Object>>());
			}
			return returnValue;
		} catch (Exception e) {

			e.printStackTrace();
		}
		return null;
	}
    @RequestMapping("fenghuang/updateCompanys.do")
    @ResponseBody
	public Map<String,Object>  updateCompanys(HttpServletRequest request,HttpServletResponse response,String updateRows){
		Map<String, Object> result = new HashMap<String, Object>();
		JSONArray jsonArray = JSONArray.fromObject(updateRows);
		List<Company> companys = JSONArray.toList(jsonArray,Company.class);
		boolean isSuccess = false;
		
		try {
			iCompanyService.updateCompanys(companys);
			isSuccess = true;
		} catch (Exception e) {
			isSuccess= false;
			e.printStackTrace();
		}
		result.put("success", isSuccess);
		return result;
	}
    @RequestMapping("fenghuang/saveCompanyInfo.do")
    @ResponseBody
    public Map<String,Object> saveCompanyInfo(HttpServletRequest request,HttpServletResponse response,String companyNumber, String companyName, String parentNumber){
    	Map<String, Object> result = new HashMap<String, Object>();
		boolean isSuccess = false;
    	Company company = new Company();
    	company.setCompanyName(companyName);
    	company.setCompanyNumber(companyNumber);
    	company.setParentNumber(parentNumber);
    	try {
			iCompanyService.saveCompany(company);
			isSuccess = true;
		} catch (Exception e) {
			isSuccess = false;
			e.printStackTrace();
		}
    	
		result.put("success", isSuccess);
		return result;
    }
    @RequestMapping("fenghuang/deleteCompanys.do")
    @ResponseBody
    public Map<String,Object> deleteCompanys(HttpServletRequest request,HttpServletResponse response,String deleteRows){
    	Map<String, Object> result = new HashMap<String, Object>();
		JSONArray jsonArray = JSONArray.fromObject(deleteRows);
    	List<Company> companys = JSONArray.toList(jsonArray, Company.class);
		boolean isSuccess = false;
		
		try {
			iCompanyService.deleteCompanys(companys);
			isSuccess = true;
		} catch (Exception e) {
			isSuccess = false;
			e.printStackTrace();
		}
		result.put("success", isSuccess);
		return result;
    }
    @RequestMapping("fenghuang/getCompanyComboboxs.do")
    @ResponseBody
    public List<Map<String, Object>> getCompanyComboboxs(){
    	
    	
    	try {
			return iCompanyService.getCompanyComboboxs();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
    }
    
    
    
    
    
	
}
