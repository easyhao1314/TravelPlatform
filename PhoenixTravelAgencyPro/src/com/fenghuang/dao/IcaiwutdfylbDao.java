package com.fenghuang.dao;

import java.util.List;
import java.util.Map;
import com.fenghuang.entiey.Tuanbiao;
import com.fenghuang.util.Pagination;

public interface IcaiwutdfylbDao {
	 public boolean savetdfy(Tuanbiao tuanbiao) throws Exception;
		
		public boolean updatetdfy(Tuanbiao tuanbiao) throws Exception;
		
		public boolean deletetdfy(Long id) throws Exception;
		
		
		public Pagination<Tuanbiao> getPaginationfkqr(int currentPage,
				int numPerPage,Tuanbiao tuanbiao)throws Exception;
		
		public List<Map<String,Object>>  getDictionaryComboboxs() throws Exception;
}
