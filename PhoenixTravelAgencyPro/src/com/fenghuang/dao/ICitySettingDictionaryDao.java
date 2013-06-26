package com.fenghuang.dao;

import com.fenghuang.entiey.CitySettingDictionary;
import com.fenghuang.util.Pagination;
/**
 * 
 * @author 鲍国浩
 *
 *  日期    @2013-6-18
 *  
 *  描述：城市设置字段
 *
 *
 *
 */
public interface ICitySettingDictionaryDao {
	/**
	 * 
	 * @param citySd
	 * @return
	 * @throws Exception
	 */
	public boolean saveCitySettingDictionary(CitySettingDictionary citySd) throws Exception;
	
	public boolean updateCitySettingDictionary(CitySettingDictionary citySd) throws Exception;
	
	public boolean deleteCitySettingDictionaryById(Long id) throws Exception;
	
	
	public Pagination<CitySettingDictionary> getPaginationCitySettingDictionarys(int currentPage,
			int numPerPage,CitySettingDictionary citySd)throws Exception;
	

}
