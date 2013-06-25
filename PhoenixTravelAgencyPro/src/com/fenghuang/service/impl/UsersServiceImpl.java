package com.fenghuang.service.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fenghuang.dao.IUserDao;
import com.fenghuang.entiey.Users;
import com.fenghuang.service.IUsersService;
import com.fenghuang.util.Pagination;

@Service
public class UsersServiceImpl  implements IUsersService {

	@Autowired
	private IUserDao  iUserDao;
	@Override
	public boolean saveUsers(Users users) throws Exception {
		return iUserDao.saveUsers(users);
	}

	@Override
	public boolean updateUsers(Users users) throws Exception {
		return iUserDao.updateUsers(users);
	}

	@Override
	public boolean deleteUserById(Long id) throws Exception {
		return iUserDao.deleteUserById(id);
	}

	@Override
	public Pagination<Users> getPaginationUsers(int currentPage,
			int numPerPage, Users users) throws Exception {
		return iUserDao.getPaginationUsers(currentPage, numPerPage, users);
	}

	@Override
	public Users getUsersById(Long id) throws Exception {
		return iUserDao.getUsersById(id);
	}

	@Override
	public boolean updateUserPassword(Long id, String newPassword)
			throws Exception {
		return iUserDao.updateUserPassword(id, newPassword);
	}

	@Override
	public String getUsersPasswordById(Long id) throws Exception {
		return iUserDao.getUsersPasswordById(id);
	}

	/* 
	 * @see com.fenghuang.service.IUsersService#isExistUserLoginName(java.lang.String)
	 */
	@Override
	public boolean isExistUserLoginName(String LoginName) throws Exception {
		return iUserDao.isExistUserLoginName(LoginName);
	}

	/* 
	 * @see com.fenghuang.service.IUsersService#getUsersByLoginName(java.lang.String)
	 */
	@Override
	public Users getUsersByLoginName(String loginName) throws Exception {
		return iUserDao.getUsersByLoginName(loginName);
	}



}
