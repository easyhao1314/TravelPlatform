/**
 * 
 */
package com.fenghuang.service.impl;


import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fenghuang.dao.ICustomerCenterDao;
import com.fenghuang.entiey.CustomerAreaWeihu;
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
			int numPerPage, String name, String type, String lxr,String moblePhone,String telePhone,String qq,String msn, String daqu, String city, String hzjb, String xiaoshou,String zhtime,String jituan) {
		return iCustomerCenterDao.getCustomInfoListPaginations(currentPage, numPerPage, name,type,lxr,moblePhone,telePhone,qq,msn,daqu,city,hzjb,xiaoshou,zhtime,jituan);
	}

	
	@Override
	public boolean addCustom(CustomerInfo customInfo) {
		return iCustomerCenterDao.addCustom(customInfo);
	}
	@Override
	public boolean deleteCustomById(String id) {
		// TODO Auto-generated method stub
		return iCustomerCenterDao.deleteCustomById(id);
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
	public List<Map<String,Object>> findAllCustomName() {
		return iCustomerCenterDao.findAllCustomName();
	}
	@Override
	public boolean updateContact(CustomerInfo contactInfo) {
		return iCustomerCenterDao.updateContact(contactInfo);
	}


	@Override
	public boolean updateXiaoshou(CustomerInfo Customer) {
		// TODO Auto-generated method stub
		return iCustomerCenterDao.updateXiaoshou(Customer);
	}


}
