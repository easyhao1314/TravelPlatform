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
		List<Map<String,Object>> resultList = this.queryForList(sql,roleId);
		List<RoleAndMenuPermission>  ramps = new ArrayList<RoleAndMenuPermission>();
		RoleAndMenuPermission  rap = null;
		for (Iterator iterator = resultList.iterator(); iterator.hasNext();) {
			Map<String, Object> map = (Map<String, Object>) iterator.next();
			rap = new RoleAndMenuPermission();
			rap.setId(Long.valueOf(map.get("id").toString()));
			rap.setMpId(Long.valueOf(map.get("mpid").toString()));
			rap.setRoleId(Long.valueOf(map.get("roleId").toString()));
			ramps.add(rap);
		}
		return ramps;
	}

	@Override
	public boolean insertRoleAndMenuPermisson(Long roleId, Long mpid)
			throws Exception {
		String sql = "insert into RoleAndMenuPermission(mpid,roleId) values (?,?)";
		int rows = this.update(sql, mpid,roleId);
		return rows>0;
	}

	@Override
	public boolean deleteRoleAndMenuPermission(Long roleId, Long mpid)
			throws Exception {
		String sql = "delete from RoleAndMenuPermission where mpid=? and roleId=?";
		int rows = this.update(sql,mpid,roleId);
		return rows >0;
	}

}
