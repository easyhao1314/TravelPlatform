package com.fenghuang.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fenghuang.dao.IcaiwudaleiweihuDao;
import com.fenghuang.entiey.CitySettingDictionary;
import com.fenghuang.entiey.Weihu;
import com.fenghuang.service.IcaiwuweihuSerice;
import com.fenghuang.util.Pagination;
@Service
public class CaiwuweihuServiceImpl implements IcaiwuweihuSerice{
	@Autowired
	IcaiwudaleiweihuDao dao;

	@Override
	public boolean saveCitySettingDictionary(CitySettingDictionary citySd)
			throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean saveweihu(Weihu weihu) throws Exception {
		// TODO Auto-generated method stub
		boolean saveweihu = dao.saveweihu(weihu);
		return saveweihu;
	}

	@Override
	public boolean updateweihu(Weihu weihu) throws Exception {
		// TODO Auto-generated method stub
		
		return dao.updateweihu(weihu);
	}

	@Override
	public boolean deleteweihu(Long id) throws Exception {
		// TODO Auto-generated method stub
		return dao.deleteweihu(id);
	}

	@Override
	public Pagination<Weihu> getPaginationweihu(
			int currentPage, int numPerPage, Weihu weihu) throws Exception {
		// TODO Auto-generated method stub
		return dao.getPaginationweihu(currentPage, numPerPage, weihu);
	}
	
	

}
