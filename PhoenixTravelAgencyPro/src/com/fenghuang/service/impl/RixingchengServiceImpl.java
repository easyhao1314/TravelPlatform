package com.fenghuang.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fenghuang.dao.IRixingchengDao;
import com.fenghuang.entiey.Rixingcheng;
import com.fenghuang.service.IRixingchengService;
import com.fenghuang.util.Pagination;
@Service
public class RixingchengServiceImpl implements IRixingchengService {
	@Autowired
	private IRixingchengDao ir;
	@Override
	public boolean insert(Rixingcheng ri) throws Exception {
		// TODO Auto-generated method stub
		return ir.insert(ri);
	}

	@Override
	public boolean delete(Rixingcheng ri) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean Update(Rixingcheng ri) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Pagination<Rixingcheng> getByQueryConditionPagination(
			int currentPage, int numPerPage, Rixingcheng r) throws Exception {
		// TODO Auto-generated method stub
		return ir.getByQueryConditionPagination(currentPage, numPerPage, r);
	}

}
