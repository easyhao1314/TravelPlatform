package com.fenghuang.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fenghuang.dao.IcaiwufukuanDao;
import com.fenghuang.entiey.CitySettingDictionary;
import com.fenghuang.entiey.Fukuanfangshi;
import com.fenghuang.service.IcaiwufukuanService;
import com.fenghuang.util.Pagination;

@Service
public class caiwufukuanServiceImpl implements IcaiwufukuanService{
	@Autowired
	IcaiwufukuanDao dao;
	@Override
	public boolean saveCitySettingDictionary(CitySettingDictionary citySd)
			throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean savefukuan(Fukuanfangshi fukuanfangshi) throws Exception {
		// TODO Auto-generated method stub
		boolean saveweihu = dao.saveFukuan(fukuanfangshi);
		return saveweihu;
	}

	@Override
	public boolean updatefukuan(Fukuanfangshi fukuanfangshi) throws Exception {
		// TODO Auto-generated method stub
		return dao.updateFukuan(fukuanfangshi);
	}

	@Override
	public boolean deletefukuan(Long id) throws Exception {
		// TODO Auto-generated method stub
		return dao.deleteFukuan(id);
	}

	@Override
	public Pagination<Fukuanfangshi> getPaginationweihu(int currentPage,
			int numPerPage, Fukuanfangshi fukuanfangshi) throws Exception {
		// TODO Auto-generated method stub
		
		return dao.getPaginationweihu(currentPage, numPerPage, fukuanfangshi);
	}

}
