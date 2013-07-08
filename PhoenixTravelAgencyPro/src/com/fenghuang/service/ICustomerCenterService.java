/**
 * 
 */
package com.fenghuang.service;

import java.util.List;
import java.util.Map;

import com.fenghuang.dao.ICustomerCenterDao;
import com.fenghuang.entiey.CustomerAreaWeihu;
import com.fenghuang.entiey.CustomerInfo;
import com.fenghuang.entiey.ProvinceSettingDictionary;
import com.fenghuang.entiey.TeamProgressStateDictionary;
import com.fenghuang.util.Pagination;

/**
 * @author 陈家海
 */
public interface ICustomerCenterService{

	/**
	 * 根据城市id查找城市名称
	 * @param city
	 * @return
	 */
	String findCityNameById(Long city);

	/**
	 * 根据Id删除客户信息
	 * @param deleteRow
	 * @return
	 */
	boolean deleteCustom(String deleteRow);

	/**
	 * 客户信息分页版本
	 * @param page easyUI中page,当前页数
	 * @param rows easyUI中rows,每页显示的记录数
	 * @param kw 关键字
	 * @return
	 */
	Pagination<CustomerInfo> getCustomInfoListPaginations(int page, int rows,
			String kw);

	/**
	 * 新增客户信息
	 * @param customInfo
	 * @return
	 */
	boolean addCustom(CustomerInfo customInfo);

	/**
	 * 查询所有客户名称
	 * @return
	 */
	List<Map<String,Object>> findAllCustomName();
	/**
	 * 查询所有城市名称
	 * @return
	 */
	List<Map<String, Object>> findAllCityName();

	/**
	 * 根据城市Id查询所属省份
	 * @param city
	 * @return
	 */
	long findProvinceByCityId(long city);

	/**
	 * 查询所有省份名称
	 * @return
	 */
	List<Map<String, Object>> findAllProvionceName();

	/**
	 * 根据Id查询客户信息
	 * @param updateId
	 * @return
	 */
	List<Map<String, Object>> findCustomerInfoById(String updateId);

	/**
	 * 修改客户信息
	 * @param customerInfo
	 * @return
	 */
	boolean updateCustom(CustomerInfo customerInfo);

	/**
	 * 修改联系人信息
	 * @param contactInfo
	 * @return
	 */
	boolean updateContact(CustomerInfo contactInfo);

	/**
	 * 分页查询客户VIP字典
	 * @param page
	 * @param rows
	 * @return
	 */
	Pagination<TeamProgressStateDictionary> getCustomVIPListPaginations(String wordprefix,
			Integer page, Integer rows);

	/**
	 * 新增客户VIP
	 * @param team
	 * @return
	 */
	boolean addCustomVIP(TeamProgressStateDictionary team);
	/**
	 * 根据Id删除客户VIP
	 * @param deleteRow
	 * @return
	 */
	boolean deleteCustomVIP(String deleteRow);

	/**
	 * 修改客户VIP
	 * @param teamProList
	 * @return
	 */
	void updateCustomVIPs(List<TeamProgressStateDictionary> teamProList);

	/**
	 * 根据条件查询客户VIP
	 * @param tpsdNo 编号
	 * @param tpsdName 名称
	 * @param tpsdHelp 帮助 提示
	 * @param tpsdSort 显示顺序
	 * @return
	 */
	List<Map<String, Object>> searchCustomVIP(String tpsdNo, String tpsdName,
			String tpsdHelp, String tpsdSort,String wordprefix);

	Pagination<CustomerAreaWeihu> findAllCustomerAreaWeihu(Integer page,Integer rows);

	boolean addCustomerArea(Integer id, String name);

	boolean deleteCustomerArea(Integer id);

	boolean updateCustomerArea(Integer updateRow,String name);
	
}
