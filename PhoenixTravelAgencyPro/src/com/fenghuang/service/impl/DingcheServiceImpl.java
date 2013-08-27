package com.fenghuang.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fenghuang.dao.IdingcheDao;
import com.fenghuang.entiey.Dingche;
import com.fenghuang.service.IdingcheService;
import com.fenghuang.util.Pagination;
@Service
public class DingcheServiceImpl implements IdingcheService{
	@Autowired
    public IdingcheDao idcd;
	@Override
	public Pagination<Dingche> dingcheSelect(int currentPage, int numPerPage,
			Dingche dc) throws Exception {
		// TODO Auto-generated method stub
		return idcd.dingcheSelect(currentPage, numPerPage, dc);
	}

	@Override
	public boolean dingcheAdd(Dingche dy) throws Exception {
		// TODO Auto-generated method stub
		return idcd.dingcheAdd(dy);
	}

	@Override
	public boolean dingcheDelete(long id) throws Exception {
		// TODO Auto-generated method stub
		return idcd.dingcheDelete(id);
	}

	@Override
	public List<Map<String, Object>> dingcheSelectId(long id) throws Exception {
		// TODO Auto-generated method stub
		return idcd.dingcheSelectId(id);
	}

	@Override
	public boolean dingcheUpdate(Dingche dy) throws Exception {
		// TODO Auto-generated method stub
		return idcd.dingcheUpdate(dy);
	}

}
