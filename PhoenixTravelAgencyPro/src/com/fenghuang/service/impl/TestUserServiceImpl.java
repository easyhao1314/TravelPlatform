/**
 * 
 */
package com.fenghuang.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fenghuang.dao.ITestUserDao;
import com.fenghuang.entiey.TestUser;
import com.fenghuang.service.ITestUserService;
import com.fenghuang.util.Pagination;

/**
 * @author 鲍国浩
 * 
 * 版本 ： 1.0
 * 
 * 日期 ：2013-5-26
 *
 * 描述 ：TestUser 服务层的接口  實現
 *
 *
 */
@Service
public class TestUserServiceImpl implements ITestUserService {
	@Autowired  //自动匹配接口类型，将实现类注入到该类中
	public ITestUserDao iTestUserDao;
	
	@Override
	public int addTestUser(TestUser testUser) throws Exception {
		// TODO Auto-generated method stub
		return iTestUserDao.addTestUser(testUser);
	}
	@Override
	public Pagination<TestUser> getByQueryConditionPagination(int currentPage,
			int numPerPage) throws Exception {
		return iTestUserDao.getByQueryConditionPagination(currentPage, numPerPage);
	}

}
