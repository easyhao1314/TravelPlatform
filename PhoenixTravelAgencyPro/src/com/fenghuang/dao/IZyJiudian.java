package com.fenghuang.dao;

import java.util.List;
import java.util.Map;

import com.fenghuang.entiey.Jiudian;
import com.fenghuang.util.Pagination;

public interface IZyJiudian {
	//分页查询全部
	public Pagination<Jiudian> jiudianSelect(int currentPage,int numPerPage) throws Exception;
	//添加
	public int jiudianAdd(Jiudian jd);
	//删除 
	public boolean jiudianDelete(long id);
	//按id询
	public List<Map<String,Object>> jiudianSelectId(long id);
	//修改
	public boolean jiudianUpdate(Jiudian jd);
	//模糊查询 
	public  Pagination<Jiudian> jiudainSelectLike(int currentPage,int numPerPage,String name,int chengshi) throws Exception;

}