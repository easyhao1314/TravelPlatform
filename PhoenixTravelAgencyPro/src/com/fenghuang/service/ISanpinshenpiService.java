package com.fenghuang.service;

import com.fenghuang.entiey.Sanpinshenpi;
import com.fenghuang.util.Pagination;

public interface ISanpinshenpiService {
	public boolean Addsanpinshenpi(Sanpinshenpi s)throws Exception;
	public boolean delsanpinshenpi(Sanpinshenpi s)throws Exception;
	public boolean upsanpinshenpi(Sanpinshenpi s)throws Exception;
	public Pagination<Sanpinshenpi> sanpinshenpiinfo(int currentPage, int numPerPage,Sanpinshenpi s,Long jiantuanren)throws Exception;

}
