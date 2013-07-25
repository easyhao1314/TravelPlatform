package com.fenghuang.service;

import com.fenghuang.entiey.Richeng;
import com.fenghuang.util.Pagination;

public interface IRichengService {
	public boolean insert(Richeng r)throws Exception;
	public boolean delete(Richeng r)throws Exception;
	public boolean update(Richeng r)throws Exception;
	public Pagination<Richeng> select(int currentPage, int numPerPage,Richeng r)throws Exception;
}
