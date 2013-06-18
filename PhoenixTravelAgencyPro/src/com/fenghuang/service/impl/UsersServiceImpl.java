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

}
