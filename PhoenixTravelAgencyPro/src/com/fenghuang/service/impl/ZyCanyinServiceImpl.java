package com.fenghuang.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fenghuang.dao.IZyCanyinDao;
import com.fenghuang.entiey.Canyin;
import com.fenghuang.service.IZyCanyinService;
import com.fenghuang.util.Pagination;
@Service
public class ZyCanyinServiceImpl implements IZyCanyinService{
	@Autowired	
	public IZyCanyinDao izcd;

	@Override
	public Pagination<Canyin> canyinSelect(int currentPage, int numPerPage)
			throws Exception {
		// TODO Auto-generated method stub
		return izcd.canyinSelect(currentPage, numPerPage);
	}

	@Override
	public boolean canyinAdd(Canyin dy) throws Exception {
		// TODO Auto-generated method stub
		return izcd.canyinAdd(dy);
	}

	@Override
	public boolean canyinDelete(long id) throws Exception {
		// TODO Auto-generated method stub
		return izcd.canyinDelete(id);
	}

	@Override
	public List<Map<String, Object>> canyinSelectId(long id) throws Exception {
		// TODO Auto-generated method stub
		return izcd.canyinSelectId(id);
	}

	@Override
	public boolean canyinUpdate(Canyin dy) throws Exception {
		// TODO Auto-generated method stub
		return izcd.canyinUpdate(dy);
	}

	@Override
	public Pagination<Canyin> canyinSelectLike(int currentPage, int numPerPage,
			String name, int chengshi) throws Exception {
		// TODO Auto-generated method stub
		return izcd.canyinSelectLike(currentPage, numPerPage, name, chengshi);
	}

}
