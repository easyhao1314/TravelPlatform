package com.fenghuang.dao;

import com.fenghuang.entiey.Richeng;
import com.fenghuang.entiey.Rixingcheng;
import com.fenghuang.util.Pagination;

public interface IRichengDao {
	public boolean insert(Richeng r)throws Exception;
	public boolean delete(Richeng r)throws Exception;
	public boolean update(Richeng r)throws Exception;
	public Pagination<Richeng> select(int currentPage, int numPerPage,Richeng r)throws Exception;
}
