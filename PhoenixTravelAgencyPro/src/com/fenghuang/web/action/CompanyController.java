/**
 * 
 */
package com.fenghuang.web.action;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.fenghuang.service.ICompanyService;

/**
 * @author 鲍国浩
 * 
 * 版本 ： 1.0
 * 
 * 日期 ：2013-6-25
 *
 * 描述 ：公司的请求处理类
 *
 *
 */
@Controller
public class CompanyController {
	@Autowired
	public ICompanyService iCompanyService;
	
	public Map<String, Object> getCompanys(HttpServletRequest request,HttpServletResponse response,Integer page, Integer rows,String companyNumber, String companyName,String parentNumber){
		
		
		
		
		
		
		return null;
	}
	

}
