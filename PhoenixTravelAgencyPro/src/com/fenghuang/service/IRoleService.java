package com.fenghuang.service;

import com.fenghuang.entiey.Role;
import com.fenghuang.util.Pagination;
/**
 * 
 * @author 鲍国浩
 *
 *  日期    @2013-6-18
 *  
 *  描述：
 *
 *
 *
 */
public interface IRoleService {
	public boolean saveRole(Role role) throws Exception;

	public boolean updateRole(Role role) throws Exception;

	public boolean deteleRoleById(Long id) throws Exception;

	public Pagination<Role> getPaginationRoles(int currentPage, int numPerPage,
			String roleNo, String roleName, String roleDesc) throws Exception;
}
