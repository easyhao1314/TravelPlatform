package com.fenghuang.dao.impl;

import java.util.ArrayList;
import java.util.List;

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
	public ApprovalDaoImpl(@Qualifier("dataSource")DataSource dataSource) {
		super(dataSource);
		// TODO Auto-generated constructor stub
	}

	@Override
	public boolean ApprovalAdd(Approval a) throws Exception {
		// TODO Auto-generated method stub
		a.setShenqingDate(new java.util.Date());
		String sql="insert into Approval(shenqingDate,shiwu,shenqingren,shenheren,approvalStatus,shenpiDate,beizhu,shenpitype,approvaltuanNo,bmid) values(?,?,?,?,?,?,?,?,?,?)";
		int num =this.update(sql,a.getShenqingDate(),a.getShiwu(),a.getShenqingren(),a.getShenheren(),a.getApprovalStatus(),a.getShenpiDate(),a.getBeizhu(),a.getShenpitype(),a.getApprovaltuanNo(),a.getBmid());
		return num>0;
	}

	@Override
	public boolean ApprovalUpdate(Approval a) throws Exception {
		// TODO Auto-generated method stub
		String sql="update Approval SET shenpitype=shenpitype+1-1";
		StringBuffer sb = new StringBuffer(sql);
		List l = new ArrayList();
		if(a.getShenheren()!=0){
			sb.append(",shenheren=?");
			l.add(a.getShenheren());
		}
		if(a.getShenpiDate()!=null && !"".equals(a.getShenpiDate())){
			sb.append(",shenpidate=?");
			l.add(a.getShenpiDate());
		}
		if(a.getApprovalStatus()!=0){
			sb.append(",approvalStatus=?");
			l.add(a.getApprovalStatus());
		}
		
		int num = this.update(sb.toString(),l.toArray());
		return num>0;
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
		String sql = "select approval.*,users.userName,CASE shenpitype WHEN '1' THEN '退团' WHEN '2' THEN '转团' ELSE '报名' END AS approvaltype  from approval LEFT JOIN users ON users.id=shenqingren where 1=1";
		StringBuffer sb = new StringBuffer(sql);
		if(a.getApprovalStatus()!=0){
			sb.append(" AND approvalStatus = '"+a.getApprovalStatus()+"'");
		}
		if(a.getApprovaltuanNo()!=null && !"".equals(a.getApprovaltuanNo())){
			sb.append(" AND approvaltuanNo = '"+a.getApprovaltuanNo()+"'");
		}
		if(a.getApprovalNo()!=0){
			sb.append(" AND approvalNo = '"+a.getApprovalNo()+"'");
		}
		if(a.getShenpitype()!=0){
			sb.append(" AND shenpiType = '"+a.getShenpitype()+"'");
		}
		
		return this.getPagination(currentPage, numPerPage, sb.toString());
	}


}
