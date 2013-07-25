package com.fenghuang.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fenghuang.dao.IXianluDao;
import com.fenghuang.entiey.Xianlu;
import com.fenghuang.service.IXianluService;
import com.fenghuang.util.Pagination;
@Service
public class XianluServiceImpl implements IXianluService {
	@Autowired
	private IXianluDao ix;
	@Override
	public boolean AddXianlu(Xianlu x) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delXianlu(Xianlu x) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean updateXianlu(Xianlu x) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Pagination<Xianlu> xianluinfo(int page, int rows, Xianlu x)
			throws Exception {
		// TODO Auto-generated method stub
		return ix.xianluinfo(page, rows, x);
	}

}
