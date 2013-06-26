package com.fenghuang.dao;

import java.util.List;
import java.util.Map;

import com.fenghuang.entiey.Company;
import com.fenghuang.util.Pagination;

public interface ICompanyDao {
	
	public boolean saveCompany(Company company)throws Exception;
	
	public boolean updateCompany(Company company)throws Exception;
	
	public boolean deleteCompanyById(Long id)throws Exception;
	
	public Pagination<Company> getPaginationCompanys(int currentPage,
			int numPerPage,Company company)throws Exception;
	
	public List<Map<String,Object>>  getCompanyComboboxs()throws Exception;
	

}
