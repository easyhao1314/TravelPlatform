package com.fenghuang.service;

import com.fenghuang.entiey.Jiudian;
import com.fenghuang.util.Pagination;

public interface IZyJiudainService {
	//查询
	public Pagination<Jiudian> jiudainSelect(int currentPage,int numPerPage) throws Exception;
	//模糊查询
	public Pagination<Jiudian> jiudainSelectLike(int currentPage,int numPerpage) throws Exception;
	//添加
	public int jiudianAdd(Jiudian jd);
	//删除
	public boolean jiudianDelete(int id);
	//按Id查询
	public Jiudian jiudianSelectId(int id);
	//修改
	public boolean jiudianUpdate(Jiudian jd);

}
