package com.fenghuang.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fenghuang.dao.IZyJingdianDao;
import com.fenghuang.entiey.Jingdian;
import com.fenghuang.service.IZyJingdianService;
import com.fenghuang.util.Pagination;
@Service
public class ZyJingdianServiceImpl implements IZyJingdianService{
	@Autowired
	public IZyJingdianDao izjd;
	
	@Override
	public Pagination<Jingdian> jingdianSelect(int currentPage, int numPerPage)
			throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean jingdianAdd(Jingdian jd) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean jingdianDelete(long id) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<Map<String, Object>> jingdianSelectId(long id) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean jingdianUpdate(Jingdian jd) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Pagination<Jingdian> jingdianSelectLike(int currentPage,
			int numPerPage, String name, int chengshi) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
