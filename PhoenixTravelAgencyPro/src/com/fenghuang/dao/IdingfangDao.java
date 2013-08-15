package com.fenghuang.dao;

import com.fenghuang.entiey.Canyin;
import com.fenghuang.entiey.Dingfang;
import com.fenghuang.util.Pagination;

public interface IdingfangDao {
	public boolean addDingfang(Dingfang df)  throws Exception;
	public boolean deleteDingfang(int id) throws Exception;
	public boolean updateDingfang(Dingfang df) throws Exception;
	//分页查询全部
	public Pagination<Dingfang> dingfangSelect(int currentPage,int numPerPage,Dingfang df) throws Exception;
}
