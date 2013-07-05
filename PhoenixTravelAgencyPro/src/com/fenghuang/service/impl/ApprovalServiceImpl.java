package com.fenghuang.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fenghuang.dao.IapprovalDao;
import com.fenghuang.entiey.Approval;
import com.fenghuang.entiey.Sanpinzhongxin;
import com.fenghuang.service.IApprovalService;
import com.fenghuang.util.Pagination;
@Service
public class ApprovalServiceImpl implements IApprovalService {
	@Autowired
	private IapprovalDao i;
	@Override
	public boolean ApprovalAdd(Approval a) throws Exception {
		// TODO Auto-generated method stub
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
