/***********************************************************************
 * Module:  Department.java
 * Author:  baoguohao
 * Purpose: Defines the Class Department
 ***********************************************************************/
package com.fenghuang.entiey;

import java.util.*;

/**
 * 部门表
 * 
 * @pdOid a9a165db-4c3b-43e5-9a26-883c4cab4d8d
 */
public class Department {
	/**
	 * 主键，自动增长
	 * 
	 * @pdOid 08d0b7cd-ad3e-455c-be90-7ed70364eab3
	 */
	public long id;
	/**
	 * 部门编号
	 * 
	 * @pdOid b242928b-1cf1-4772-9fb1-a762db44d6a7
	 */
	public String departNo;
	/**
	 * 部门名称
	 * 
	 * @pdOid 807f042b-badb-4f0b-948a-6d19db6c7621
	 */
	public String departName;
	/**
	 * 排序号
	 * 
	 * @pdOid 926ba4ae-6d8a-4861-82c0-96f9492d0474
	 */
	public long sortNo;

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
	 * @return the departNo
	 */
	public String getDepartNo() {
		return departNo;
	}

	/**
	 * @param departNo
	 *            the departNo to set
	 */
	public void setDepartNo(String departNo) {
		this.departNo = departNo;
	}

	/**
	 * @return the departName
	 */
	public String getDepartName() {
		return departName;
	}

	/**
	 * @param departName
	 *            the departName to set
	 */
	public void setDepartName(String departName) {
		this.departName = departName;
	}

	/**
	 * @return the sortNo
	 */
	public long getSortNo() {
		return sortNo;
	}

	/**
	 * @param sortNo
	 *            the sortNo to set
	 */
	public void setSortNo(long sortNo) {
		this.sortNo = sortNo;
	}

}