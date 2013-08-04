package com.fenghuang.service;

import com.fenghuang.entiey.Xianlu;
import com.fenghuang.entiey.xingchengkushitu;
import com.fenghuang.util.Pagination;

public interface IxingchengkushituService {
	public Pagination<xingchengkushitu> xingchengkushituinfo(xingchengkushitu xc)throws Exception;
	public Pagination<Xianlu> xianlu(int currentPage,int numPerPage,Xianlu xl) throws Exception;
}
