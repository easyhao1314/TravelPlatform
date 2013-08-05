package com.fenghuang.dao.impl;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.fenghuang.dao.BaseDao;
import com.fenghuang.dao.IOperateDao;
import com.fenghuang.entiey.Operate;
import com.fenghuang.util.Pagination;
@Repository
public class OperateDaoImpl extends BaseDao implements IOperateDao {
	@Autowired
	public OperateDaoImpl(@Qualifier("dataSource")DataSource datasource) {
		super(datasource);
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public boolean AddOperate(Operate o) {
		// TODO Auto-generated method stub
		return false;
	}


	@Override
	public boolean UpOperate(Operate o) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Pagination<Operate> OperateInfo(int page,int rows,Operate o) {
		// TODO Auto-generated method stub
		String sql = "select * from Operate";
		StringBuffer sb = new StringBuffer(sql);
		return this.getPagination(page, rows, sb.toString());
	}

}
