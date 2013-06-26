/***********************************************************************
 * Module:  RoleAndPagePermission.java
 * Author:  baoguohao
 * Purpose: Defines the Class RoleAndPagePermission
 ***********************************************************************/
package com.fenghuang.entiey;

import java.util.*;

/**
 * 脚色权限表
 * 
 * @pdOid 46aa06a5-13ab-485e-9435-45a459044cc1
 */
public class RoleAndPagePermission {
	/** @pdOid efc3567c-4fcd-4e60-b6f5-b01cc18ed370 */
	//自动增长列
	public Long id;
	//角色id
	public Long roleId;
	//页面权限id
	public Long ppId;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getRoleId() {
		return roleId;
	}
	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}
	public Long getPpId() {
		return ppId;
	}
	public void setPpId(Long ppId) {
		this.ppId = ppId;
	}


	

}