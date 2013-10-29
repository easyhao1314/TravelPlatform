package com.fenghuang.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fenghuang.dao.ISanpinshenpiDao;
import com.fenghuang.entiey.Sanpinshenpi;
import com.fenghuang.entiey.Sanpinzhongxin;
import com.fenghuang.service.ISanpinshenpiService;
import com.fenghuang.service.ISanpinzhongxinService;
import com.fenghuang.util.Pagination;
@Service
public class SanpinshenpiServiceImpl implements ISanpinshenpiService {
	@Autowired
	ISanpinshenpiDao dao;
	@Autowired
	ISanpinzhongxinService isanpin;
	@Override
	public boolean Addsanpinshenpi(Sanpinshenpi s) throws Exception {
		// TODO Auto-generated method stub
		return dao.Addsanpinshenpi(s);
	}

	@Override
	public boolean delsanpinshenpi(Sanpinshenpi s) throws Exception {
		// TODO Auto-generated method stub
		return dao.Addsanpinshenpi(s);
	}

	@Override
	public boolean upsanpinshenpi(Sanpinshenpi s) throws Exception {
		// TODO Auto-generated method stub
		if(s.getShenpijieguo()==1){
			Sanpinzhongxin sanpin = new Sanpinzhongxin();
			if(s.getTuanNo()!=null && !"".equals(s.getTuanNo())){
				
				sanpin.setTuanNo(s.getTuanNo());
				sanpin.setFabustate(1);
				isanpin.upSanpinzhongxin(sanpin);
			}
		}
		return dao.upsanpinshenpi(s);
	}

	@Override
	public Pagination<Sanpinshenpi> sanpinshenpiinfo(int currentPage, int numPerPage,Sanpinshenpi s,Long jiantuanren) throws Exception {
		// TODO Auto-generated method stub
		return dao.sanpinshenpiinfo(currentPage, numPerPage, s,jiantuanren);
	}

}
