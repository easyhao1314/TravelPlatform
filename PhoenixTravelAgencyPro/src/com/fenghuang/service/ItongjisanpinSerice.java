package com.fenghuang.service;

import com.fenghuang.entiey.Tuanbiao;
import com.fenghuang.util.Pagination;

public interface ItongjisanpinSerice {
	public Pagination<Tuanbiao> getPaginationsanpintongji(int currentPage,
			int numPerPage,Tuanbiao tuanbiao)throws Exception;

}
