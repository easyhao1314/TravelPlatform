package com.fenghuang.dao;

import java.util.List;
import java.util.Map;


import com.fenghuang.entiey.Dijie;
import com.fenghuang.util.Pagination;

public interface IZyDijieDao {
	//分页查询全部
			public Pagination<Dijie> dijieSelect(int currentPage,int numPerPage) throws Exception;
			//添加
			public boolean dijieAdd(Dijie dj) throws Exception;
			//删除 
			public boolean dijieDelete(long dj) throws Exception;
			//按id询
			public List<Map<String,Object>> dijieSelectId(long id) throws Exception;
			//修改
			public boolean jingdianUpdate(Dijie dj) throws Exception;
			//模糊查询 
			public  Pagination<Dijie> dijieSelectLike(int currentPage,int numPerPage,String name,int chengshi) throws Exception;



}
