package com.fenghuang.service;

import java.util.List;
import java.util.Map;

import com.fenghuang.entiey.Dingche;
import com.fenghuang.util.Pagination;

public interface IdingcheService {
	 //分页查询全部
	public Pagination<Dingche> dingcheSelect(int currentPage,int numPerPage,Dingche dc) throws Exception;
	//添加
	public boolean dingcheAdd(Dingche dy) throws Exception;
	//删除 
	public boolean dingcheDelete(long id) throws Exception;
	//按id询
	public List<Map<String,Object>> dingcheSelectId(long id) throws Exception;
	//修改
	public boolean dingcheUpdate(Dingche dy) throws Exception;


}
