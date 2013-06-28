package com.fenghuang.service;

import java.util.List;
import java.util.Map;

import com.fenghuang.entiey.Daoyou;
import com.fenghuang.util.Pagination;

public interface IZyDaoyouService {
	 //分页查询全部
		public Pagination<Daoyou> daoyouSelect(int currentPage,int numPerPage) throws Exception;
		//添加
		public boolean daoyouAdd(Daoyou jd) throws Exception;
		//删除 
		public boolean daoyouDelete(long id) throws Exception;
		//按id询
		public List<Map<String,Object>> daoyouSelectId(long id) throws Exception;
		//修改
		public boolean daoyouUpdate(Daoyou jd) throws Exception;
		//模糊查询 
		public  Pagination<Daoyou> daoyouSelectLike(int currentPage,int numPerPage,String name,int chengshi) throws Exception;

	}

