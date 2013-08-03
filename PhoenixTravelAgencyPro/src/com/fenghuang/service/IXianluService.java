package com.fenghuang.service;

import com.fenghuang.entiey.Xianlu;
import com.fenghuang.util.Pagination;

public interface IXianluService {
	public boolean AddXianlu(Xianlu x)throws Exception;
	public boolean delXianlu(Xianlu x)throws Exception;
	public boolean updateXianlu(Xianlu x)throws Exception;
	public Pagination<Xianlu> xianluinfo(int page,int rows,Xianlu x)throws Exception;


}
