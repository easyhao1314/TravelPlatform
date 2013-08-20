package com.fenghuang.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fenghuang.dao.IcaiwutdfylbDao;
import com.fenghuang.entiey.CitySettingDictionary;
import com.fenghuang.entiey.Tuanbiao;
import com.fenghuang.service.IcaiwutdfylbService;
import com.fenghuang.util.Pagination;
@Service
public class CaiwutdfylbServiceImpl implements IcaiwutdfylbService {
	@Autowired
	IcaiwutdfylbDao dao;
	@Override
	public boolean saveCitySettingDictionary(CitySettingDictionary citySd)
			throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean savetdfy(Tuanbiao tuanbiao) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean updatetdfy(Tuanbiao tuanbiao) throws Exception {
		// TODO Auto-generated method stub
		return dao.updatetdfy(tuanbiao);
	}

	@Override
	public boolean deletetdfy(Long id) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Pagination<Tuanbiao> getPaginationfkqr(int currentPage,
			int numPerPage, Tuanbiao tuanbiao) throws Exception {
		// TODO Auto-generated method stub
		
		return dao.getPaginationfkqr(currentPage, numPerPage, tuanbiao);
	}

	@Override
	public List<Map<String, Object>> getDictionaryComboboxs() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
