/**
 * 
 */
package com.fenghuang.service.impl;


import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fenghuang.dao.ICustomerCenterDao;
import com.fenghuang.entiey.Baomingshenpi;
import com.fenghuang.entiey.CustomerAreaWeihu;
import com.fenghuang.entiey.CustomerInfo;
import com.fenghuang.entiey.ProvinceSettingDictionary;
import com.fenghuang.entiey.TeamProgressStateDictionary;
import com.fenghuang.service.IBaomingshenpiService;
import com.fenghuang.service.ICustomerCenterService;
import com.fenghuang.util.Pagination;

/**
 * @author 陈家海
 */
@Service
public class CustomerCenterServiceImpl implements ICustomerCenterService {

	@Resource
	private ICustomerCenterDao iCustomerCenterDao;
	@Resource
	private IBaomingshenpiService ibaoming;

	public Pagination<CustomerInfo> getCustomInfoListPaginations(int currentPage,
			int numPerPage,String tuanNo, String name, String type, String lxr,String moblePhone,String telePhone,String qq,String msn, String daqu, String city, String hzjb, String xiaoshou,String zhtime,String jituan) {
		return iCustomerCenterDao.getCustomInfoListPaginations(currentPage, numPerPage,tuanNo, name,type,lxr,moblePhone,telePhone,qq,msn,daqu,city,hzjb,xiaoshou,zhtime,jituan);
	}

	
	@Override
	public boolean addCustom(CustomerInfo customInfo) {
		Integer custom = iCustomerCenterDao.addCustom(customInfo);
		
		return custom>0; 
	}
	@Override
	public boolean deleteCustomById(String id) {
		// TODO Auto-generated method stub
		Baomingshenpi b = new Baomingshenpi();
		b.setKehuid(Long.parseLong(id));
		try {
			ibaoming.deletebaoming(b);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
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

 
	@Override
	public boolean updatekehuzhongxin(List<CustomerInfo> customerInfo) {
		// TODO 页面      行模式添加，修改
		 boolean b =false;
         for(Iterator iterator=customerInfo.iterator();iterator.hasNext();){
        	 CustomerInfo customer=(CustomerInfo) iterator.next();
        	 if(customer.getId()==0){
        		 int a = iCustomerCenterDao.addCustom(customer);
        		 if(a>0){
        			 b=true;
        		 }
        		 if(b){
        				Integer selectmaxid = iCustomerCenterDao.selectmaxid();
        			 Baomingshenpi baoming = new Baomingshenpi();
        			 if(a!=0){
        			 baoming.setKehuid(a);
        			 }
        			 if(customer.getName()!=null && !"".equals(customer.getName())){
        			 baoming.setKehuname(customer.getName());
        			 }
        			 if(customer.getSex()!=0){
        			 baoming.setSex(customer.getSex());
        			 }
        			 if(customer.getSfzn()!=null && !"".equals(customer.getSfzn())){
        			 baoming.setZhengjianhao(customer.getSfzn());
        			 }
        		 try {
        			 ibaoming.addbaoming(baoming);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
        		 }        		 
        	 }else{
        		 b =iCustomerCenterDao.updateCustom(customer);
        		 if(b){
        			 Baomingshenpi baoming = new Baomingshenpi();
        			 baoming.setKehuid(customer.getId());
        			 if(customer.getName()!=null && !"".equals(customer.getName())){
        				 baoming.setKehuname(customer.getName());
        			 }
        			 if(customer.getSex()!=0){
        				 baoming.setSex(customer.getSex());
        			 }
        			 if(customer.getSfzn()!=null && !"".equals(customer.getSfzn())){
        				 baoming.setZhengjianhao(customer.getSfzn());
        			 }
        			 
        			 try {
						ibaoming.updatebaoming(baoming);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
        		 }
        	 }
         }
		return b;
		
	}


	@Override
	public Integer selectmaxid() {
		// TODO Auto-generated method stub
		return null;
	}


}
