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
	public long id;

	/**
	 * @return the id
	 */
	public long getId() {
		return id;
	}

	/**
	 * @param id
	 *            the id to set
	 */
	public void setId(long id) {
		this.id = id;
	}

	/**
	 * @pdRoleInfo migr=no name=PagePermission assc=pagePermissionRef mult=0..1
	 *             side=A
	 */
	public PagePermission pagePermission;
	/** @pdRoleInfo migr=no name=Role assc=roleRefPP mult=0..1 side=A */
	public Role role;

	/** @pdGenerated default parent getter */
	public PagePermission getPagePermission() {
		return pagePermission;
	}

	/**
	 * @pdGenerated default parent setter
	 * @param newPagePermission
	 */
	public void setPagePermission(PagePermission newPagePermission) {
		if (this.pagePermission == null
				|| !this.pagePermission.equals(newPagePermission)) {
			if (this.pagePermission != null) {
				PagePermission oldPagePermission = this.pagePermission;
				this.pagePermission = null;
				oldPagePermission.removeRoleAndPagePermission(this);
			}
			if (newPagePermission != null) {
				this.pagePermission = newPagePermission;
				this.pagePermission.addRoleAndPagePermission(this);
			}
		}
	}

	/** @pdGenerated default parent getter */
	public Role getRole() {
		return role;
	}

	/**
	 * @pdGenerated default parent setter
	 * @param newRole
	 */
	public void setRole(Role newRole) {
		if (this.role == null || !this.role.equals(newRole)) {
			if (this.role != null) {
				Role oldRole = this.role;
				this.role = null;
				oldRole.removeRoleAndPagePermission(this);
			}
			if (newRole != null) {
				this.role = newRole;
				this.role.addRoleAndPagePermission(this);
			}
		}
	}

}