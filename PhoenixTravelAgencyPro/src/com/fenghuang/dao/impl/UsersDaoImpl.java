/**
 * 
 */
package com.fenghuang.dao.impl;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.fenghuang.dao.IUserDao;
import com.fenghuang.entiey.Usersrr;

/**
 * @author 鲍国浩
 * 
 * 版本 ： 1.0
 * 
 * 日期 ：2013-5-27
 *
 * 描述 ：
 *
 *
 */
@Repository
public class UsersDaoImpl extends JdbcTemplate implements IUserDao {
   
	@Autowired
	public UsersDaoImpl(@Qualifier("dataSource")DataSource dataSource){
		 super(dataSource);
	}

	@Override
	public int addUsers(Usersrr users) throws Exception {
	    String sql = "insert into users (userName,loginName,enName,sex,phone,birthday,phone1,email,fax,password)";
	    return 0;
	}


	@Override
	public Usersrr queryUsersById(Long id) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
