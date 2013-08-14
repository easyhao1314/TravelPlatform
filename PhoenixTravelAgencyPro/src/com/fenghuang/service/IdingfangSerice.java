package com.fenghuang.service;

import com.fenghuang.entiey.Dingfang;
import com.fenghuang.util.Pagination;

public interface IdingfangSerice {
	public boolean addDingfang(Dingfang df)  throws Exception;
	public boolean deleteDingfang(int id) throws Exception;
	public boolean updateDingfang(Dingfang df) throws Exception;
	//分页查询全部
	public Pagination<Dingfang> dingfangSelect(int currentPage,int numPerPage) throws Exception;

}
