package com.fenghuang.service;

import com.fenghuang.entiey.Baomingshenpi;
import com.fenghuang.util.Pagination;

public interface IBaomingshenpiService {
	public Pagination<Baomingshenpi> baominginfo(int page,int rows,Baomingshenpi b,String tuanNo,Integer type)throws Exception;
	public boolean updatebaoming(Baomingshenpi b)throws Exception;
	public boolean addbaoming(Baomingshenpi b)throws Exception;
	public boolean deletebaoming(Baomingshenpi b)throws Exception;
	public Pagination<Baomingshenpi> bmingandapproval(Baomingshenpi b,Integer shenpitype,String tuanNo,Integer abmid)throws Exception;
}
