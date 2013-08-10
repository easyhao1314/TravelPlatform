package com.fenghuang.service;

import java.util.List;
import java.util.Map;

import com.fenghuang.entiey.Account;
import com.fenghuang.entiey.CitySettingDictionary;
import com.fenghuang.util.Pagination;

public interface IcaiwusfkzhwhService {
	
	 public boolean saveCitySettingDictionary(CitySettingDictionary citySd) throws Exception;
		
		public boolean saveaccount(Account account) throws Exception;

		public boolean updateaccount(Account account) throws Exception;

		public boolean deleteaccount(Long id) throws Exception;


		public Pagination<Account> getPaginationfkqr(int currentPage,
				int numPerPage,Account account)throws Exception;
		 public List<Map<String,Object>>  getDictionaryComboboxs() throws Exception;



}
