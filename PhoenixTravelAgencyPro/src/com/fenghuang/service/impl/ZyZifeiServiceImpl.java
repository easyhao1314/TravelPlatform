package com.fenghuang.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fenghuang.dao.IZyZifeiDao;
import com.fenghuang.entiey.Zifei;
import com.fenghuang.service.IZyZifeiService;
import com.fenghuang.util.Pagination;
@Service
public class ZyZifeiServiceImpl implements IZyZifeiService{
	@Autowired
	public IZyZifeiDao izzd;

	@Override
	public Pagination<Zifei> zifeiSelect(int currentPage, int numPerPage)
			throws Exception {
		// TODO Auto-generated method stub
		return izzd.zifeiSelect(currentPage, numPerPage);
	}

	@Override
	public boolean zifeiAdd(Zifei zf) throws Exception {
		// TODO Auto-generated method stub
		return izzd.zifeiAdd(zf);
	}

	@Override
	public boolean zifeiDelete(long id) throws Exception {
		// TODO Auto-generated method stub
		return izzd.zifeiDelete(id);
	}

	@Override
	public List<Map<String, Object>> zifeiSelectId(long id) throws Exception {
		// TODO Auto-generated method stub
		return izzd.zifeiSelectId(id);
	}

	@Override
	public boolean zifeiUpdate(Zifei zf) throws Exception {
		// TODO Auto-generated method stub
		return izzd.zifeiUpdate(zf);
	}

}
