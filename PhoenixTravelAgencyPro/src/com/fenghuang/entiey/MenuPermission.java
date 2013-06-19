/***********************************************************************
 * Module:  MenuPermission.java
 * Author:  baoguohao
 * Purpose: Defines the Class MenuPermission
 ***********************************************************************/
package com.fenghuang.entiey;

import java.util.*;

/**
 * 菜单权限表
 * 
 * @pdOid b2c2d9e4-bbce-47fb-9546-1b504d0fa283
 */
public class MenuPermission {
	/**
	 * 主键，自动增长
	 * 
	 * @pdOid 782d88e5-27ef-44c0-bab1-8a56f86a0ec4
	 */
	public Long id;
	/**
	 * 菜单权限编号
	 * 
	 * @pdOid fa435387-37c7-4c26-bd40-15f5957ecd2b
	 */
	public String mpNo;
	/**
	 * 名称
	 * 
	 * @pdOid 5c6e5be3-7200-424d-9938-4ca9677a2b93
	 */
	public String mpName;
	/** @pdOid f3ac4578-f847-43dc-b545-b2e47a06423c */
	public String mpDesc;
	
	public String functionNo;

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

	/**
	 * @return the mpNo
	 */
	public String getMpNo() {
		return mpNo;
	}

	/**
	 * @param mpNo
	 *            the mpNo to set
	 */
	public void setMpNo(String mpNo) {
		this.mpNo = mpNo;
	}

	/**
	 * @return the mpName
	 */
	public String getMpName() {
		return mpName;
	}

	/**
	 * @param mpName
	 *            the mpName to set
	 */
	public void setMpName(String mpName) {
		this.mpName = mpName;
	}

	/**
	 * @return the mpDesc
	 */
	public String getMpDesc() {
		return mpDesc;
	}

	/**
	 * @param mpDesc
	 *            the mpDesc to set
	 */
	public void setMpDesc(String mpDesc) {
		this.mpDesc = mpDesc;
	}

	public String getFunctionNo() {
		return functionNo;
	}

	public void setFunctionNo(String functionNo) {
		this.functionNo = functionNo;
	}
   
}