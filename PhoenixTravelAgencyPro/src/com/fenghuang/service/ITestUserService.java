/**
 * 
 */
package com.fenghuang.service;

import com.fenghuang.entiey.TestUser;
import com.fenghuang.util.Pagination;

/**
 * @author 鲍国浩
 * 
 * 版本 ： 1.0
 * 
 * 日期 ：2013-5-26
 *
 * 描述 ：TestUser 服务层的接口
 *
 *
 */
public interface ITestUserService {
	/**
	 * 通过对象 将数据插入到数据库中
	 * @param testUser
	 * @return
	 * @throws Exception
	 */
	public int addTestUser(TestUser testUser) throws Exception;
	
	public Pagination<TestUser> getByQueryConditionPagination(int currentPage,int numPerPage) throws Exception;

}
