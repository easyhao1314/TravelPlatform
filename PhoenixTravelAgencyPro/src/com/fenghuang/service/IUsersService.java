package com.fenghuang.service;

import java.util.List;
import java.util.Map;

import com.fenghuang.entiey.Users;
import com.fenghuang.util.Pagination;

public interface IUsersService {

	public boolean saveUsers(Users users) throws Exception;

	public boolean updateUsers(Users users) throws Exception;

	public boolean deleteUserById(Long id) throws Exception;

	public Pagination<Users> getPaginationUsers(int currentPage,
			int numPerPage, Users users) throws Exception;

	public Users getUsersById(Long id) throws Exception;
	
	public boolean updateUserPassword(Long id,String newPassword)throws Exception;
	/**
	 * 根据用户的id，查询用户的密码，用来验证密码是否正确
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public String getUsersPasswordById(Long id) throws Exception;
	/**
	 * 查看登陆名称是否存在
	 * @param LoginName
	 * @return
	 * @throws Exception
	 */
	public boolean isExistUserLoginName(String LoginName) throws Exception;
    /**
     * 根据登陆名字查找用户信息，登陆的是用
     * @param loginName
     * @return
     * @throws Exception
     */
	public Users getUsersByLoginName(String loginName) throws Exception;
	
	
	public List<Map<String,Object>> getFunctionMenusByUserId(Long userId)throws Exception;
	
	
	public void deleteUsersByList(List<Users> users)throws Exception;
	
	public void updateUsersByList(List<Users> users)throws Exception;
	
}
