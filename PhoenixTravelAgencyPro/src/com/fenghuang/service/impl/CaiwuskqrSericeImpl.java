package com.fenghuang.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fenghuang.dao.IcaiwufkqrDao;
import com.fenghuang.entiey.CitySettingDictionary;
import com.fenghuang.entiey.Fukuanqueren;
import com.fenghuang.entiey.Tuanbiao;
import com.fenghuang.service.IcaiwuskqrSerice;
import com.fenghuang.util.Pagination;
@Service
public class CaiwuskqrSericeImpl implements IcaiwuskqrSerice {
	@Autowired
	IcaiwufkqrDao dao;

	@Override
	public boolean saveCitySettingDictionary(CitySettingDictionary citySd)
			throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean saveskqr(Tuanbiao tuanbiao) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean updateskqr(Tuanbiao tuanbiao) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteskqr(Long id) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Pagination<Tuanbiao> getPaginationfkqr(int currentPage,
			int numPerPage, Tuanbiao tuanbiao) throws Exception {
		// TODO Auto-generated method stub
		return dao.getPaginationfkqr(currentPage, numPerPage, tuanbiao);
	}
}