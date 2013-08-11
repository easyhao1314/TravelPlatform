/**
 * 
 */
package com.fenghuang.service;

import com.fenghuang.entiey.UsersAndRole;
import java.util.List;
/**
 * @author 鲍国浩
 * 
 *         版本 ： 1.0
 * 
 *         日期 ：2013-6-25
 * 
 *         描述 ：
 * 
 * 
 */
public interface IUsersAndRoleService {

	public boolean saveUsersAndRole(UsersAndRole usersAndRole) throws Exception;

	public boolean deleteUsersAndRole(Long id) throws Exception;

	public void saveUsersAndRoles(List<UsersAndRole> usersAndRoles) throws Exception;

	public void deleteUsersAndRoles(List<UsersAndRole> usersAndRoles) throws Exception;
	public boolean deleteUsersAndRole(Long userId,Long roleId)throws Exception;


}
