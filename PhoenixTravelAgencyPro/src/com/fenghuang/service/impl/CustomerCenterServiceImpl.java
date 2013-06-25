/**
 * 
 */
package com.fenghuang.service.impl;


import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fenghuang.dao.ICustomerCenterDao;
import com.fenghuang.entiey.CustomerInfo;
import com.fenghuang.entiey.ProvinceSettingDictionary;
import com.fenghuang.entiey.TeamProgressStateDictionary;
import com.fenghuang.service.ICustomerCenterService;
import com.fenghuang.util.Pagination;

/**
 * @author 陈家海
 */
@Service
public class CustomerCenterServiceImpl implements ICustomerCenterService {

	@Resource
	private ICustomerCenterDao iCustomerCenterDao;

	public Pagination<CustomerInfo> getCustomInfoListPaginations(int currentPage,
			int numPerPage, String kw) {
		return iCustomerCenterDao.getCustomInfoListPaginations(currentPage, numPerPage, kw);
	}

	@Override
	public String findCityNameById(Long city) {
		return iCustomerCenterDao.findCityNameById(city);
	}


	@Override
	public boolean deleteCustom(String deleteRow) {
		return iCustomerCenterDao.deleteCustomById(deleteRow);
	}

	@Override
	public boolean addCustom(CustomerInfo customInfo) {
		return iCustomerCenterDao.addCustom(customInfo);
	}

	@Override
	public List<Map<String,Object>> findAllCustomName() {
		return iCustomerCenterDao.findAllCustomName();
	}

	@Override
	public List<Map<String, Object>> findAllCityName() {
		return iCustomerCenterDao.findAllCityName();
	}

	@Override
	public long findProvinceByCityId(long city) {
		return iCustomerCenterDao.findProvinceByCityId(city);
	}

	@Override
	public List<Map<String, Object>> findAllProvionceName() {
		return iCustomerCenterDao.findAllProvionceName();
	}

	@Override
	public List<Map<String, Object>> findCustomerInfoById(String updateId) {
		return iCustomerCenterDao.findCustomerInfoById(updateId);
	}

	@Override
	public boolean updateCustom(CustomerInfo customerInfo) {
		return iCustomerCenterDao.updateCustom(customerInfo);
	}

	@Override
	public boolean updateContact(CustomerInfo contactInfo) {
		return iCustomerCenterDao.updateContact(contactInfo);
	}

	@Override
	public Pagination<TeamProgressStateDictionary> getCustomVIPListPaginations(
			Integer page, Integer rows) {
		return iCustomerCenterDao.getCustomVIPListPaginations(page,rows);
	}

	@Override
	public boolean addCustomVIP(TeamProgressStateDictionary team) {
		return iCustomerCenterDao.addCustomVIP(team);
	}

	@Override
	public boolean deleteCustomVIP(String deleteRow) {
		return iCustomerCenterDao.deleteCustomVIP(deleteRow);
	}

	@Override
	public void updateCustomVIPs(List<TeamProgressStateDictionary> teamProList) {
		iCustomerCenterDao.updateCustomVIPs(teamProList);
	}

	@Override
	public List<Map<String, Object>> searchCustomVIP(String tpsdNo,
			String tpsdName, String tpsdHelp, String tpsdSort) {
		return iCustomerCenterDao.searchCustomVIP( tpsdNo, tpsdName, tpsdHelp,  tpsdSort);
	}






}
