package com.fenghuang.service;

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
}
