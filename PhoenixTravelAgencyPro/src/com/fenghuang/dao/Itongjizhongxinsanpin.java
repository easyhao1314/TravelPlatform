package com.fenghuang.dao;
import com.fenghuang.entiey.Tuanbiao;
import com.fenghuang.util.Pagination;

public interface Itongjizhongxinsanpin {
	 public boolean savefkqr(Tuanbiao tuanbiao) throws Exception;
		
		public boolean updatefkqr(Tuanbiao tuanbiao) throws Exception;
		
		public boolean deletefkqr(Long id) throws Exception;
	public Pagination<Tuanbiao> getPaginationsanpintongji(int currentPage,
			int numPerPage,Tuanbiao tuanbiao)throws Exception;
}