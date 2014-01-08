package com.fenghuang.dao.impl;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fenghuang.dao.BaseDao;
import com.fenghuang.dao.Itongjizhongxinsanpin;
import com.fenghuang.entiey.Tuanbiao;
import com.fenghuang.util.Pagination;

@Repository
public class TongjizhongxinsanpinImpl extends BaseDao implements Itongjizhongxinsanpin {
	@Autowired
	public TongjizhongxinsanpinImpl(DataSource dataSource) {
		super(dataSource);
		// TODO Auto-generated constructor stub
	}

	@Override
	public Pagination<Tuanbiao> getPaginationsanpintongji(int currentPage,
			int numPerPage, Tuanbiao tuanbiao) throws Exception {
		// TODO Auto-generated method stub
		StringBuffer sql=new StringBuffer("SELECT t.khmc,t.id,t.renshu,z.tuanName AS sanpinName,z.groupdate as sanpinchutuan,z.Tourdate as sanpinhuituan,s.userName as xiaoshouyuan from tuanbiao AS t LEFT JOIN users AS s ON s.id=t.xiaoshou   LEFT JOIN sanpinzhongxin ON t.tuanduimc = sanpinzhongxin.tuanNo LEFT JOIN users as jiantuanren ON jiantuanren.id=sanpinzhongxin.jiantuanren LEFT JOIN sanpinzhongxin as z on z.tuanNo=t.tuanduimc  where shanchu=1  ");
		return this.getPagination(currentPage, numPerPage, sql.toString());
	}
	
	@Override
	public boolean savefkqr(Tuanbiao tuanbiao) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean updatefkqr(Tuanbiao tuanbiao) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deletefkqr(Long id) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

}
