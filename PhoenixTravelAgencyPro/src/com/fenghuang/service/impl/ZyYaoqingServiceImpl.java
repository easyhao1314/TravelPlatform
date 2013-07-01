package com.fenghuang.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fenghuang.dao.IZyYaoqingDao;
import com.fenghuang.entiey.Yaoqinghan;
import com.fenghuang.service.IZyYaoqingService;
import com.fenghuang.util.Pagination;
@Service
public class ZyYaoqingServiceImpl implements IZyYaoqingService{
	@Autowired
	public IZyYaoqingDao izyd;

	@Override
	public Pagination<Yaoqinghan> yaoqingSelect(int currentPage, int numPerPage)
			throws Exception {
		// TODO Auto-generated method stub
		return izyd.yaoqingSelect(currentPage, numPerPage);
	}

	@Override
	public boolean yaoqingAdd(Yaoqinghan yq) throws Exception {
		// TODO Auto-generated method stub
		return izyd.yaoqingAdd(yq);
	}

	@Override
	public boolean yaoqingDelete(long id) throws Exception {
		// TODO Auto-generated method stub
		return izyd.yaoqingDelete(id);
	}

	@Override
	public List<Map<String, Object>> yaoqingSelectId(long id) throws Exception {
		// TODO Auto-generated method stub
		return izyd.yaoqingSelectId(id);
	}

	@Override
	public boolean yaoqingUpdate(Yaoqinghan yq) throws Exception {
		// TODO Auto-generated method stub
		return izyd.yaoqingUpdate(yq);
	}

}
