package com.fenghuang.dao;

import com.fenghuang.entiey.Rixingcheng;
import com.fenghuang.util.Pagination;

public interface IRixingchengDao {
	public boolean insert(Rixingcheng ri) throws Exception;
	public boolean delete(Rixingcheng ri) throws Exception;
	public boolean Update(Rixingcheng ri) throws Exception;
	public Pagination<Rixingcheng> getByQueryConditionPagination(int currentPage,int numPerPage,Rixingcheng r) throws Exception;
}
