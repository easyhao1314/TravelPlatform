package com.fenghuang.service.impl;

import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fenghuang.dao.IRoleDao;
import com.fenghuang.entiey.Role;
import com.fenghuang.entiey.RoleAndMenuPermission;
import com.fenghuang.entiey.RoleAndPagePermission;
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

	/* 
	 * @see com.fenghuang.service.IRoleService#updateRoles(java.util.List)
	 */
	@Override
	public void updateRoles(List<Role> roles) throws Exception {
		for (Iterator iterator = roles.iterator(); iterator.hasNext();) {
			Role role = (Role) iterator.next();
			if(role.getId() !=null&&role.getId()!=0){
				iRoleDao.updateRole(role);
			}else{
				iRoleDao.saveRole(role);
			}
			
		}
	}

	/* 
	 * @see com.fenghuang.service.IRoleService#deleteRoles(java.util.List)
	 */
	@Override
	public void deleteRoles(List<Role> roles) throws Exception {
		
		for (Iterator iterator = roles.iterator(); iterator.hasNext();) {
			Role role = (Role) iterator.next();
			if(role.getId()!=null){
				iRoleDao.deteleRoleById(role.getId());
			}
		}
	}

	@Override
	public boolean saveRoleAndMenuPermission(
			RoleAndMenuPermission roleAndMenuPermission) throws Exception {
		return iRoleDao.saveRoleAndMenuPermission(roleAndMenuPermission);
	}

	@Override
	public boolean deleteRoleAndMenuPermission(Long id) throws Exception {
		return iRoleDao.deleteRoleAndMenuPermission(id);
	}

	@Override
	public boolean saveRoleAndPagePermission(
			RoleAndPagePermission roleAndPagePermission) throws Exception {
		return iRoleDao.saveRoleAndPagePermission(roleAndPagePermission);
	}

	@Override
	public boolean deleteRoleAndPagePermission(Long id) throws Exception {
		return iRoleDao.deleteRoleAndMenuPermission(id);
	}

	
	@Override
	public void insertRoleAddMenuPermissions(
			List<RoleAndMenuPermission> roleAndMenuPermissions)
			throws Exception {
		for (Iterator iterator = roleAndMenuPermissions.iterator(); iterator
				.hasNext();) {
			RoleAndMenuPermission roleAndMenuPermission = (RoleAndMenuPermission) iterator
					.next();
				iRoleDao.saveRoleAndMenuPermission(roleAndMenuPermission);
		}
	}


	@Override
	public void deleteRoleAndMenuPermissions(
			List<RoleAndMenuPermission> roleAndMenuPermissions)
			throws Exception {
		for (Iterator iterator = roleAndMenuPermissions.iterator(); iterator
				.hasNext();) {
			RoleAndMenuPermission roleAndMenuPermission = (RoleAndMenuPermission) iterator
					.next();
			if(roleAndMenuPermission.getId() != null){
				iRoleDao.deleteRoleAndMenuPermission(roleAndMenuPermission.getId());
			}
			
		}
	}

	
	@Override
	public void insertRoleAndPagePermissions(
			List<RoleAndPagePermission> roleAndPagePermissions)
			throws Exception {
		for (Iterator iterator = roleAndPagePermissions.iterator(); iterator
				.hasNext();) {
			RoleAndPagePermission roleAndPagePermission = (RoleAndPagePermission) iterator
					.next();
			iRoleDao.saveRoleAndPagePermission(roleAndPagePermission);
		}
	}
	@Override
	public void deleteRoleAndPagePermissions(
			List<RoleAndPagePermission> roleAndPagePermissions)
			throws Exception {
		for (Iterator iterator = roleAndPagePermissions.iterator(); iterator
				.hasNext();) {
			RoleAndPagePermission roleAndPagePermission = (RoleAndPagePermission) iterator
					.next();
			if(roleAndPagePermission.getId() != null){
				iRoleDao.deleteRoleAndPagePermission(roleAndPagePermission.getId());
			}
			
		}
		
	}

}
