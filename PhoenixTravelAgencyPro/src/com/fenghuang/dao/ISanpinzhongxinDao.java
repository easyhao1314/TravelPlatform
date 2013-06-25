package com.fenghuang.dao;


import com.fenghuang.entiey.Sanpinzhongxin;
import com.fenghuang.util.Pagination;

public interface ISanpinzhongxinDao {
	//添加散拼信息
	public boolean AddSanpinzhongxin(Sanpinzhongxin sanpin) throws Exception;
	//分页查询散拼列表
	public Pagination<Sanpinzhongxin> getByQueryConditionPagination(int currentPage,int numPerPage) throws Exception;
}
