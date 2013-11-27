package com.fenghuang.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fenghuang.dao.ItuanXianluDao;
import com.fenghuang.entiey.TuanXianlu;
import com.fenghuang.service.ItuanXianluService;
@Service
public class TuanXianluServiceImpl implements ItuanXianluService{
	@Autowired	
	ItuanXianluDao itxld;
	@Override
	public boolean addTuanXianlu(TuanXianlu txl) throws Exception {
		// TODO Auto-generated method stub
		return itxld.addTuanXianlu(txl);
	}
	@Override
	public boolean deltuanxianlu(TuanXianlu t) throws Exception {
		// TODO Auto-generated method stub
		return itxld.deltuanxianlu(t);
	}

}
