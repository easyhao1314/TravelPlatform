package com.fenghuang.service;

import com.fenghuang.entiey.Sanpinzhongxin;
import com.fenghuang.util.Pagination;

public interface ISanpinzhongxinService {
	//添加散拼信息
	public boolean AddSanpinzhongxin(Sanpinzhongxin sanpin,String areatypetext)throws Exception;
	//分页查询散拼列表
	public Pagination<Sanpinzhongxin> getByQueryConditionPagination(int currentPage,int numPerPage,Sanpinzhongxin s) throws Exception;
	//修改散拼中心
	public boolean upSanpinzhongxin(Sanpinzhongxin sanpin)throws Exception;
	//删除散拼
	public boolean DeleteSanpinzhongxin(Sanpinzhongxin sanpin,String xianluid)throws Exception;
}
