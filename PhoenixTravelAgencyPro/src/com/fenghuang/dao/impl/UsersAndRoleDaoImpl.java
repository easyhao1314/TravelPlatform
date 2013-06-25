/**
 * 
 */
package com.fenghuang.dao.impl;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.fenghuang.dao.BaseDao;
import com.fenghuang.dao.IUsersAndRoleDao;
import com.fenghuang.entiey.UsersAndRole;

/**
 * @author 鲍国浩
 * 
 * 版本 ： 1.0
 * 
 * 日期 ：2013-6-25
 *
 * 描述 ：
 *
 *
 */
@Repository
public class UsersAndRoleDaoImpl extends BaseDao implements IUsersAndRoleDao {

	/**
	 * @param dataSource
	 */
	@Autowired
	public UsersAndRoleDaoImpl(@Qualifier("dataSource")DataSource dataSource) {
		super(dataSource);
		
	}

	@Override
	public boolean saveUsersAndRole(UsersAndRole usersAndRole) throws Exception {
		String sql = "insert into usersandrole (userId,roleId,roleCode) values(?,?)";
		int rs = this.update(sql,usersAndRole.getUserId(),usersAndRole.getUserId(),usersAndRole.getRoleCode());
		return rs>0;
	}

	@Override
	public boolean deleteUsersAndRole(Long id)
			throws Exception {
		String sql = "delete from usersandrole where id = ?";
		int rs = this.update(sql,id);
		return rs>0;
	}

	@Override
	public List<UsersAndRole> getUsersAndRoles(Long userId) throws Exception {
		String sql = " select * from usersandrole where userId = ?";
		List<UsersAndRole>  uars = this.queryForList(sql, UsersAndRole.class);
		return uars;
	}
	
	
	
	
	
	

}
