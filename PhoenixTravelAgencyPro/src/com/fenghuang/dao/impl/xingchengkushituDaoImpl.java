package com.fenghuang.dao.impl;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.fenghuang.dao.BaseDao;
import com.fenghuang.dao.IxingchengkushituDao;
import com.fenghuang.entiey.Xianlu;
import com.fenghuang.entiey.xingchengkushitu;
import com.fenghuang.util.Pagination;

@Repository
public class xingchengkushituDaoImpl extends BaseDao implements IxingchengkushituDao {
	@Autowired
	public xingchengkushituDaoImpl(@Qualifier("dataSource") DataSource datasource) {
		super(datasource);
		// TODO Auto-generated constructor stub
	}

	@Override
	public Pagination<xingchengkushitu> xingchengkushituinfo(xingchengkushitu xc)
			throws Exception {
		// TODO Auto-generated method stub
		String sql = "SELECT xianid,xianluname,tianshu,guojia,weihuren,riid,richenganpai,huodong,jiudian,chengshiid,jiaotong,zao,zhong,wan FROM xrandxr WHERE xianid=xianluid AND riid=richengid ";
		StringBuffer sb = new StringBuffer(sql);
		if(xc.getXianluid()!=0){
			sb.append(" AND xianid='"+xc.getXianluid()+"'");
		}
		return this.getPagination(1, 1000, sb.toString());
	}

	@Override
	public Pagination<Xianlu> xianlu(int currentPage,int numPerPage,Xianlu xl) throws Exception {
		// TODO Auto-generated method stub
		StringBuffer sql=new StringBuffer("select * from xianlu,richeng where 1=1");
		if(xl.getXianid()!=0 &&!"".equals(xl.getXianid())){
			sql.append(" and xianid='");
			sql.append(xl.getXianid());
			sql.append("'");
		}	
		return this.getPagination(currentPage, numPerPage, sql.toString());
	}

}
