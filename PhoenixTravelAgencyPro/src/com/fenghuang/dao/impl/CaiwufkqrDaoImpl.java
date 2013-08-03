package com.fenghuang.dao.impl;


import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fenghuang.dao.BaseDao;
import com.fenghuang.dao.IcaiwufkqrDao;

import com.fenghuang.entiey.Tuanbiao;
import com.fenghuang.util.Pagination;

@Repository
public class CaiwufkqrDaoImpl extends BaseDao implements IcaiwufkqrDao {
	@Autowired
	public CaiwufkqrDaoImpl(DataSource dataSource) {
		super(dataSource);
		// TODO Auto-generated constructor stub
	}

	@Override
	public boolean savefkqr(Tuanbiao tuanbiao) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean updatefkqr(Tuanbiao tuanbiao) throws Exception {
		// TODO Auto-generated method stub
		String sql = "update tuanbiao set caiwuid=?  where id=?";
		int rs=this.update(sql,tuanbiao.caiwuid,tuanbiao.id);
		return rs>0;
	}

	@Override
	public boolean deletefkqr(Long id) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Pagination<Tuanbiao> getPaginationfkqr(int currentPage,
			int numPerPage, Tuanbiao tuanbiao) throws Exception {
		// TODO Auto-generated method stub
       StringBuffer sql = new StringBuffer("SELECT t.id,t.payment,t.zhanghaoid,t.team,t.suppliers,t.gysid,t.caiwuid,t.caozuo,f.status,f.review,f.confirmed,f.cashier from tuanbiao as t INNER JOIN finance as f on t.caiwuid=f.id where 1=1 ");
       if(tuanbiao.getId()!=0 && !"".equals(tuanbiao.getId())){
			sql.append(" and t.id='");
			sql.append(tuanbiao.getId());
			sql.append("'");
		
	   }
       if(tuanbiao.getCaiwuid()!=0 && !"".equals(tuanbiao.getCaiwuid())){
			sql.append(" and t.caiwuid='");
			sql.append(tuanbiao.getCaiwuid());
			sql.append("'");
		
	}
       if(tuanbiao.getTeam()!=0&&!"".equals(tuanbiao.getTeam())){
    	   
    	   sql.append(" and t.team like '");
			sql.append(tuanbiao.getTeam());
			sql.append("%'");
    	   
       }
       if(tuanbiao.getCaozuo()!=null&&!"".equals(tuanbiao.getCaozuo())){
    	   
    	   sql.append(" and t.caozuo like '");
			sql.append(tuanbiao.getCaozuo());
			sql.append("%'");
    	   
       }

    	   return this.getPagination(currentPage, numPerPage, sql.toString());
       }
	}


