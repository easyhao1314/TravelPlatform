package com.fenghuang.service;

import java.util.List;
import java.util.Map;

import com.fenghuang.entiey.Gouwu;
import com.fenghuang.util.Pagination;

public interface IZyGouwuService {
	//分页查询全部
		public Pagination<Gouwu> gouwuSelect(int currentPage,int numPerPage,String name,String chengshiId,String hzjbId) throws Exception;
		//添加
		public boolean gouwuAdd(Gouwu gw) throws Exception;
		//删除 
		public boolean gouwuDelete(long id) throws Exception;
		//按id询
		public List<Map<String,Object>> gouwuSelectId(long id) throws Exception;
		//修改
		public boolean gouwuUpdate(Gouwu gw) throws Exception;

}
