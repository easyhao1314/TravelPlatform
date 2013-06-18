/***********************************************************************
 * Module:  PagePermission.java
 * Author:  baoguohao
 * Purpose: Defines the Class PagePermission
 ***********************************************************************/
package com.fenghuang.entiey;

import java.util.*;

/**
 * 页面权限表
 * 
 * @pdOid 31bce3d5-8e66-437f-85fe-ecfcdd81277f
 */
public class PagePermission {
	/**
	 * 主键，自动增长
	 * 
	 * @pdOid f6f3748f-eba2-49a4-bd08-24e1944d9244
	 */
	public long id;
	/**
	 * 页面权限名称
	 * 
	 * @pdOid 06c34bff-55b7-41ff-b319-e97a03b2ff48
	 */
	public String ppName;
	/** @pdOid ee2b516e-3d42-464e-a242-a00dc1aa1107 */
	public String ppDesc;
	/** @pdOid 26bef41f-f4e6-457d-a2bc-5543b7baf00a */
	public String ppNO;

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
	 * @return the ppName
	 */
	public String getPpName() {
		return ppName;
	}

	/**
	 * @param ppName
	 *            the ppName to set
	 */
	public void setPpName(String ppName) {
		this.ppName = ppName;
	}

	/**
	 * @return the ppDesc
	 */
	public String getPpDesc() {
		return ppDesc;
	}

	/**
	 * @param ppDesc
	 *            the ppDesc to set
	 */
	public void setPpDesc(String ppDesc) {
		this.ppDesc = ppDesc;
	}

	/**
	 * @return the ppNO
	 */
	public String getPpNO() {
		return ppNO;
	}

	/**
	 * @param ppNO
	 *            the ppNO to set
	 */
	public void setPpNO(String ppNO) {
		this.ppNO = ppNO;
	}

}