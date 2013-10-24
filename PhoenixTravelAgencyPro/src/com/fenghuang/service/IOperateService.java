package com.fenghuang.service;

import com.fenghuang.entiey.Operate;
import com.fenghuang.util.Pagination;

public interface IOperateService {
	public boolean AddOperate(Operate o);
	public boolean UpOperate(Operate o);
	public Pagination<Operate> OperateInfo(int page,int rows,Operate o);
	public boolean Delete(Operate o)throws Exception;
}
