/***********************************************************************
 * Module:  Company.java
 * Author:  baoguohao
 * Purpose: Defines the Class Company
 ***********************************************************************/
package com.fenghuang.entiey;


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
	public Long id;
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