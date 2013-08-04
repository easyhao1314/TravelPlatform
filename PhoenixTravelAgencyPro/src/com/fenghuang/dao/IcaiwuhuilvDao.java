package com.fenghuang.dao;

import java.util.List;
import java.util.Map;

import com.fenghuang.entiey.Bizhonghuilv;

import com.fenghuang.util.Pagination;

public interface IcaiwuhuilvDao {
	 public boolean savehuilv(Bizhonghuilv bizhonghuilv) throws Exception;
		
		public boolean updatehuilv(Bizhonghuilv bizhonghuilv) throws Exception;
		
		public boolean deletehuilv(Long id) throws Exception;
		
		
		public Pagination<Bizhonghuilv> getPaginationfkqr(int currentPage,
				int numPerPage,Bizhonghuilv bizhonghuilv)throws Exception;
		
		public List<Map<String,Object>>  getDictionaryComboboxs() throws Exception;
}
