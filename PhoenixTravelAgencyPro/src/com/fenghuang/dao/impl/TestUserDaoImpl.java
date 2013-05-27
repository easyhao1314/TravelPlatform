/**
 * 
 */
package com.fenghuang.dao.impl;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.fenghuang.dao.ITestUserDao;
import com.fenghuang.entiey.TestUser;

/**
 * @author 鲍国浩
 * 
 * 版本 ： 1.0
 * 
 * 日期 ：2013-5-26
 *
 * 描述 ：TestUser  数据库操作dao接口
 * 测试的一个简单例子，由于赵阳的个人团队，对hibernate都不很熟悉，所以才去spring的纯jdbc操作。
 *
 *
 */
@Repository //这个标记类似于spring配置文件中bean的id=“testUserDaoImpl”的配置，
public class TestUserDaoImpl extends JdbcTemplate implements ITestUserDao {
	/**
	 * 通过构造函数和注解@Qualifier("dataSource")将数据源dataSource 注入到该类中
	 * dataSource 就是applicationContext.xml中的 id=dataSource的数据源，可以修改成其他的名字
	 * 
	 * 
	 * @param dataSource
	 */
	@Autowired //这个标注就是自动匹配类型
	public TestUserDaoImpl(@Qualifier("dataSource")DataSource dataSource){
		super(dataSource);
	}
	
	
	@Override
	public int addTestUser(TestUser testUser) throws Exception {
		String sql = "insert into TestUser(username,password) values(?,?)";
		int  i = this.update(sql,testUser.getUsername(),testUser.getPassword());
		return i;
	}


	@Override
	public TestUser queryTestUserById(Long id) throws Exception {
		// TODO Auto-generated method stub
		String sql = " select * from TestUser where id = ?";
		TestUser testUser = this.queryForObject(sql,TestUser.class,id);
		return testUser;
	}

}
