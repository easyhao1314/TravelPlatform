package com.fenghuang.dao;

import java.util.List;
import java.util.Map;

import com.fenghuang.entiey.Fukuanxiang;
import com.fenghuang.util.Pagination;

public interface Icaiwufukuanxiang {
	   public boolean savefukuan(Fukuanxiang fukuanxiang) throws Exception;
		
		public boolean updatefukuan(Fukuanxiang fukuanxiang) throws Exception;
		
		public boolean deletefukuan(Long id) throws Exception;
		
		
		public Pagination<Fukuanxiang> getPaginationfkqr(int currentPage,
				int numPerPage,Fukuanxiang fukuanxiang)throws Exception;
		
		public List<Map<String,Object>>  getDictionaryComboboxs() throws Exception;
}
