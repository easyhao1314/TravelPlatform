package com.fenghuang.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fenghuang.dao.Icaiwufukuanxiang;
import com.fenghuang.dao.Icaiwushoukuanxiang;
import com.fenghuang.entiey.CitySettingDictionary;
import com.fenghuang.entiey.Shoukuanxiang;
import com.fenghuang.service.IcaiwushoukuanxiangService;
import com.fenghuang.util.Pagination;
@Service
public class CaiwushoukuanxiangServiceImpl implements IcaiwushoukuanxiangService {
	@Autowired
    Icaiwushoukuanxiang dao;
	@Override
	public boolean saveCitySettingDictionary(CitySettingDictionary citySd)
			throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean saveshoukuan(Shoukuanxiang shoukuanxiang) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean updateshoukuan(Shoukuanxiang shoukuanxiang) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteshoukuan(Long id) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Pagination<Shoukuanxiang> getPaginationfkqr(int currentPage,
			int numPerPage, Shoukuanxiang shoukuanxiang) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Map<String, Object>> getDictionaryComboboxs() throws Exception {
		// TODO Auto-generated method stub
		return dao.getDictionaryComboboxs();
	}

}
