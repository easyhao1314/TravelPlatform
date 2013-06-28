package com.fenghuang.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fenghuang.dao.IZyHangkongDao;
import com.fenghuang.entiey.Hangkong;
import com.fenghuang.service.IZyHangkongService;
import com.fenghuang.util.Pagination;
@Service
public class ZyHangkongServiceImpl implements IZyHangkongService{
	@Autowired
	public IZyHangkongDao izhd;

	@Override
	public boolean hangkongAdd(Hangkong hk) throws Exception {
		// TODO Auto-generated method stub
		return izhd.hangkongAdd(hk);
	}

	@Override
	public boolean hangkongDelete(long id) throws Exception {
		// TODO Auto-generated method stub
		return izhd.hangkongDelete(id);
	}

	@Override
	public boolean hangkongUpdate(Hangkong hk) throws Exception {
		// TODO Auto-generated method stub
		return izhd.hangkongUpdate(hk);
	}

	@Override
	public List<Map<String, Object>> hangkongSelectId(long id) throws Exception {
		// TODO Auto-generated method stub
		return izhd.hangkongSelectId(id);
	}

	@Override
	public Pagination<Hangkong> hangkongSelect(int currentPage, int numPerPage)
			throws Exception {
		// TODO Auto-generated method stub
		return izhd.hangkongSelect(currentPage, numPerPage);
	}

	@Override
	public Pagination<Hangkong> hangkongSelectLike(int currentPage,
			int numPerPage, String daima, String name) throws Exception {
		// TODO Auto-generated method stub
		return izhd.hangkongSelectLike(currentPage, numPerPage, daima, name);
	}

}
