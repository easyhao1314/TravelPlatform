package com.fenghuang.dao;

import com.fenghuang.entiey.Xianluxingcheng;
import com.fenghuang.util.Pagination;

public interface IXianluxingchengDao {
	public boolean delete(Xianluxingcheng x)throws Exception;
	public boolean update(Xianluxingcheng x)throws Exception;
	public boolean insert(Xianluxingcheng x)throws Exception;
	public Pagination<Xianluxingcheng> getByQueryConditionPagination(int currentPage,int numPerPage,Xianluxingcheng x) throws Exception;
}
