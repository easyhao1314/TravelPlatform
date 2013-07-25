package com.fenghuang.dao;


import java.util.List;
import java.util.Map;

import ch.qos.cal10n.BaseName;

import com.fenghuang.entiey.CustomerAreaWeihu;
import com.fenghuang.entiey.CustomerInfo;
import com.fenghuang.entiey.ProvinceSettingDictionary;
import com.fenghuang.entiey.TeamProgressStateDictionary;
import com.fenghuang.util.Pagination;

public interface ICustomerCenterDao{

	/**
	 * 客户信息列表查询
	 * @param currentPage 当前页数
	 * @param numPerPage  每页显示多少条记录
	 * @param kw 关键字
	 * @return
	 */
	public Pagination<CustomerInfo>  getCustomInfoListPaginations(int currentPage,int numPerPage,String name, String type, String lxr,String moblePhone,String telePhone,String qq,String msn, String daqu, String city, String hzjb, String xiaoshou,String zhtime,String jituan);
	/**
	 * 新增客户信息
	 * @param customInfo
	 * @return
	 */
	public boolean addCustom(CustomerInfo customInfo);
	
	
	/**
	 * 根据Id删除客户信息
	 * @param id
	 * @return
	 */
	public boolean deleteCustomById(String id);
	
	/**
	 * 根据Id查询客户信息
	 * @param updateId
	 * @return
	 */
	public List<Map<String, Object>> findCustomerInfoById(String updateId);

	/**
	 * 修改客户信息
	 * @param customerInfo
	 * @return
	 */
	public boolean updateCustom(CustomerInfo customerInfo);
	
	/**
	 * 修改销售
	 * @param customerInfo
	 * @return
	 */
	public boolean updateXiaoshou(CustomerInfo Customer);

	
	/**
	 * 查询所有客户名称
	 * @return
	 */
	public List<Map<String,Object>> findAllCustomName();
	
	
	
	/**
	 * 修改联系人信息
	 * @param contactInfo
	 * @return
	 */
	public boolean updateContact(CustomerInfo contactInfo);
	
}
