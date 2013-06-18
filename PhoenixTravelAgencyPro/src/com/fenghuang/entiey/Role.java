/***********************************************************************
 * Module:  Role.java
 * Author:  baoguohao
 * Purpose: Defines the Class Role
 ***********************************************************************/
package com.fenghuang.entiey;

import java.util.*;

/**
 * 角色表
 * 
 * @pdOid f6e49850-a663-4a3c-89ad-b8bb5b5e0630
 */
public class Role {
	/**
	 * 主键，自动增长列
	 * 
	 * @pdOid 4eacdfa0-9c8a-485b-95ab-55039e01b145
	 */
	public long id;
	/**
	 * 角色编号
	 * 
	 * @pdOid 45c07416-a549-407d-9052-606944c734ea
	 */
	public String roleNo;
	/**
	 * 角色名称
	 * 
	 * @pdOid bba2f8dc-87d0-4580-8318-9070dc70dfb4
	 */
	public String roleName;
	/**
	 * 角色描述
	 * 
	 * @pdOid 9c2be168-654c-4390-88a1-94dd002b6166
	 */
	public String roleDesc;

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
	 * @return the roleNo
	 */
	public String getRoleNo() {
		return roleNo;
	}

	/**
	 * @param roleNo
	 *            the roleNo to set
	 */
	public void setRoleNo(String roleNo) {
		this.roleNo = roleNo;
	}

	/**
	 * @return the roleName
	 */
	public String getRoleName() {
		return roleName;
	}

	/**
	 * @param roleName
	 *            the roleName to set
	 */
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	/**
	 * @return the roleDesc
	 */
	public String getRoleDesc() {
		return roleDesc;
	}

	/**
	 * @param roleDesc
	 *            the roleDesc to set
	 */
	public void setRoleDesc(String roleDesc) {
		this.roleDesc = roleDesc;
	}

}