package com.fenghuang.dao.impl;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.fenghuang.dao.BaseDao;
import com.fenghuang.dao.IXianluDao;
import com.fenghuang.entiey.Xianlu;
import com.fenghuang.util.Pagination;
@Repository
public class XianluDaoImpl extends BaseDao implements IXianluDao {
	@Autowired
	public XianluDaoImpl(@Qualifier("dataSource") DataSource dataSource){
		super(dataSource);
	}
	
	@Override
	public boolean AddXianlu(Xianlu x) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delXianlu(Xianlu x) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean updateXianlu(Xianlu x) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Pagination<Xianlu> xianluinfo(int page, int rows, Xianlu x)
			throws Exception {
		// TODO Auto-generated method stub
		String sql = "select * FROM xianlu where 1=1 ";
		StringBuffer sb = new StringBuffer(sql);
		if(x.getXianid()!=0){			
			sb.append(" and xianid='"+x.getXianid()+"'");
		}
		return this.getPagination(page, rows, sb.toString());
	}

}
