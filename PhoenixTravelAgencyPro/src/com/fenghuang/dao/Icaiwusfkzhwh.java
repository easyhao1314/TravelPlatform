package com.fenghuang.dao;

import java.util.List;
import java.util.Map;

import com.fenghuang.entiey.Account;
import com.fenghuang.util.Pagination;

public interface Icaiwusfkzhwh {
	
	public boolean saveaccount(Account account) throws Exception;
	
	public boolean updateaccount(Account account) throws Exception;
	
	public boolean deleteaccount(Long id) throws Exception;
	
	
	public Pagination<Account> getPaginationfkqr(int currentPage,
			int numPerPage,Account account)throws Exception;
	
	public List<Map<String,Object>>  getDictionaryComboboxs() throws Exception;


}
