/***********************************************************************
 * Module:  CountryArea.java
 * Author:  baoguohao
 * Purpose: Defines the Class CountryArea
 ***********************************************************************/
package com.fenghuang.entiey;

import java.util.*;

/**
 * 地区表和报价区域
 * 
 * @pdOid 3f223d7e-8d31-420f-a2a1-bc8da9ad234b
 */
public class CountryArea {
	/**
	 * 主键，自动增长
	 * 
	 * @pdOid 65568617-9d8f-4000-b349-6e5c7c4f2c72
	 */
	public long id;
	/** @pdOid 872efb4e-82e5-4d3c-b865-6e37c28af1e3 */
	public String caName;
	/**
	 * 地区描述
	 * 
	 * @pdOid d70c8401-e134-419e-9439-18f2616099e7
	 */
	public String caDesc;
	/**
	 * 地区类型 1：正常地区，0：报价区域
	 * 
	 * @pdOid 9a7f69ca-05f0-4785-b38b-283cb4817b8b
	 */
	public int caType;

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
	 * @return the caName
	 */
	public String getCaName() {
		return caName;
	}

	/**
	 * @param caName
	 *            the caName to set
	 */
	public void setCaName(String caName) {
		this.caName = caName;
	}

	/**
	 * @return the caDesc
	 */
	public String getCaDesc() {
		return caDesc;
	}

	/**
	 * @param caDesc
	 *            the caDesc to set
	 */
	public void setCaDesc(String caDesc) {
		this.caDesc = caDesc;
	}

	/**
	 * @return the caType
	 */
	public int getCaType() {
		return caType;
	}

	/**
	 * @param caType
	 *            the caType to set
	 */
	public void setCaType(int caType) {
		this.caType = caType;
	}

}