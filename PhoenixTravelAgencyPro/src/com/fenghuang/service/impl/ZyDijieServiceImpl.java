package com.fenghuang.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fenghuang.dao.IZyDijieDao;
import com.fenghuang.entiey.Dijie;
import com.fenghuang.service.IZyDijieService;
import com.fenghuang.util.Pagination;
@Service
public class ZyDijieServiceImpl implements IZyDijieService{
	@Autowired
	public IZyDijieDao izdd;
	
	@Override
	public Pagination<Dijie> dijieSelect(int currentPage, int numPerPage)
			throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean dijieAdd(Dijie dj) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean dijieDelete(long dj) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<Map<String, Object>> dijieSelectId(long id) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean jingdianUpdate(Dijie dj) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Pagination<Dijie> dijieSelectLike(int currentPage, int numPerPage,
			String name, int chengshi) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
