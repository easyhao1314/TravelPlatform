package com.fenghuang.dao.impl;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.fenghuang.dao.BaseDao;
import com.fenghuang.dao.IapprovalDao;
import com.fenghuang.entiey.Approval;
import com.fenghuang.util.Pagination;
@Repository
public class ApprovalDaoImpl extends BaseDao implements IapprovalDao {
	@Autowired
	public ApprovalDaoImpl (@Qualifier("dataSource") DataSource dataSource) {
		super(dataSource);
	}
	@Override
	public boolean ApprovalAdd(Approval a) throws Exception {
		// TODO Auto-generated method stub
		
		return false;
	}

	@Override
	public boolean ApprovalUpdate(Approval a) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean ApprovalDelete(Approval a) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}
	@Override
	public Pagination<Approval> getByQueryConditionPagination(int currentPage, int numPerPage,Approval a)
			throws Exception {
		// TODO Auto-generated method stub
		String sql = "select *  from approval where 1=1";
		StringBuffer sb = new StringBuffer(sql);
		return this.getPagination(currentPage, numPerPage, sb.toString());
	}


}
