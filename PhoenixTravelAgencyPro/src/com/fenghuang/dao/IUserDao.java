/**
 * 
 */
package com.fenghuang.dao;

import com.fenghuang.entiey.Usersrr;

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
	public int addUsers(Usersrr users) throws Exception;
	
	public Usersrr queryUsersById(Long id) throws Exception;
	
    
	
	

}
