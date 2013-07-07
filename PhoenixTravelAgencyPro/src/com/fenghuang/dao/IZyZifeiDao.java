package com.fenghuang.dao;

import java.util.List;
import java.util.Map;

import com.fenghuang.entiey.Gouwu;
import com.fenghuang.entiey.Zifei;
import com.fenghuang.util.Pagination;

public interface IZyZifeiDao {
	//分页查询全部
			public Pagination<Zifei> zifeiSelect(int currentPage,int numPerPage,String name,String chengshiId,String miaoshu) throws Exception;
			//添加
			public boolean zifeiAdd(Zifei zf) throws Exception;
			//删除 
			public boolean zifeiDelete(long id) throws Exception;
			//按id询
			public List<Map<String,Object>> zifeiSelectId(long id) throws Exception;
			//修改
			public boolean zifeiUpdate(Zifei zf) throws Exception;

}
