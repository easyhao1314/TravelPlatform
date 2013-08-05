package com.fenghuang.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fenghuang.dao.IOperateDao;
import com.fenghuang.entiey.Operate;
import com.fenghuang.service.IOperateService;
import com.fenghuang.util.Pagination;
@Service
public class OperateServiceImpl implements IOperateService {
	@Autowired
	private IOperateDao idao;
	@Override
	public boolean AddOperate(Operate o) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean UpOperate(Operate o) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Pagination<Operate> OperateInfo(int page, int rows, Operate o) {
		// TODO Auto-generated method stub
		return idao.OperateInfo(page, rows, o);
	}

}
