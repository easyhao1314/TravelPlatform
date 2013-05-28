/**
 * 
 */
package com.fenghuang.dao;

import com.fenghuang.entiey.Users;

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
	public int addUsers(Users users) throws Exception;
	
	public Users queryUsersById(Long id) throws Exception;
	
    
	
	

}
