package com.fenghuang.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fenghuang.dao.ICitySettingDictionaryDao;
import com.fenghuang.entiey.CitySettingDictionary;
import com.fenghuang.service.ICitySettingDictionaryService;
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
@Service
public class CitySettingDictionaryServiceImpl implements
		ICitySettingDictionaryService {
	
	@Autowired
	private ICitySettingDictionaryDao iCitySettingDictionaryDao;
	
	@Override
	public boolean saveCitySettingDictionary(CitySettingDictionary citySd)
			throws Exception {
		return iCitySettingDictionaryDao.saveCitySettingDictionary(citySd);
	}

	@Override
	public boolean updateCitySettingDictionary(CitySettingDictionary citySd)
			throws Exception {
		return iCitySettingDictionaryDao.updateCitySettingDictionary(citySd);
	}

	@Override
	public boolean deleteCitySettingDictionaryById(Long id) throws Exception {
		return iCitySettingDictionaryDao.deleteCitySettingDictionaryById(id);
	}

	@Override
	public Pagination<CitySettingDictionary> getPaginationCitySettingDictionarys(
			int currentPage, int numPerPage, CitySettingDictionary citySd)
			throws Exception {
		return iCitySettingDictionaryDao.getPaginationCitySettingDictionarys(currentPage, numPerPage, citySd);
	}

}
