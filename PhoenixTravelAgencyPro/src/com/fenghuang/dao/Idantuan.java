package com.fenghuang.dao;

import java.util.List;

import com.fenghuang.entiey.TestUser;
import com.fenghuang.entiey.Usersrr;
import com.fenghuang.entiey.dantuan;
import com.fenghuang.util.Pagination;

public interface Idantuan {
	public int add(dantuan dt);
	public List select();
	public Pagination<dantuan> getByQueryConditionPagination(int currentPage,int numPerPage) throws Exception;
	

}
