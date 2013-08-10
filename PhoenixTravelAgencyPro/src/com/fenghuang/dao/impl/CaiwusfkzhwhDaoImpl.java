package com.fenghuang.dao.impl;

import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fenghuang.dao.BaseDao;
import com.fenghuang.dao.Icaiwusfkzhwh;
import com.fenghuang.entiey.Account;
import com.fenghuang.util.Pagination;

@Repository
public class CaiwusfkzhwhDaoImpl extends BaseDao implements Icaiwusfkzhwh {
	@Autowired
	public CaiwusfkzhwhDaoImpl(DataSource dataSource) {
		super(dataSource);
		// TODO Auto-generated constructor stub
	}

	@Override
	public boolean saveaccount(Account account) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean updateaccount(Account account) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteaccount(Long id) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Pagination<Account> getPaginationfkqr(int currentPage,
			int numPerPage, Account account) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Map<String, Object>> getDictionaryComboboxs() throws Exception {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM Account";
		List<Map<String,Object>>  dics =this.queryForList(sql);
		return dics;
	}

}
