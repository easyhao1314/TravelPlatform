package com.fenghuang.dao;

import java.util.List;
import java.util.Map;

import com.fenghuang.entiey.Xianlu;
import com.fenghuang.util.Pagination;

public interface IXianluDao {
	public Integer AddXianlu(Xianlu x)throws Exception;
	public boolean delXianlu(Xianlu x)throws Exception;
	public boolean updateXianlu(Xianlu x)throws Exception;
	public List<Map<String, Object>> selectXianlu()throws Exception;
	public Pagination<Xianlu> xianluinfo(int page,int rows,Xianlu x)throws Exception;
}
