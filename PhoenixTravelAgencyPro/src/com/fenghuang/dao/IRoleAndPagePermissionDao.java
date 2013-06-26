/**
 * 
 */
package com.fenghuang.dao;

import java.util.List;

import com.fenghuang.entiey.RoleAndPagePermission;

/**
 * @author 鲍国浩
 * 
 * 版本 ： 1.0
 * 
 * 日期 ：2013-6-25
 *
 * 描述 ：
 *
 *
 */
public interface IRoleAndPagePermissionDao {
	
	public List<RoleAndPagePermission> getRoleAndPagePermissions(Long roleId) throws Exception;
	
	

}
