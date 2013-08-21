package com.fenghuang.service;

import java.util.List;
import java.util.Map;

import com.fenghuang.entiey.Dingdaoyou;
import com.fenghuang.util.Pagination;

public interface IdingdaoyouService {
	//分页查询全部
	public Pagination<Dingdaoyou> dingdaoyouSelect(int currentPage,int numPerPage,Dingdaoyou ddy) throws Exception;
	//添加
	public boolean dingdaoyouAdd(Dingdaoyou yq) throws Exception;
	//删除 
	public boolean dingdaoyouDelete(long id) throws Exception;
	//按id询
	public List<Map<String,Object>> dingdaoyouSelectId(long id) throws Exception;
	//修改
	public boolean dingdaoyouUpdate(Dingdaoyou yq) throws Exception;

}
