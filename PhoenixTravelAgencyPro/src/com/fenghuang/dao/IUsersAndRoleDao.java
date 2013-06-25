/**
 * 
 */
package com.fenghuang.dao;

import com.fenghuang.entiey.UsersAndRole;

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
public interface IUsersAndRoleDao {
	
	public boolean saveUsersAndRole(UsersAndRole usersAndRole) throws Exception;
	public boolean deleteUsersAndRole(Long id) throws Exception;

}
