package com.fenghuang.dao;



import com.fenghuang.entiey.Fukuanfangshi;
import com.fenghuang.util.Pagination;

public interface IcaiwufukuanDao {
	public boolean saveFukuan(Fukuanfangshi fukuanfangshi) throws Exception;
	
	public boolean updateFukuan(Fukuanfangshi fukuanfangshi) throws Exception;
	
	public boolean deleteFukuan(Long id) throws Exception;
	
	
	public Pagination<Fukuanfangshi> getPaginationweihu(int currentPage,
			int numPerPage,Fukuanfangshi fukuanfangshi)throws Exception;
	
}

