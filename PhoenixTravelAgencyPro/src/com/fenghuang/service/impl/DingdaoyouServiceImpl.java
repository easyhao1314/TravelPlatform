package com.fenghuang.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fenghuang.dao.IdingdaoyouDao;
import com.fenghuang.entiey.Dingdaoyou;
import com.fenghuang.service.IdingdaoyouService;
import com.fenghuang.util.Pagination;
@Service 
public class DingdaoyouServiceImpl implements IdingdaoyouService{
	@Autowired	
	IdingdaoyouDao iddyd;
	

	@Override
	public Pagination<Dingdaoyou> dingdaoyouSelect(int currentPage,
			int numPerPage,Dingdaoyou ddy) throws Exception {
		// TODO Auto-generated method stub
		return iddyd.dingdaoyouSelect(currentPage, numPerPage,ddy);
	}

	@Override
	public boolean dingdaoyouAdd(Dingdaoyou dy) throws Exception {
		// TODO Auto-generated method stub
		return iddyd.dingdaoyouAdd(dy);
	}

	@Override
	public boolean dingdaoyouDelete(long id) throws Exception {
		// TODO Auto-generated method stub
		return iddyd.dingdaoyouDelete(id);
	}

	@Override
	public List<Map<String, Object>> dingdaoyouSelectId(long id)
			throws Exception {
		// TODO Auto-generated method stub
		return iddyd.dingdaoyouSelectId(id);
	}

	@Override
	public boolean dingdaoyouUpdate(Dingdaoyou dy) throws Exception {
		// TODO Auto-generated method stub
		return iddyd.dingdaoyouUpdate(dy);
	}

}
