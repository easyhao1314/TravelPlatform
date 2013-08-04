package com.fenghuang.dao;

import java.util.List;
import java.util.Map;
import com.fenghuang.entiey.Shoukuanxiang;
import com.fenghuang.util.Pagination;

public interface Icaiwushoukuanxiang {
	 public boolean saveshoukuan(Shoukuanxiang shoukuanxiang) throws Exception;
		
		public boolean updateshoukuan(Shoukuanxiang shoukuanxiang) throws Exception;
		
		public boolean deleteshoukuan(Long id) throws Exception;
		
		
		public Pagination<Shoukuanxiang> getPaginationfkqr(int currentPage,
				int numPerPage,Shoukuanxiang shoukuanxiang)throws Exception;
		
		public List<Map<String,Object>>  getDictionaryComboboxs() throws Exception;

}
