package com.fenghuang.service;

import com.fenghuang.entiey.Richeng;
import com.fenghuang.entiey.Rixingcheng;
import com.fenghuang.util.Pagination;

public interface IRixingchengService {
	public boolean insert(Richeng ri) throws Exception;
	public boolean delete(Richeng ri) throws Exception;
	public boolean Update(Richeng ri) throws Exception;
	public Pagination<Richeng> getByQueryConditionPagination(int currentPage,int numPerPage,Richeng r) throws Exception;
}
