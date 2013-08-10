/**
 * 
 */
package com.fenghuang.dao;

import java.util.List;

import com.fenghuang.entiey.RoleAndMenuPermission;

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
public interface IRoleAndMenuPermissionDao {
	/**
	 * 根据角色id 获得RoleAndMenuPermission对象
	 * @param roleId
	 * @return
	 * @throws Exception
	 */
	public List<RoleAndMenuPermission> getRoleAndMenuPermissionsByRoleId(Long roleId) throws Exception;
	
	public boolean insertRoleAndMenuPermisson(Long roleId,Long mpid)throws Exception;
	
	public boolean deleteRoleAndMenuPermission(Long roleId,Long mpid) throws Exception;

}

