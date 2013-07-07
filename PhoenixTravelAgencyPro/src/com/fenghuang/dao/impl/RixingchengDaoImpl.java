package com.fenghuang.dao.impl;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.fenghuang.dao.BaseDao;
import com.fenghuang.dao.IRixingchengDao;
import com.fenghuang.entiey.Rixingcheng;
import com.fenghuang.util.Pagination;
@Repository
public class RixingchengDaoImpl extends BaseDao implements IRixingchengDao {
	@Autowired
	public RixingchengDaoImpl(@Qualifier("dataSource") DataSource dataSource){
		super(dataSource);
	}
	@Override
	public boolean insert(Rixingcheng ri) throws Exception {
		// TODO Auto-generated method stub
		String sql = "insert into rixingcheng (id,richenganpai,moren,caiyong,tujingchengshiid) values(?,?,?,?,?)";
		StringBuffer sb = new StringBuffer(sql);
		int num = this.update(sb.toString(),ri.getId(),ri.getRichenganpai(),ri.getMoren(),ri.getCaiyong(),ri.getTujingchengshiid());
		return num>0;
	}

	@Override
	public boolean delete(Rixingcheng ri) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean Update(Rixingcheng ri) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Pagination<Rixingcheng> getByQueryConditionPagination(
			int currentPage, int numPerPage, Rixingcheng r) throws Exception {
		// TODO Auto-generated method stub
		String sql = "select * from rixingcheng where 1=1";
		StringBuffer sb = new StringBuffer(sql);
		return this.getPagination(currentPage, numPerPage, sb.toString());
	}

}
