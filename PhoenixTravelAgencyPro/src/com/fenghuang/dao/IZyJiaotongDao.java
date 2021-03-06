package com.fenghuang.dao;

import java.util.List;
import java.util.Map;

import com.fenghuang.entiey.Jiaotong;
import com.fenghuang.entiey.Jiudian;
import com.fenghuang.util.Pagination;

public interface IZyJiaotongDao {
	//增
	public boolean jiaotongAdd(Jiaotong jt) throws Exception;
	//删
	public boolean jiaotongDelete(long id) throws Exception;
	//改
	public boolean jiaotongUpdate(Jiaotong jt) throws Exception;
	//查Id
	public List<Map<String,Object>> jiaotongSelectId(long id) throws Exception;
	//查全部
	public Pagination<Jiaotong> jiaotongSelect(int currentPage,int numPerPage,String name,String chengshiId,String lianxiren,String hzjbId) throws Exception;
	
}
