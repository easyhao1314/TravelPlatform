package com.fenghuang.service;

import java.util.List;
import java.util.Map;

import com.fenghuang.entiey.Gouwu;
import com.fenghuang.entiey.Yaoqinghan;
import com.fenghuang.util.Pagination;

public interface IZyYaoqingService {
	//分页查询全部
			public Pagination<Yaoqinghan> yaoqingSelect(int currentPage,int numPerPage) throws Exception;
			//添加
			public boolean yaoqingAdd(Yaoqinghan yq) throws Exception;
			//删除 
			public boolean yaoqingDelete(long id) throws Exception;
			//按id询
			public List<Map<String,Object>> yaoqingSelectId(long id) throws Exception;
			//修改
			public boolean yaoqingUpdate(Yaoqinghan yq) throws Exception;

}
