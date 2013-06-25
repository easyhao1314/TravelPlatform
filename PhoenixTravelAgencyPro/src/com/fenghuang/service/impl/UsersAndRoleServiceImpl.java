/**
 * 
 */
package com.fenghuang.service.impl;

import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fenghuang.dao.IUsersAndRoleDao;
import com.fenghuang.entiey.UsersAndRole;
import com.fenghuang.service.IUsersAndRoleService;

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
@Service
public class UsersAndRoleServiceImpl implements IUsersAndRoleService {
    @Autowired   
	private IUsersAndRoleDao iUsersAndRoleDao;
	
	@Override
	public boolean saveUsersAndRole(UsersAndRole usersAndRole) throws Exception {
		return iUsersAndRoleDao.saveUsersAndRole(usersAndRole);
	}

	@Override
	public boolean deleteUsersAndRole(Long id) throws Exception {
		return iUsersAndRoleDao.deleteUsersAndRole(id);
	}

	@Override
	public void saveUsersAndRoles(List<UsersAndRole> usersAndRoles)
			throws Exception {
		for (Iterator iterator = usersAndRoles.iterator(); iterator.hasNext();) {
			UsersAndRole usersAndRole = (UsersAndRole) iterator.next();
			iUsersAndRoleDao.saveUsersAndRole(usersAndRole);
		}
	}

	@Override
	public void deleteUsersAndRoles(List<UsersAndRole> usersAndRoles)
			throws Exception {
		for (Iterator iterator = usersAndRoles.iterator(); iterator.hasNext();) {
			UsersAndRole usersAndRole = (UsersAndRole) iterator.next();
			if(usersAndRole.getId() != null){
				iUsersAndRoleDao.deleteUsersAndRole(usersAndRole.getId());
			}
		}
	}

}
