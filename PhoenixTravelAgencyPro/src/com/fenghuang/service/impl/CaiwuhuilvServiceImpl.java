package com.fenghuang.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fenghuang.dao.IcaiwufukuanDao;
import com.fenghuang.dao.IcaiwuhuilvDao;
import com.fenghuang.entiey.Bizhonghuilv;
import com.fenghuang.entiey.CitySettingDictionary;
import com.fenghuang.service.IcaiwuhuilvService;
import com.fenghuang.util.Pagination;
@Service
public class CaiwuhuilvServiceImpl implements IcaiwuhuilvService {
	@Autowired
    IcaiwuhuilvDao dao;
	@Override
	public boolean saveCitySettingDictionary(CitySettingDictionary citySd)
			throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean savehuilv(Bizhonghuilv bizhonghuilv) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean updatehuilv(Bizhonghuilv bizhonghuilv) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deletehuilv(Long id) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Pagination<Bizhonghuilv> getPaginationfkqr(int currentPage,
			int numPerPage, Bizhonghuilv bizhonghuilv) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Map<String, Object>> getDictionaryComboboxs() throws Exception {
		// TODO Auto-generated method stub
		return dao.getDictionaryComboboxs();
	}

}
