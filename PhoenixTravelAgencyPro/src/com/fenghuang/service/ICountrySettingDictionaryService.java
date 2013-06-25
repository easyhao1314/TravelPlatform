package com.fenghuang.service;

import com.fenghuang.entiey.CountrySettingDictionary;
import com.fenghuang.util.Pagination;

public interface ICountrySettingDictionaryService {
	public boolean  saveCountrySettingDictionary(CountrySettingDictionary csd)throws Exception;
	
	public boolean updateCountrySettingDictionary(CountrySettingDictionary csd) throws Exception;
	
	public boolean deleteCountrySettingDictionaryByCsdNo(String csdNo)throws Exception;
	
	public Pagination<CountrySettingDictionary> getPaginationCountrySettingDictionarys(int currentPage,
			int numPerPage,CountrySettingDictionary csd)throws Exception;
}
