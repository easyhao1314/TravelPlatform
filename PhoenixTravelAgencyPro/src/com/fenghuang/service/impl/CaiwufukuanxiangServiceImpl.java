package com.fenghuang.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fenghuang.dao.Icaiwufukuanxiang;
import com.fenghuang.entiey.CitySettingDictionary;
import com.fenghuang.entiey.Fukuanxiang;
import com.fenghuang.service.IcaiwufukuanxiangService;
import com.fenghuang.util.Pagination;
@Service
public class CaiwufukuanxiangServiceImpl implements IcaiwufukuanxiangService {
	@Autowired
	Icaiwufukuanxiang icaiwufukuanxiang;
	
	@Override
	public boolean saveCitySettingDictionary(CitySettingDictionary citySd)
			throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean savefukuan(Fukuanxiang fukuanxiang) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean updatefukuan(Fukuanxiang fukuanxiang) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deletefukuan(Long id) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Pagination<Fukuanxiang> getPaginationfkqr(int currentPage,
			int numPerPage, Fukuanxiang fukuanxiang) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Map<String, Object>> getDictionaryComboboxs() throws Exception {
		// TODO Auto-generated method stub
		return icaiwufukuanxiang.getDictionaryComboboxs();
	}
}
