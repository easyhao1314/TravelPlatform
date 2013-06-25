package com.fenghuang.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fenghuang.dao.ICountrySettingDictionaryDao;
import com.fenghuang.entiey.CountrySettingDictionary;
import com.fenghuang.service.ICountrySettingDictionaryService;
import com.fenghuang.util.Pagination;

@Service
public class CountrySettingDictionaryServiceImpl implements
		ICountrySettingDictionaryService {

	@Autowired
	private ICountrySettingDictionaryDao ICountrySettingDictionaryDao;
	@Override
	public boolean saveCountrySettingDictionary(CountrySettingDictionary csd)
			throws Exception {
		return ICountrySettingDictionaryDao.saveCountrySettingDictionary(csd);
	}

	@Override
	public boolean updateCountrySettingDictionary(CountrySettingDictionary csd)
			throws Exception {
		return ICountrySettingDictionaryDao.updateCountrySettingDictionary(csd);
	}

	@Override
	public boolean deleteCountrySettingDictionaryByCsdNo(String csdNo)
			throws Exception {
		return ICountrySettingDictionaryDao.deleteCountrySettingDictionaryByCsdNo(csdNo);
	}

	@Override
	public Pagination<CountrySettingDictionary> getPaginationCountrySettingDictionarys(
			int currentPage, int numPerPage, CountrySettingDictionary csd)
			throws Exception {
		return ICountrySettingDictionaryDao.getPaginationCountrySettingDictionarys(currentPage, numPerPage, csd);
	}

}
