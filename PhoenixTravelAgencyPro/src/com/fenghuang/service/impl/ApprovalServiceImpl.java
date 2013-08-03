package com.fenghuang.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fenghuang.dao.IapprovalDao;
import com.fenghuang.entiey.Approval;
import com.fenghuang.entiey.Baomingshenpi;
import com.fenghuang.entiey.Sanpinzhongxin;
import com.fenghuang.service.IApprovalService;
import com.fenghuang.service.IBaomingshenpiService;
import com.fenghuang.util.Pagination;
@Service
public class ApprovalServiceImpl implements IApprovalService {
	@Autowired
	private IapprovalDao i;
	@Autowired
	private IBaomingshenpiService ibaoming;
	@Override
	public boolean ApprovalAdd(Approval a) throws Exception {
		// TODO Auto-generated method stub
		//修改 报名、退团、转团。审批的状态 “已提交”申请。。
		Baomingshenpi b = new Baomingshenpi();
		if(a.getShenpitype()==1){
			b.setTuituanshenpi(1);
		}
		if(a.getShenpitype()==2){
			b.setZhuantuanshenpi(1);
		}
		if(a.getShenpitype()==3){
			b.setBaomingsp(1);
		}
		if(a.getBmid()!=0){
			b.setBmid(a.getBmid());
			ibaoming.updatebaoming(b);
		}
		
		return i.ApprovalAdd(a);
	}

	@Override
	public boolean ApprovalUpdate(Approval a) throws Exception {
		// TODO Auto-generated method stub
		return i.ApprovalUpdate(a);
	}

	@Override
	public boolean ApprovalDelete(Approval a) throws Exception {
		// TODO Auto-generated method stub
		return i.ApprovalDelete(a);
	}

	@Override
	public Pagination<Approval> getByQueryConditionPagination(
			int currentPage, int numPerPage, Approval a) throws Exception {
		// TODO Auto-generated method stub
		return i.getByQueryConditionPagination(currentPage, numPerPage, a);
	}


}
