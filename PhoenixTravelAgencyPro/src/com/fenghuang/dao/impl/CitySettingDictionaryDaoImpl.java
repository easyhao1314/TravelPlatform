package com.fenghuang.dao.impl;

import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.fenghuang.dao.BaseDao;
import com.fenghuang.dao.ICitySettingDictionaryDao;
import com.fenghuang.entiey.CitySettingDictionary;
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
@Repository
public class CitySettingDictionaryDaoImpl extends BaseDao implements
		ICitySettingDictionaryDao {

	@Autowired
	public CitySettingDictionaryDaoImpl(@Qualifier("dataSource")DataSource dataSource) {
		super(dataSource);
		
	}

	@Override
	public boolean saveCitySettingDictionary(CitySettingDictionary citySd)
			throws Exception {
		return false;
	}

	@Override
	public boolean updateCitySettingDictionary(CitySettingDictionary citySd)
			throws Exception {
		return false;
	}

	@Override
	public boolean deleteCitySettingDictionaryById(Long id) throws Exception {
		return false;
	}

	@Override
	public Pagination<CitySettingDictionary> getPaginationCitySettingDictionarys(
			int currentPage, int numPerPage, CitySettingDictionary citySd)
			throws Exception {
		return null;
	}

	@Override
	public List<Map<String, Object>> weihuSeleteid(long id) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
