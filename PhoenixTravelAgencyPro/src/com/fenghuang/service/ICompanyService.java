package com.fenghuang.service;

import java.util.List;
import java.util.Map;

import com.fenghuang.entiey.Company;
import com.fenghuang.util.Pagination;
/**
 * 
 * @author 鲍国浩
 *
 *  日期    @2013-6-18
 *  
 *  描述：
 *
 *
 *
 */
public interface ICompanyService {
	public boolean saveCompany(Company company)throws Exception;
	
	public boolean updateCompany(Company company)throws Exception;
	
	public boolean deleteCompanyById(Long id)throws Exception;
	
	public Pagination<Company> getPaginationCompanys(int currentPage,
			int numPerPage,Company company)throws Exception;
	
	public void updateCompanys(List<Company> companys)throws Exception;
	
	public void deleteCompanys(List<Company> companys) throws Exception;
	
	public List<Map<String, Object>> getCompanyComboboxs() throws Exception;
	
}
