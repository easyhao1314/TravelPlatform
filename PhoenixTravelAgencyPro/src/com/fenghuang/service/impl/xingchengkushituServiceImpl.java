package com.fenghuang.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fenghuang.dao.IxingchengkushituDao;
import com.fenghuang.entiey.xingchengkushitu;
import com.fenghuang.service.IxingchengkushituService;
import com.fenghuang.util.Pagination;
@Service
public class xingchengkushituServiceImpl implements IxingchengkushituService {
	@Autowired
	private IxingchengkushituDao ix;
	@Override
	public Pagination<xingchengkushitu> xingchengkushituinfo(xingchengkushitu xc)
			throws Exception {
		// TODO Auto-generated method stub
		return ix.xingchengkushituinfo(xc);
	}

}
