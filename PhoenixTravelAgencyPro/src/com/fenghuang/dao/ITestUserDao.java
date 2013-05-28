/**
 * 
 */
package com.fenghuang.dao;

import com.fenghuang.entiey.TestUser;
import com.fenghuang.util.Pagination;

/**
 * @author 鲍国浩
 * 
 * 版本 ： 1.0
 * 
 * 日期 ：2013-5-26
 *
 * 描述 ：TestUser  数据库操作dao接口
 *
 *
 */
public interface ITestUserDao {
	/**
	 *  通过对象 将数据插入到数据库中
	 * @param testUser
	 * @return
	 * @throws Exception
	 */
	public int addTestUser(TestUser testUser) throws Exception;
	
	/**
	 * 更具对象实体的id，查询该对象实体
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public TestUser queryTestUserById(Long id) throws Exception;
	/**
	 * 分页操作 在这里可以得到分页对象Pagination
	 * @param currentPage
	 * @param numPerPage
	 * @return
	 * @throws Exception
	 */
	public Pagination<TestUser> getByQueryConditionPagination(int currentPage,int numPerPage) throws Exception;
	

}