package com.fenghuang.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fenghuang.dao.Idantuan;
import com.fenghuang.entiey.TestUser;
import com.fenghuang.entiey.dantuan;
import com.fenghuang.service.IdantuanService;
import com.fenghuang.util.Pagination;

@Service
public class dantuanServiceImpl implements IdantuanService{
	
	@Autowired
	public Idantuan idt;

	@Override
	public int add(dantuan dt) {
		// TODO Auto-generated method stub
		return idt.add(dt);
	}

	@Override
	public Pagination<dantuan> getByQueryConditionPagination(int currentPage,
			int numPerPage) throws Exception {
		return idt.getByQueryConditionPagination(currentPage, numPerPage);
	}


}
