/**
 * 
 */
package com.fenghuang.web.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

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

}
