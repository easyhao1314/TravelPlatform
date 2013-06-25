package com.fenghuang.dao;

import com.fenghuang.entiey.CountrySettingDictionary;
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
public interface ICountrySettingDictionaryDao {
	
	public boolean  saveCountrySettingDictionary(CountrySettingDictionary csd)throws Exception;
	
	public boolean updateCountrySettingDictionary(CountrySettingDictionary csd) throws Exception;
	
	public boolean deleteCountrySettingDictionaryByCsdNo(String csdNo)throws Exception;
	
	public Pagination<CountrySettingDictionary> getPaginationCountrySettingDictionarys(int currentPage,
			int numPerPage,CountrySettingDictionary csd)throws Exception;
}
