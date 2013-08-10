package com.fenghuang.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fenghuang.dao.IcaiwuskzhanghaoDao;
import com.fenghuang.entiey.Account;
import com.fenghuang.entiey.CitySettingDictionary;
import com.fenghuang.service.IcaiwuskzhanghaoService;
import com.fenghuang.util.Pagination;
@Service
public  class CaiwuskzhanghaoServiceImpl  implements IcaiwuskzhanghaoService{
	@Autowired
	IcaiwuskzhanghaoDao dao;
	@Override
	public boolean saveCitySettingDictionary(CitySettingDictionary citySd)
			throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean saveaccount(Account account) throws Exception {
		// TODO Auto-generated method stub
	
		return dao.saveaccount(account);
	}

	@Override
	public boolean updateaccount(Account account) throws Exception {
		// TODO Auto-generated method stub
		return dao.updateaccount(account);
	}

	@Override
	public boolean deleteaccount(Long id) throws Exception {
		// TODO Auto-generated method stub
		return dao.deleteaccount(id);
	}

	@Override
	public Pagination<Account> getPaginationfkqr(int currentPage,
			int numPerPage, Account account) throws Exception {
		// TODO Auto-generated method stub
		return dao.getPaginationfkqr(currentPage, numPerPage, account);
	}

	@Override
	public List<Map<String, Object>> getDictionaryComboboxs() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	

}
