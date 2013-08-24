package com.fenghuang.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fenghuang.dao.IZyGouwuDao;
import com.fenghuang.entiey.Gouwu;
import com.fenghuang.service.IZyGouwuService;
import com.fenghuang.util.Pagination;
@Service
public class ZyGouwuServiceImpl implements IZyGouwuService{
	@Autowired
	public IZyGouwuDao izgd;
	@Override
	public Pagination<Gouwu> gouwuSelect(int currentPage, int numPerPage,String name,String chengshiId,String hzjbId)
			throws Exception {
		// TODO Auto-generated method stub
		return izgd.gouwuSelect(currentPage, numPerPage,name,chengshiId,hzjbId);
	}

	@Override
	public boolean gouwuAdd(Gouwu dj) throws Exception {
		// TODO Auto-generated method stub
		return izgd.gouwuAdd(dj);
	}

	@Override
	public boolean gouwuDelete(long id) throws Exception {
		// TODO Auto-generated method stub
		return izgd.gouwuDelete(id);
	}

	@Override
	public List<Map<String, Object>> gouwuSelectId(long id) throws Exception {
		// TODO Auto-generated method stub
		return izgd.gouwuSelectId(id);
	}

	@Override
	public boolean gouwuUpdate(Gouwu dj) throws Exception {
		// TODO Auto-generated method stub
		return izgd.gouwuUpdate(dj);
	}

	@Override
	public List<Map<String, Object>> gouwuXiala() throws Exception {
		// TODO Auto-generated method stub
		return izgd.gouwuXiala();
	}

}
