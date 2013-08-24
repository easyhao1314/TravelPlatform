package com.fenghuang.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fenghuang.dao.IZyDaoyouDao;
import com.fenghuang.entiey.Daoyou;
import com.fenghuang.service.IZyDaoyouService;
import com.fenghuang.util.Pagination;
@Service
public class ZyDaoyouServiceImpl implements IZyDaoyouService{
	@Autowired
	public IZyDaoyouDao izdd;
	@Override
	public Pagination<Daoyou> daoyouSelect(int currentPage, int numPerPage,String name,String guojiaId,String chengshiId)
			throws Exception {
		// TODO Auto-generated method stub
		return izdd.daoyouSelect(currentPage, numPerPage,name,guojiaId,chengshiId);
	}

	@Override
	public boolean daoyouAdd(Daoyou jd) throws Exception {
		// TODO Auto-generated method stub
		return izdd.daoyouAdd(jd);
	}

	@Override
	public boolean daoyouDelete(long id) throws Exception {
		// TODO Auto-generated method stub
		return izdd.daoyouDelete(id);
	}

	@Override
	public List<Map<String, Object>> daoyouSelectId(long id) throws Exception {
		// TODO Auto-generated method stub
		return izdd.daoyouSelectId(id);
	}

	@Override
	public boolean daoyouUpdate(Daoyou jd) throws Exception {
		// TODO Auto-generated method stub
		return izdd.daoyouUpdate(jd);
	}

	@Override
	public Pagination<Daoyou> daoyouSelectLike(int currentPage, int numPerPage,
			String name, int chengshi) throws Exception {
		// TODO Auto-generated method stub
		return izdd.daoyouSelectLike(currentPage, numPerPage, name, chengshi);
	}

	@Override
	public List<Map<String, Object>> daoyouXiala()  throws Exception {
		// TODO Auto-generated method stub
		return izdd.daoyouXiala();
	}

}
