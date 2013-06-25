package com.fenghuang.dao.impl;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.fenghuang.dao.BaseDao;
import com.fenghuang.dao.Idantuan;
import com.fenghuang.entiey.DantuanXinXi;
import com.fenghuang.entiey.TestUser;
import com.fenghuang.entiey.dantuan;
import com.fenghuang.util.Pagination;
@Repository
public class dantuanImpl extends BaseDao implements Idantuan{

	@Autowired
	public dantuanImpl(@Qualifier("dataSource")DataSource dataSource) {
		super(dataSource);
		// TODO Auto-generated constructor stub
	}


	@Override
	public int add(dantuan dt) {
		// TODO Auto-generated method stub
		String sql="insert into dantuan(id,name,lxr,dh) values(?,?,?,?)";
       int i=this.update(sql,dt.getId(),dt.getName(),dt.getLxr(),dt.getDh());
		return i;
	}


	@Override
	public Pagination<DantuanXinXi> getByQueryConditionPagination(int currentPage,int numPerPage) throws Exception{
		String sql = "select * from dantuanxinxi";
		return this.getPagination(currentPage, numPerPage, sql);
		
	}


	@Override
	public List select() {
		// TODO Auto-generated method stub
		return null;
	}

}
