package com.fenghuang.service;

import java.util.List;
import java.util.Map;

import com.fenghuang.entiey.KuhuZiyuan;
import com.fenghuang.util.Pagination;

public interface IKehuZiyuanService {
	 //分页查询全部
		public Pagination<KuhuZiyuan> kehuSelect(int currentPage,int numPerPage,String name,String shuoming,String tishi,String type) throws Exception;
		//添加
		public boolean kehuAdd(KuhuZiyuan khzy) throws Exception;
		//删除 
		public boolean kehuDelete(long id) throws Exception;
		//按id询
		public List<Map<String,Object>> kehuSelectId(long id) throws Exception;
		//修改
		public boolean kehuUpdate(KuhuZiyuan khzy) throws Exception;


}
