package com.fenghuang.service;

import java.util.List;
import java.util.Map;

import com.fenghuang.entiey.Hangkong;
import com.fenghuang.util.Pagination;

public interface IZyHangkongService {
	 //增
	public boolean hangkongAdd(Hangkong hk) throws Exception;
	//删
	public boolean hangkongDelete(long id) throws Exception;
	//改
	public boolean hangkongUpdate(Hangkong hk) throws Exception;
	//查Id
	public List<Map<String,Object>> hangkongSelectId(long id) throws Exception;
	//查全部
	public Pagination<Hangkong> hangkongSelect(int currentPage,int numPerPage) throws Exception;
	//模糊查询
	public Pagination<Hangkong> hangkongSelectLike(int currentPage,int numPerPage,String daima,String name) throws Exception;

}