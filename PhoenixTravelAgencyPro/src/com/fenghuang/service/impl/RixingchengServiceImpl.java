package com.fenghuang.service.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fenghuang.dao.IRichengDao;

import com.fenghuang.entiey.Richeng;
import com.fenghuang.entiey.Rixingcheng;
import com.fenghuang.service.IRixingchengService;
import com.fenghuang.util.Pagination;
@Service
public class RixingchengServiceImpl implements IRixingchengService {
	@Autowired
	private IRichengDao ir;
	@Override
	public boolean insert(Richeng ri) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delete(Richeng ri) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean Update(Richeng ri) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Pagination<Richeng> getByQueryConditionPagination(
			int currentPage, int numPerPage, Richeng r) throws Exception {
		// TODO Auto-generated method stub
		return ir.select(currentPage, numPerPage, r);
	}

}
