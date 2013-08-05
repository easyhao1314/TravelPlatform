package com.fenghuang.dao.impl;

import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fenghuang.dao.BaseDao;
import com.fenghuang.dao.Icaiwushoukuanxiang;
import com.fenghuang.entiey.Shoukuanxiang;
import com.fenghuang.util.Pagination;

@Repository
public class CaiwushoukuanxiangDaoImpl extends BaseDao implements Icaiwushoukuanxiang {
	@Autowired
	public CaiwushoukuanxiangDaoImpl(DataSource dataSource) {
		super(dataSource);
		// TODO Auto-generated constructor stub
	}

	@Override
	public boolean saveshoukuan(Shoukuanxiang shoukuanxiang) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean updateshoukuan(Shoukuanxiang shoukuanxiang) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteshoukuan(Long id) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Pagination<Shoukuanxiang> getPaginationfkqr(int currentPage,
			int numPerPage, Shoukuanxiang shoukuanxiang) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Map<String, Object>> getDictionaryComboboxs() throws Exception {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM shoukuanxiang";
		List<Map<String,Object>>  dics =this.queryForList(sql);
		return dics;
	}

}
