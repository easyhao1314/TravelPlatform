package com.fenghuang.dao;


import com.fenghuang.entiey.Weihu;
import com.fenghuang.util.Pagination;

public interface IcaiwudaleiweihuDao {
	public boolean saveweihu(Weihu weihu) throws Exception;
	
	public boolean updateweihu(Weihu weihu) throws Exception;
	
	public boolean deleteweihu(Long id) throws Exception;
	
	
	public Pagination<Weihu> getPaginationweihu(int currentPage,
			int numPerPage,Weihu weihu)throws Exception;
	
}
