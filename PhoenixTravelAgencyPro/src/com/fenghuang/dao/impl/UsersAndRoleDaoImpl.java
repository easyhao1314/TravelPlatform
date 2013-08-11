/**
 * 
 */
package com.fenghuang.dao.impl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

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
		List<Map<String,Object>> resultList = this.queryForList(sql,userId);
		List<UsersAndRole>  uars = new ArrayList<UsersAndRole>();
		UsersAndRole  usersAndRole= null;
		for (Iterator iterator = resultList.iterator(); iterator.hasNext();) {
			Map<String,Object> row = (Map<String, Object>) iterator.next();
			usersAndRole = new UsersAndRole();
			usersAndRole.setId(Long.valueOf(row.get("id").toString()));
			usersAndRole.setRoleId(Long.valueOf(row.get("roleId").toString()));
			usersAndRole.setUserId(Long.valueOf(row.get("userId").toString()));
			if(row.get("roleCode")!=null){
				usersAndRole.setRoleCode(row.get("roleCode").toString());
			}
			uars.add(usersAndRole);
		}
		
		
		return uars;
	}

	@Override
	public boolean deleteUsersAndRole(Long userId, Long roleId)
			throws Exception {
		StringBuffer sb = new StringBuffer("delete from usersandrole where userId='"+userId+"' and roleId='"+roleId+"'");
		int rows = this.update(sb.toString());
		return rows>0;
	}

	@Override
	public boolean saveUsersAndRole(Long userId, Long roleId) throws Exception {
		String sql = "insert into usersandrole (userId,roleId,roleCode) values(?,?,?)";
		int rs = this.update(sql,userId,roleId,"4");
		return rs>0;
	}
	
	
	
	
	
	

}
