/***********************************************************************
 * Module:  ProvinceSettingDictionary.java
 * Author:  baoguohao
 * Purpose: Defines the Class ProvinceSettingDictionary
 ***********************************************************************/
package com.fenghuang.entiey;

import java.util.*;

/**
 * 国内省份设置
 * 
 * @pdOid d8072759-1e1a-489b-affd-231430b760ca
 */
public class ProvinceSettingDictionary {
	/**
	 * 主键，自动增长
	 * 
	 * @pdOid 915de6e9-ad50-4e6c-b177-c1886640aea7
	 */
	public long id;
	/**
	 * 省份名称
	 * 
	 * @pdOid 2bf8b646-fb0b-4861-821a-c1fcb972aba8
	 */
	public String pcdName;
	/**
	 * 省份英文名称
	 * 
	 * @pdOid 95514304-e87a-4813-a578-2f3057e1194c
	 */
	public String pcdEnName;
	/**
	 * 拼音全拼
	 * 
	 * @pdOid 7f8fe026-fc6e-4c0b-b1fb-978956032766
	 */
	public String pcdPinYin;
	/**
	 * 拼音简写
	 * 
	 * @pdOid 15fc81f8-c05a-413b-8158-b49bcf2f6e50
	 */
	public int pcdJianXie;

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
	 * @return the pcdName
	 */
	public String getPcdName() {
		return pcdName;
	}

	/**
	 * @param pcdName
	 *            the pcdName to set
	 */
	public void setPcdName(String pcdName) {
		this.pcdName = pcdName;
	}

	/**
	 * @return the pcdEnName
	 */
	public String getPcdEnName() {
		return pcdEnName;
	}

	/**
	 * @param pcdEnName
	 *            the pcdEnName to set
	 */
	public void setPcdEnName(String pcdEnName) {
		this.pcdEnName = pcdEnName;
	}

	/**
	 * @return the pcdPinYin
	 */
	public String getPcdPinYin() {
		return pcdPinYin;
	}

	/**
	 * @param pcdPinYin
	 *            the pcdPinYin to set
	 */
	public void setPcdPinYin(String pcdPinYin) {
		this.pcdPinYin = pcdPinYin;
	}

	/**
	 * @return the pcdJianXie
	 */
	public int getPcdJianXie() {
		return pcdJianXie;
	}

	/**
	 * @param pcdJianXie
	 *            the pcdJianXie to set
	 */
	public void setPcdJianXie(int pcdJianXie) {
		this.pcdJianXie = pcdJianXie;
	}

}