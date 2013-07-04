package com.fenghuang.service;

import com.fenghuang.entiey.Approval;
import com.fenghuang.entiey.Sanpinzhongxin;
import com.fenghuang.util.Pagination;
import com.fenghuang.web.action.approvalAction;

public interface IApprovalService {
		//添加审批事务
		public boolean ApprovalAdd(Approval a)throws Exception;
		//修改审批事务
		public boolean ApprovalUpdate(Approval a)throws Exception;
		//删除审批事务
		public boolean ApprovalDelete(Approval a)throws Exception;
		//查询审批事务
		public Pagination<Approval> getByQueryConditionPagination(int currentPage, int numPerPage,Approval a)throws Exception;
}
