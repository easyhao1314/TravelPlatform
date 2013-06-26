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
import com.fenghuang.dao.IRoleAndMenuPermissionDao;
import com.fenghuang.entiey.RoleAndMenuPermission;

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
public class RoleAndMenuPermissionDaoImpl extends BaseDao implements
		IRoleAndMenuPermissionDao {

	/**
	 * @param dataSource
	 */
	@Autowired
	public RoleAndMenuPermissionDaoImpl(@Qualifier("dataSource")DataSource dataSource) {
		super(dataSource);
		
	}

	@Override
	public List<RoleAndMenuPermission> getRoleAndMenuPermissionsByRoleId(
			Long roleId) throws Exception {
		String sql = "select * from RoleAndMenuPermission where roleId = ?";
		List<RoleAndMenuPermission>  ramps = this.queryForList(sql,RoleAndMenuPermission.class,roleId);
		return ramps;
	}

}
