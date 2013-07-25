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
	 * 根据城市Id查询城市名称
	 * @param value
	 * @return
	 */
	public String findCityNameById(Long city);
	
	/**
	 * 根据Id删除客户信息
	 * @param id
	 * @return
	 */
	public boolean deleteCustomById(String id);

	/**
	 * 新增客户信息
	 * @param customInfo
	 * @return
	 */
	public boolean addCustom(CustomerInfo customInfo);
	
	/**
	 * 查询所有客户名称
	 * @return
	 */
	public List<Map<String,Object>> findAllCustomName();
	/**
	 * 查询所有城市名称
	 * @return
	 */
	public List<Map<String, Object>> findAllCityName();


	/**
	 * 根据城市Id查询所属省份
	 * @param city
	 * @return
	 */
	public long findProvinceByCityId(long city);

	/**
	 * 查询所有省份
	 * @return
	 */
	public List<Map<String, Object>> findAllProvionceName();

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
	// TOD修改销售
	public boolean updateXiaoshou(CustomerInfo Customer);
		
	/**
	 * 修改联系人信息
	 * @param contactInfo
	 * @return
	 */
	public boolean updateContact(CustomerInfo contactInfo);

	
	/**
	 * 分页查询客户VIP字典
	 * @param page
	 * @param rows
	 * @return
	 */
	public Pagination<TeamProgressStateDictionary> getCustomVIPListPaginations(
			String wordprefix , Integer page, Integer rows);

	/**
	 * 新增客户VIP
	 * @param team
	 * @return
	 */
	public boolean addCustomVIP(TeamProgressStateDictionary team);

	/**
	 * 根据Id删除客户VIP
	 * @param deleteRow
	 * @return
	 */
	public boolean deleteCustomVIP(String deleteRow);

	/**
	 * 修改客户VIP,多条记录
	 * @param teamProList
	 * @return
	 */
	public void updateCustomVIPs(List<TeamProgressStateDictionary> teamProList);
	
	/**
	 * 修改客户VIP
	 * @param tpsdNo
	 * @return
	 */
	public boolean updateCustomVIP(TeamProgressStateDictionary team) ;

	/**
	 * 查询客户VIP
	 * @param tpsdNo
	 * @param tpsdName
	 * @param tpsdHelp
	 * @param tpsdSort
	 * @return
	 */
	public List<Map<String, Object>> searchCustomVIP(String tpsdNo,
			String tpsdName, String tpsdHelp, String tpsdSort,String wordprefix);

	public Pagination<CustomerAreaWeihu> findAllCustomerAreaWeihu(Integer page ,Integer rows);

	public boolean addCustomerArea(Integer id, String name);

	public boolean deleteCustomerArea(Integer id);

	public boolean updateCustomerArea(Integer updateRow,String name);
	
}
