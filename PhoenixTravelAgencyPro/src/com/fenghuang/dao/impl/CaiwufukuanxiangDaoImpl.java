package com.fenghuang.dao.impl;

import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fenghuang.dao.BaseDao;
import com.fenghuang.dao.Icaiwufukuanxiang;
import com.fenghuang.entiey.Fukuanxiang;
import com.fenghuang.util.Pagination;
@Repository
public class CaiwufukuanxiangDaoImpl extends BaseDao implements Icaiwufukuanxiang{
	@Autowired
	public CaiwufukuanxiangDaoImpl(DataSource dataSource) {
		super(dataSource);
		// TODO Auto-generated constructor stub
	}

	@Override
	public boolean savefukuan(Fukuanxiang fukuanxiang) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean updatefukuan(Fukuanxiang fukuanxiang) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deletefukuan(Long id) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Pagination<Fukuanxiang> getPaginationfkqr(int currentPage,
			int numPerPage, Fukuanxiang fukuanxiang) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Map<String, Object>> getDictionaryComboboxs() throws Exception {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM fukuanxiang";
		List<Map<String,Object>>  dics =this.queryForList(sql);
		return dics;
	}

}
