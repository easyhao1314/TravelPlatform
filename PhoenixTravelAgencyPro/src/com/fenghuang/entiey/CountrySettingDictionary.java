/***********************************************************************
 * Module:  CountrySettingDictionary.java
 * Author:  baoguohao
 * Purpose: Defines the Class CountrySettingDictionary
 ***********************************************************************/
package com.fenghuang.entiey;

import java.util.*;

/**
 * 旅游国家设置
 * 
 * @pdOid fc6d570e-cdc8-4449-94dd-3e1a27c34bad
 */
public class CountrySettingDictionary {
	/**
	 * 编号
	 * 
	 * @pdOid 2a0ef89a-6f38-4d20-985b-cef7e053f7d4
	 */
	public String csdNo;

	/**
	 * @return the csdNo
	 */
	public String getCsdNo() {
		return csdNo;
	}

	/**
	 * @param csdNo
	 *            the csdNo to set
	 */
	public void setCsdNo(String csdNo) {
		this.csdNo = csdNo;
	}

	/**
	 * @return the csdName
	 */
	public String getCsdName() {
		return csdName;
	}

	/**
	 * @param csdName
	 *            the csdName to set
	 */
	public void setCsdName(String csdName) {
		this.csdName = csdName;
	}

	/**
	 * @return the csdEnName
	 */
	public String getCsdEnName() {
		return csdEnName;
	}

	/**
	 * @param csdEnName
	 *            the csdEnName to set
	 */
	public void setCsdEnName(String csdEnName) {
		this.csdEnName = csdEnName;
	}

	/**
	 * @return the csdCurrency
	 */
	public String getCsdCurrency() {
		return csdCurrency;
	}

	/**
	 * @param csdCurrency
	 *            the csdCurrency to set
	 */
	public void setCsdCurrency(String csdCurrency) {
		this.csdCurrency = csdCurrency;
	}

	/**
	 * 名称
	 * 
	 * @pdOid 688e3569-088d-4021-be60-bc558bb22825
	 */
	public String csdName;
	/**
	 * 英文名称
	 * 
	 * @pdOid e66c7f58-db82-4399-b2b4-5237ae117a7d
	 */
	public String csdEnName;
	/**
	 * 币种
	 * 
	 * @pdOid 43c49c89-b8fb-4b4b-990c-62d4604b23f5
	 */
	public String csdCurrency;

	/**
	 * @pdRoleInfo migr=no name=CitySettingDictionary assc=csdAndCitySdRef
	 *             coll=java.util.Collection impl=java.util.HashSet mult=0..*
	 */
	public Collection citySettingDictionary;
	/**
	 * @pdRoleInfo migr=no name=CountryState assc=countryStateRef mult=0..1
	 *             side=A
	 */
	public CountryState countryState;
	/** @pdRoleInfo migr=no name=CountryArea assc=countryAreaRef mult=0..1 side=A */
	public CountryArea countryArea;

	/** @pdGenerated default getter */
	public Collection getCitySettingDictionary() {
		if (citySettingDictionary == null)
			citySettingDictionary = new HashSet();
		return citySettingDictionary;
	}

	/** @pdGenerated default iterator getter */
	public java.util.Iterator getIteratorCitySettingDictionary() {
		if (citySettingDictionary == null)
			citySettingDictionary = new java.util.HashSet();
		return citySettingDictionary.iterator();
	}

	/**
	 * @pdGenerated default setter
	 * @param newCitySettingDictionary
	 */
	public void setCitySettingDictionary(
			java.util.Collection newCitySettingDictionary) {
		removeAllCitySettingDictionary();
		for (java.util.Iterator iter = newCitySettingDictionary.iterator(); iter
				.hasNext();)
			addCitySettingDictionary((CitySettingDictionary) iter.next());
	}

	/**
	 * @pdGenerated default add
	 * @param newCitySettingDictionary
	 */
	public void addCitySettingDictionary(
			CitySettingDictionary newCitySettingDictionary) {
		if (newCitySettingDictionary == null)
			return;
		if (this.citySettingDictionary == null)
			this.citySettingDictionary = new java.util.HashSet();
		if (!this.citySettingDictionary.contains(newCitySettingDictionary)) {
			this.citySettingDictionary.add(newCitySettingDictionary);
			newCitySettingDictionary.setCountrySettingDictionary(this);
		}
	}

	/**
	 * @pdGenerated default remove
	 * @param oldCitySettingDictionary
	 */
	public void removeCitySettingDictionary(
			CitySettingDictionary oldCitySettingDictionary) {
		if (oldCitySettingDictionary == null)
			return;
		if (this.citySettingDictionary != null)
			if (this.citySettingDictionary.contains(oldCitySettingDictionary)) {
				this.citySettingDictionary.remove(oldCitySettingDictionary);
				oldCitySettingDictionary
						.setCountrySettingDictionary((CountrySettingDictionary) null);
			}
	}

	/** @pdGenerated default removeAll */
	public void removeAllCitySettingDictionary() {
		if (citySettingDictionary != null) {
			CitySettingDictionary oldCitySettingDictionary;
			for (java.util.Iterator iter = getIteratorCitySettingDictionary(); iter
					.hasNext();) {
				oldCitySettingDictionary = (CitySettingDictionary) iter.next();
				iter.remove();
				oldCitySettingDictionary
						.setCountrySettingDictionary((CountrySettingDictionary) null);
			}
		}
	}

	/** @pdGenerated default parent getter */
	public CountryState getCountryState() {
		return countryState;
	}

	/**
	 * @pdGenerated default parent setter
	 * @param newCountryState
	 */
	public void setCountryState(CountryState newCountryState) {
		if (this.countryState == null
				|| !this.countryState.equals(newCountryState)) {
			if (this.countryState != null) {
				CountryState oldCountryState = this.countryState;
				this.countryState = null;
				oldCountryState.removeCountrySettingDictionary(this);
			}
			if (newCountryState != null) {
				this.countryState = newCountryState;
				this.countryState.addCountrySettingDictionary(this);
			}
		}
	}

	/** @pdGenerated default parent getter */
	public CountryArea getCountryArea() {
		return countryArea;
	}

	/**
	 * @pdGenerated default parent setter
	 * @param newCountryArea
	 */
	public void setCountryArea(CountryArea newCountryArea) {
		if (this.countryArea == null
				|| !this.countryArea.equals(newCountryArea)) {
			if (this.countryArea != null) {
				CountryArea oldCountryArea = this.countryArea;
				this.countryArea = null;
				oldCountryArea.removeCountrySettingDictionary(this);
			}
			if (newCountryArea != null) {
				this.countryArea = newCountryArea;
				this.countryArea.addCountrySettingDictionary(this);
			}
		}
	}

}