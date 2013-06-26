/**
 * 
 */
package com.fenghuang.dao;

import com.fenghuang.entiey.Users;
import com.fenghuang.entiey.Usersrr;
import com.fenghuang.util.Pagination;

/**
 * @author 鲍国浩
 * 
 * 版本 ： 1.0
 * 
 * 日期 ：2013-5-27
 *
 * 描述 ： 对用户的操作接口
 *
 *
 */
public interface IUserDao {
	/**
	 * 测试用的，目前不需要了
	 * @param users
	 * @return
	 * @throws Exception
	 */
	public int addUsers(Usersrr users) throws Exception;
	/**
	 * 测试用的，目前不需要了
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public Usersrr queryUsersById(Long id) throws Exception;
	
    
	
	public boolean saveUsers(Users users)throws Exception;
	
	
	public boolean updateUsers(Users users)throws Exception;
	
	public boolean deleteUserById(Long id) throws Exception;
	
	public Pagination<Users>  getPaginationUsers(int currentPage,
			int numPerPage,Users users)throws Exception;
	
	
	public Users getUsersById(Long id)throws Exception;
	
	public boolean updateUserPassword(Long id,String newPassword)throws Exception;
	
	
	public String getUsersPasswordById(Long id) throws Exception;
	
	public boolean isExistUserLoginName(String LoginName) throws Exception;
	public Users getUsersByLoginName(String loginName) throws Exception;

}
