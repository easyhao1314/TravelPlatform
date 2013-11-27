package com.fenghuang.dao.impl;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fenghuang.dao.BaseDao;
import com.fenghuang.dao.ItuanXianluDao;
import com.fenghuang.entiey.TuanXianlu;
@Repository
public class TuanXianluDaoImpl extends BaseDao implements ItuanXianluDao{
	@Autowired
	public TuanXianluDaoImpl(DataSource dataSource) {
		super(dataSource);
		// TODO Auto-generated constructor stub
	}

	@Override
	public boolean addTuanXianlu(TuanXianlu txl) throws Exception {
		// TODO Auto-generated method stub
		String sql="insert into tuanXianlu(tuanNo,xlid) values(?,?)";
		int count=this.update(sql,txl.getTuanNo(),txl.getXlid());			
		return count>0;
	}

	@Override
	public boolean deltuanxianlu(TuanXianlu t) throws Exception {
		// TODO Auto-generated method stub
		String sql = "delete from tuanxianlu where xlid=?";
		int count = this.update(sql,t.getXlid());
		return false;
	}

}
