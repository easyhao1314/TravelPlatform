package com.fenghuang.service;

import com.fenghuang.entiey.Users;
import com.fenghuang.util.Pagination;

public interface IUsersService {

	public boolean saveUsers(Users users) throws Exception;

	public boolean updateUsers(Users users) throws Exception;

	public boolean deleteUserById(Long id) throws Exception;

	public Pagination<Users> getPaginationUsers(int currentPage,
			int numPerPage, Users users) throws Exception;

	public Users getUsersById(Long id) throws Exception;
}
