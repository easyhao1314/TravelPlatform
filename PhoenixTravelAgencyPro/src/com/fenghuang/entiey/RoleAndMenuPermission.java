/***********************************************************************
 * Module:  RoleAndMenuPermission.java
 * Author:  baoguohao
 * Purpose: Defines the Class RoleAndMenuPermission
 ***********************************************************************/
package com.fenghuang.entiey;

import java.util.*;

/**
 * 角色权限表
 * 
 * @pdOid 933ffc43-623b-4cda-9ffe-810946814a48
 */
public class RoleAndMenuPermission {
	/** @pdOid 2568b0c0-8678-4e3a-887a-34821c4d8ff1 */
	//自动增长列
	public Long id;
	//角色id
	public Long roleId;
	//菜单权限id
	public Long mpId;
	
	/**
	 * @return the id
	 */
	public Long getId() {
		return id;
	}

	/**
	 * @param id
	 *            the id to set
	 */
	public void setId(Long id) {
		this.id = id;
	}

	public Long getRoleId() {
		return roleId;
	}

	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}

	public Long getMpId() {
		return mpId;
	}

	public void setMpId(Long mpId) {
		this.mpId = mpId;
	}
	
	

}