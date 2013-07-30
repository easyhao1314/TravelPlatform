package com.fenghuang.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fenghuang.dao.IXianluDao;
import com.fenghuang.entiey.Xianlu;
import com.fenghuang.service.IXianluService;
import com.fenghuang.util.Pagination;
@Service
public class XianluServiceImpl implements IXianluService{
	@Autowired 
	IXianluDao xldao;
	@Override
	public boolean AddXianlu(Xianlu x) throws Exception {
		// TODO Auto-generated method stub
		return xldao.AddXianlu(x);
	}

	@Override
	public boolean delXianlu(Xianlu x) throws Exception {
		// TODO Auto-generated method stub
		return xldao.delXianlu(x);
	}

	@Override
	public boolean updateXianlu(Xianlu x) throws Exception {
		// TODO Auto-generated method stub
		return xldao.updateXianlu(x);
	}

	@Override
	public Pagination<Xianlu> xianluinfo(int page, int rows, Xianlu x)
			throws Exception {
		// TODO Auto-generated method stub
		return xldao.xianluinfo(page, rows, x);
	}

}
