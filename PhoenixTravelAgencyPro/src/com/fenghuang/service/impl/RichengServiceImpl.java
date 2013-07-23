package com.fenghuang.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fenghuang.dao.IRichengDao;
import com.fenghuang.entiey.Richeng;
import com.fenghuang.service.IRichengService;
import com.fenghuang.util.Pagination;

@Service
public class RichengServiceImpl implements IRichengService {
	@Autowired
	private IRichengDao rd;
	@Override
	public boolean insert(Richeng r) throws Exception {
		// TODO Auto-generated method stub
		return rd.insert(r);
	}

	@Override
	public boolean delete(Richeng r) throws Exception {
		// TODO Auto-generated method stub
		return rd.delete(r);
	}	

	@Override
	public boolean update(Richeng r) throws Exception {
		// TODO Auto-generated method stub
		return rd.update(r);
	}

	@Override
	public Pagination<Richeng> select(int currentPage, int numPerPage, Richeng r)
			throws Exception {
		// TODO Auto-generated method stub
		return rd.select(currentPage, numPerPage, r);
	}

}
