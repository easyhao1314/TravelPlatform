package com.fenghuang.dao.impl;

import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fenghuang.dao.BaseDao;
import com.fenghuang.dao.IdingdaoyouDao;
import com.fenghuang.entiey.Dingdaoyou;
import com.fenghuang.util.Pagination;
@Repository
public class DingdaoyouDaoImpl extends BaseDao implements IdingdaoyouDao{
	@Autowired
	public DingdaoyouDaoImpl(DataSource dataSource) {
		super(dataSource);
		// TODO Auto-generated constructor stub
	}

	@Override
	public Pagination<Dingdaoyou> dingdaoyouSelect(int currentPage,
			int numPerPage,Dingdaoyou ddy) throws Exception {
		// TODO Auto-generated method stub
		String sql="select dt.tuanNo,dt.tuanName,dt.ctsj,dt.htsj,dt.cfrs ,ddy.daoyouId from dantuanxinxi as dt,dingdaoyou as ddy where dt.tuanNo=ddy.tuanNo ";
		
		return this.getPagination(currentPage, numPerPage, sql);
	}

	@Override
	public boolean dingdaoyouAdd(Dingdaoyou dy) throws Exception {
		// TODO Auto-generated method stub
		String sql="insert into dingdaoyou(tuanNo,daoyouId,beizhu) values(?,?,?)";
		int count=this.update(sql,dy.getTuanNo(),dy.getDaoyouId(),dy.getBeizhu());
		return count>0;
	}

	@Override
	public boolean dingdaoyouDelete(long id) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<Map<String, Object>> dingdaoyouSelectId(long id)
			throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean dingdaoyouUpdate(Dingdaoyou dy) throws Exception {
		// TODO Auto-generated method stub
		String sql="update dingdaoyou set tuanNo=?,daoyouId=?,beizhu=? where id=?";
		int count=this.update(sql,dy.getTuanNo(),dy.getDaoyouId(),dy.getBeizhu(),dy.getId());
		return count>0;
	}

}
