package com.fenghuang.service;

import java.util.List;
import java.util.Map;

import com.fenghuang.entiey.Jiudian;
import com.fenghuang.util.Pagination;

public interface IZyJiudainService {
	//查询
	public Pagination<Jiudian> jiudianSelect(int currentPage,int numPerPage) throws Exception;
	//模糊查询
	public Pagination<Jiudian> jiudianSelectLike(int currentPage,int numPerpage,String name,String chengshi,String weihuren) throws Exception;
	//添加
	public int jiudianAdd(Jiudian jd);
	//删除
	public boolean jiudianDelete(long id);
	//按Id查询
	public List<Map<String,Object>> jiudianSelectId(long id);
	//修改
	public boolean jiudianUpdate(Jiudian jd);

}
