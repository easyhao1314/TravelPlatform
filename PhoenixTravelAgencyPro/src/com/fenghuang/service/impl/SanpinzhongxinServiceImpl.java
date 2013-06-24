package com.fenghuang.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fenghuang.dao.ISanpinzhongxinDao;
import com.fenghuang.dao.IUserDao;
import com.fenghuang.entiey.Sanpinzhongxin;
import com.fenghuang.service.ISanpinzhongxinService;
@Service
public class SanpinzhongxinServiceImpl implements ISanpinzhongxinService {
	@Autowired
	private ISanpinzhongxinDao isanpin;
	@Override
	public boolean AddSanpinzhongxin(Sanpinzhongxin sanpin) throws Exception {
		// TODO Auto-generated method stub
		return isanpin.AddSanpinzhongxin(sanpin);
	}

}
