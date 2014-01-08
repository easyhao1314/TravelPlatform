package com.fenghuang.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fenghuang.dao.Itongjizhongxinsanpin;
import com.fenghuang.entiey.Tuanbiao;
import com.fenghuang.service.ItongjisanpinSerice;
import com.fenghuang.util.Pagination;
@Service
public class TongjizhongxinsanpinServiceImpl implements ItongjisanpinSerice{
	@Autowired
    Itongjizhongxinsanpin itongjizhongxinsanpin;
	@Override
	public Pagination<Tuanbiao> getPaginationsanpintongji(int currentPage,
			int numPerPage, Tuanbiao tuanbiao) throws Exception {
		// TODO Auto-generated method stub
		return itongjizhongxinsanpin.getPaginationsanpintongji(currentPage, numPerPage, tuanbiao);
	}

}
