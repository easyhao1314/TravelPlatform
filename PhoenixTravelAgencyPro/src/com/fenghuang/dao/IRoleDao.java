package com.fenghuang.dao;

import java.util.List;
import java.util.Map;

import com.fenghuang.entiey.FunctionMenu;
import com.fenghuang.entiey.Role;
import com.fenghuang.entiey.RoleAndMenuPermission;
import com.fenghuang.entiey.RoleAndPagePermission;
import com.fenghuang.util.Pagination;

/**
 * 
 * @author 鲍国浩
 * 
 *         日期 @2013-6-18
 * 
 *         描述：
 * 
 * 
 * 
 */
public interface IRoleDao {

	public boolean saveRole(Role role) throws Exception;

	public boolean updateRole(Role role) throws Exception;

	public boolean deteleRoleById(Long id) throws Exception;

	public Pagination<Role> getPaginationRoles(int currentPage, int numPerPage,
			String roleNo, String roleName, String roleDesc) throws Exception;

	public boolean saveRoleAndMenuPermission(
			RoleAndMenuPermission roleAndMenuPermission) throws Exception;

	public boolean deleteRoleAndMenuPermission(Long id) throws Exception;

	public boolean saveRoleAndPagePermission(
			RoleAndPagePermission roleAndPagePermission) throws Exception;

	public boolean deleteRoleAndPagePermission(Long id) throws Exception;


}
