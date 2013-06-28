package com.fenghuang.service;

import java.util.List;
import java.util.Map;

import com.fenghuang.entiey.Jiaotong;
import com.fenghuang.util.Pagination;

public interface IZyJiaotongService {
	    //增
		public boolean jiaotongAdd(Jiaotong jt) throws Exception;
		//删
		public boolean jiaotongDelete(long id) throws Exception;
		//改
		public boolean jiaotongUpdate(Jiaotong jt) throws Exception;
		//查Id
		public List<Map<String,Object>> jiaotongSelectId(long id) throws Exception;
		//查全部
		public Pagination<Jiaotong> jiaotongSelect(int currentPage,int numPerPage) throws Exception;
		//模糊查询
		public Pagination<Jiaotong> jiaotongSelectLike(int currentPage,int numPerPage,int chengshi,String name) throws Exception;


}
