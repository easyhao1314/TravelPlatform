package com.fenghuang.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fenghuang.dao.IRoleDao;
import com.fenghuang.entiey.Role;
import com.fenghuang.service.IRoleService;
import com.fenghuang.util.Pagination;

@Service
public class RoleServiceImpl implements IRoleService {

	@Autowired
	private IRoleDao iRoleDao;
	
	@Override
	public boolean saveRole(Role role) throws Exception {
		return iRoleDao.saveRole(role);
	}

	@Override
	public boolean updateRole(Role role) throws Exception {
		return iRoleDao.updateRole(role);
	}

	@Override
	public boolean deteleRoleById(Long id) throws Exception {
		return iRoleDao.deteleRoleById(id);
	}

	@Override
	public Pagination<Role> getPaginationRoles(int currentPage, int numPerPage,
			String roleNo, String roleName, String roleDesc) throws Exception {
		return iRoleDao.getPaginationRoles(currentPage, numPerPage, roleNo, roleName, roleDesc);
	}

}
