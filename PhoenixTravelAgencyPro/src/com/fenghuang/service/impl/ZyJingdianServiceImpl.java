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
	public Pagination<Jingdian> jingdianSelect(int currentPage, int numPerPage,String name,String chengsiId,String jiage)
			throws Exception {
		// TODO Auto-generated method stub
		return izjd.jingdianSelect(currentPage, numPerPage,name,chengsiId,jiage);
	}

	@Override
	public boolean jingdianAdd(Jingdian jd) throws Exception {
		// TODO Auto-generated method stub
		return izjd.jingdianAdd(jd);
	}

	@Override
	public boolean jingdianDelete(long id) throws Exception {
		// TODO Auto-generated method stub
		return izjd.jingdianDelete(id);
	}

	@Override
	public List<Map<String, Object>> jingdianSelectId(long id) throws Exception {
		// TODO Auto-generated method stub
		return izjd.jingdianSelectId(id);
	}

	@Override
	public boolean jingdianUpdate(Jingdian jd) throws Exception {
		// TODO Auto-generated method stub
		return izjd.jingdianUpdate(jd);
	}

	@Override
	public Pagination<Jingdian> jingdianSelectLike(int currentPage,
			int numPerPage, String name, int chengshi) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
