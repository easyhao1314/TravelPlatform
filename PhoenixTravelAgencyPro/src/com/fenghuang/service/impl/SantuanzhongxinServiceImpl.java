package com.fenghuang.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fenghuang.dao.ISantuanzhongxin;
import com.fenghuang.entiey.Sanpinzhongxin;
import com.fenghuang.service.ISantuanzhongxinService;
@Service
public class SantuanzhongxinServiceImpl implements ISantuanzhongxinService {
	@Autowired
	public ISantuanzhongxin dao;
	@Override
	public int addsanpinzhongxin(Sanpinzhongxin sanpin) throws Exception {
		// TODO Auto-generated method stub
		return dao.addSanpinzhongxin(sanpin);
	}

}
