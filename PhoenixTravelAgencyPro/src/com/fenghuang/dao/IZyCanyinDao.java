package com.fenghuang.dao;

import java.util.List;
import java.util.Map;

import com.fenghuang.entiey.Canyin;
import com.fenghuang.util.Pagination;

public interface IZyCanyinDao {
	    //分页查询全部
		public Pagination<Canyin> canyinSelect(int currentPage,int numPerPage) throws Exception;
		//添加
		public boolean canyinAdd(Canyin jd) throws Exception;
		//删除 
		public boolean canyinDelete(long id) throws Exception;
		//按id询
		public List<Map<String,Object>> canyinSelectId(long id) throws Exception;
		//修改
		public boolean canyinUpdate(Canyin jd) throws Exception;
		//模糊查询 
		public  Pagination<Canyin> canyinSelectLike(int currentPage,int numPerPage,String name,int chengshi) throws Exception;

}
