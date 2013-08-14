package com.fenghuang.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fenghuang.dao.IdingfangDao;
import com.fenghuang.entiey.Dingfang;
import com.fenghuang.service.IdingfangSerice;
import com.fenghuang.util.Pagination;
@Service
public class DingfangServiceImpl implements IdingfangSerice {
	@Autowired
	public IdingfangDao idd;

	@Override
	public boolean addDingfang(Dingfang df) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteDingfang(int id) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean updateDingfang(Dingfang df) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Pagination<Dingfang> dingfangSelect(int currentPage, int numPerPage)
			throws Exception {
		// TODO Auto-generated method stub
		return idd.dingfangSelect(currentPage, numPerPage);
	}

}
