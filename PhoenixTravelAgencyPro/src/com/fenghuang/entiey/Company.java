/***********************************************************************
 * Module:  Company.java
 * Author:  baoguohao
 * Purpose: Defines the Class Company
 ***********************************************************************/
package com.fenghuang.entiey;

import java.util.*;

/**
 * 公司表
 * 
 * @pdOid 559117f9-e66f-45ec-bf53-a4825c130bcd
 */
public class Company {
	/**
	 * 主键，自动增长
	 * 
	 * @pdOid 88076f3d-9ebb-4df7-80dc-21b6e0f0cc8e
	 */
	public long id;
	/**
	 * 公司编号
	 * 
	 * @pdOid 5eca1ff1-b566-4d26-892e-075df1c1d6f2
	 */
	public String companyNumber;
	/**
	 * 公司名称
	 * 
	 * @pdOid d2c4bc3c-6ebd-4127-8ec3-8380337da3db
	 */
	public String companyName;
	/**
	 * 父编号
	 * 
	 * @pdOid 68cc1e5d-83af-4fab-ab15-969c26845059
	 */
	public String parentNumber;

	/**
	 * @pdRoleInfo migr=no name=Users assc=userRefCompany
	 *             coll=java.util.Collection impl=java.util.HashSet mult=0..*
	 */
	public java.util.Collection users;

	/** @pdGenerated default getter */
	public java.util.Collection getUsers() {
		if (users == null)
			users = new java.util.HashSet();
		return users;
	}

	/** @pdGenerated default iterator getter */
	public java.util.Iterator getIteratorUsers() {
		if (users == null)
			users = new java.util.HashSet();
		return users.iterator();
	}

	/**
	 * @pdGenerated default setter
	 * @param newUsers
	 */
	public void setUsers(java.util.Collection newUsers) {
		removeAllUsers();
		for (java.util.Iterator iter = newUsers.iterator(); iter.hasNext();)
			addUsers((Users) iter.next());
	}

	/**
	 * @pdGenerated default add
	 * @param newUsers
	 */
	public void addUsers(Users newUsers) {
		if (newUsers == null)
			return;
		if (this.users == null)
			this.users = new java.util.HashSet();
		if (!this.users.contains(newUsers)) {
			this.users.add(newUsers);
			newUsers.setCompany(this);
		}
	}

	/**
	 * @pdGenerated default remove
	 * @param oldUsers
	 */
	public void removeUsers(Users oldUsers) {
		if (oldUsers == null)
			return;
		if (this.users != null)
			if (this.users.contains(oldUsers)) {
				this.users.remove(oldUsers);
				oldUsers.setCompany((Company) null);
			}
	}

	/** @pdGenerated default removeAll */
	public void removeAllUsers() {
		if (users != null) {
			Users oldUsers;
			for (java.util.Iterator iter = getIteratorUsers(); iter.hasNext();) {
				oldUsers = (Users) iter.next();
				iter.remove();
				oldUsers.setCompany((Company) null);
			}
		}
	}

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
	 * @return the companyNumber
	 */
	public String getCompanyNumber() {
		return companyNumber;
	}

	/**
	 * @param companyNumber
	 *            the companyNumber to set
	 */
	public void setCompanyNumber(String companyNumber) {
		this.companyNumber = companyNumber;
	}

	/**
	 * @return the companyName
	 */
	public String getCompanyName() {
		return companyName;
	}

	/**
	 * @param companyName
	 *            the companyName to set
	 */
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getParentNumber() {
		return parentNumber;
	}

	public void setParentNumber(String parentNumber) {
		this.parentNumber = parentNumber;
	}



}