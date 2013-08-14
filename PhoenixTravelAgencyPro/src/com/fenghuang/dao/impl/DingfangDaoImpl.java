package com.fenghuang.dao.impl;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fenghuang.dao.BaseDao;
import com.fenghuang.dao.IdingfangDao;
import com.fenghuang.entiey.Dingfang;
import com.fenghuang.util.Pagination;
@Repository
public class DingfangDaoImpl extends BaseDao implements IdingfangDao{
	@Autowired
	public DingfangDaoImpl(DataSource dataSource) {
		super(dataSource);
		// TODO Auto-generated constructor stub
	}

	@Override
	public boolean addDingfang(Dingfang df) throws Exception {
		// TODO Auto-generated method stub
		String sql=" ";
		int count=this.update(sql);
		return count>0;
	}

	@Override
	public boolean deleteDingfang(int id) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean updateDingfang(Dingfang df) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Pagination<Dingfang> dingfangSelect(int currentPage, int numPerPage)
			throws Exception {
		// TODO Auto-generated method stub
		String sql="select * from dingfang ";
		
		return this.getPagination(currentPage, numPerPage, sql);
	}
	

}
