package com.fenghuang.dao;

import com.fenghuang.entiey.Xianlu;
import com.fenghuang.entiey.xingchengkushitu;
import com.fenghuang.util.Pagination;

public interface IxingchengkushituDao {
	//视图查询 行程库及 日程
	public Pagination<xingchengkushitu> xingchengkushituinfo(xingchengkushitu xc)throws Exception;
	public Pagination<Xianlu> xianlu(int currentPage,int numPerPage,Xianlu xl) throws Exception;
	
}
