/**
 * 
 */
package com.fenghuang.dao.impl;


import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.fenghuang.dao.BaseDao;
import com.fenghuang.dao.IOperCenterDao;
import com.fenghuang.entiey.DantuanXinXi;
import com.fenghuang.util.Pagination;

/**
 * @author 陈家海
 */
@Repository
public class OperCenterDaoImpl extends BaseDao implements
		IOperCenterDao {
	
	@Autowired
	public OperCenterDaoImpl(@Qualifier("dataSource") DataSource dataSource) {
		super(dataSource);
	}
	
	@Override
	public Pagination<DantuanXinXi> getTeamsPaginations(int currentPage,
			int numPerPage,String startTime , String endTime , String tuanhao,String tuanming) {
		StringBuffer sql = new StringBuffer("select d.*,c.name from dantuanxinxi d inner JOIN customerinfo c  on d.khId = c.id WHERE 1=1 ") ;
		if(startTime !=null && !"".equals(startTime)){
			sql.append(" AND d.ctsj> '"+startTime +" '");
		}
		if(endTime != null && !"".equals(endTime)){
			sql.append(" AND d.htsj< '"+endTime+" '");
		}
		if(tuanhao !=null &&!"".equals(tuanhao)){
			sql.append(" AND d.tuanNO = "+tuanhao);
		}
		if(tuanming !=null &&!"".equals(tuanming)){
			sql.append(" AND d.tdm like '%");
			sql.append(tuanming);
			sql.append("%'");
		}
		
		return this.getPagination(currentPage, numPerPage, sql.toString());
	}

	
	@Override
	public Pagination<DantuanXinXi> getDingFangRenWuPaginations(
			int currentPage, int numPerPage, String chutuanStartTime,
			String chutuanEndTime, String kw) {
		StringBuffer sql = new StringBuffer("SELECT * FROM dantuanxinxi d WHERE 1=1 ") ;
		if(chutuanStartTime !=null && !"".equals(chutuanStartTime)){
			sql.append(" AND d.ctsj> '"+chutuanStartTime +" '");
		}
		if(chutuanEndTime != null && !"".equals(chutuanEndTime)){
			sql.append(" AND d.htsj< '"+chutuanEndTime+" '");
		}
		if(kw != null && !"".equals(kw)){
			sql.append(" AND d.tdm LIKE '%");
			sql.append(kw);
			sql.append("%'");
		}
		
		return this.getPagination(currentPage, numPerPage, sql.toString());
	}

	@Override
	public String findCustomerNameById(Long khId) {
		String sql = "SELECT c.name FROM customerinfo c WHERE c.id=?" ;
		return this.queryForObject(sql, new Object[]{khId.intValue()}, java.lang.String.class);
	}

	
}
