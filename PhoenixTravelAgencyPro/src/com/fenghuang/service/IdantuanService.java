package com.fenghuang.service;

import java.util.List;

import com.fenghuang.entiey.TestUser;
import com.fenghuang.entiey.dantuan;
import com.fenghuang.util.Pagination;

public interface IdantuanService { 
	public int add(dantuan dt);
	public Pagination<dantuan> getByQueryConditionPagination(int currentPage,int numPerPage) throws Exception;

}
