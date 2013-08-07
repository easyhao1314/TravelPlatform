package com.fenghuang.dao.impl;

import javax.sql.DataSource;

import org.springframework.stereotype.Repository;

import com.fenghuang.dao.BaseDao;
import com.fenghuang.dao.ItuanXianluDao;
@Repository
public class TuanXianluDaoImpl extends BaseDao implements ItuanXianluDao{

	public TuanXianluDaoImpl(DataSource dataSource) {
		super(dataSource);
		// TODO Auto-generated constructor stub
	}

	@Override
	public boolean addTuanXianlu() throws Exception {
		// TODO Auto-generated method stub
		String sql="insert into tuanXianlu (tuanNo,xlid) values (?,?)";
		int count=this.update(sql);				
		return count>0;
	}

}
