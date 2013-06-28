package com.fenghuang.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fenghuang.dao.IZyJiaotongDao;
import com.fenghuang.entiey.Jiaotong;
import com.fenghuang.service.IZyJiaotongService;
import com.fenghuang.util.Pagination;
@Service
public class ZyJiaotongServiceImpl implements IZyJiaotongService{
	
	@Autowired
	public IZyJiaotongDao izjd;
	@Override
	public boolean jiaotongAdd(Jiaotong jt) throws Exception {
		// TODO Auto-generated method stub
		return izjd.jiaotongAdd(jt);
	}

	@Override
	public boolean jiaotongDelete(long id) throws Exception {
		// TODO Auto-generated method stub
		return izjd.jiaotongDelete(id);
	}

	@Override
	public boolean jiaotongUpdate(Jiaotong jt) throws Exception {
		// TODO Auto-generated method stub
		return izjd.jiaotongUpdate(jt);
	}

	@Override
	public List<Map<String, Object>> jiaotongSelectId(long id) throws Exception {
		// TODO Auto-generated method stub
		return izjd.jiaotongSelectId(id);
	}

	@Override
	public Pagination<Jiaotong> jiaotongSelect(int currentPage, int numPerPage)
			throws Exception {
		// TODO Auto-generated method stub
		return izjd.jiaotongSelect(currentPage, numPerPage);
	}

	@Override
	public Pagination<Jiaotong> jiaotongSelectLike(int currentPage,
			int numPerPage, int chengshi, String name) throws Exception {
		// TODO Auto-generated method stub
		return izjd.jiaotongSelectLike(currentPage, numPerPage, chengshi, name);
	}

}
