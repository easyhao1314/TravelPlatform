package com.fenghuang.entiey;

/***********************************************************************
 * Module:  CitySettingDictionary.java
 * Author:  baoguohao
 * Purpose: Defines the Class CitySettingDictionary
 ***********************************************************************/

import java.util.*;

/**
 * 旅游城市设置
 * 
 * @pdOid 9dbd5064-b759-44c6-9cb0-ee287cd8daf0
 */
public class CitySettingDictionary {
	/**
	 * 主键，自动增长
	 * 
	 * @pdOid d7250734-1b32-4f2f-ab08-ff5c631a3669
	 */
	public long id;
	/**
	 * 城市名称
	 * 
	 * @pdOid 9c6493f6-186f-4e7d-9841-f41b5fbe2917
	 */
	public String cityName;
	/**
	 * 城市英文名字
	 * 
	 * @pdOid 2f81c129-da9f-4ca7-ba52-fefe06712115
	 */
	public String cityEnName;
	/**
	 * 经纬度，这个要和赵阳商量怎么解决
	 * 
	 * @pdOid 2799faba-6bf4-457a-9bc2-c9d3c759720a
	 */
	public String coordinates;
	/**
	 * 是否口岸 1：是，0：否
	 * 
	 * @pdOid b732772a-0130-45bb-afa8-e7d6eb9202bb
	 */
	public String isPort;
	/**
	 * 是否常用 1：是，0：否
	 * 
	 * @pdOid a06a494c-2984-47f0-bb38-03ebc8aec7a9
	 */
	public String isUserd;

	/**
	 * @pdRoleInfo migr=no name=CountrySettingDictionary assc=csdAndCitySdRef
	 *             mult=0..1 side=A
	 */
	public CountrySettingDictionary countrySettingDictionary;
	/** @pdRoleInfo migr=no name=CountryArea assc=caANDCitysdRef mult=0..1 side=A */
	public CountryArea countryArea;
	/**
	 * @pdRoleInfo migr=no name=ProvinceSettingDictionary assc=psdAndCityCsd
	 *             mult=0..1 side=A
	 */
	public ProvinceSettingDictionary provinceSettingDictionary;
	/**
	 * @pdRoleInfo migr=no name=Currency assc=currencyAndCityCsdRef mult=0..1
	 *             side=A
	 */
	public Currency currency;

	/** @pdGenerated default parent getter */
	public CountrySettingDictionary getCountrySettingDictionary() {
		return countrySettingDictionary;
	}

	/**
	 * @pdGenerated default parent setter
	 * @param newCountrySettingDictionary
	 */
	public void setCountrySettingDictionary(
			CountrySettingDictionary newCountrySettingDictionary) {
		if (this.countrySettingDictionary == null
				|| !this.countrySettingDictionary
						.equals(newCountrySettingDictionary)) {
			if (this.countrySettingDictionary != null) {
				CountrySettingDictionary oldCountrySettingDictionary = this.countrySettingDictionary;
				this.countrySettingDictionary = null;
				oldCountrySettingDictionary.removeCitySettingDictionary(this);
			}
			if (newCountrySettingDictionary != null) {
				this.countrySettingDictionary = newCountrySettingDictionary;
				this.countrySettingDictionary.addCitySettingDictionary(this);
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
				oldCountryArea.removeCitySettingDictionary(this);
			}
			if (newCountryArea != null) {
				this.countryArea = newCountryArea;
				this.countryArea.addCitySettingDictionary(this);
			}
		}
	}

	/** @pdGenerated default parent getter */
	public ProvinceSettingDictionary getProvinceSettingDictionary() {
		return provinceSettingDictionary;
	}

	/**
	 * @pdGenerated default parent setter
	 * @param newProvinceSettingDictionary
	 */
	public void setProvinceSettingDictionary(
			ProvinceSettingDictionary newProvinceSettingDictionary) {
		if (this.provinceSettingDictionary == null
				|| !this.provinceSettingDictionary
						.equals(newProvinceSettingDictionary)) {
			if (this.provinceSettingDictionary != null) {
				ProvinceSettingDictionary oldProvinceSettingDictionary = this.provinceSettingDictionary;
				this.provinceSettingDictionary = null;
				oldProvinceSettingDictionary.removeCitySettingDictionary(this);
			}
			if (newProvinceSettingDictionary != null) {
				this.provinceSettingDictionary = newProvinceSettingDictionary;
				this.provinceSettingDictionary.addCitySettingDictionary(this);
			}
		}
	}

	/** @pdGenerated default parent getter */
	public Currency getCurrency() {
		return currency;
	}

	/**
	 * @pdGenerated default parent setter
	 * @param newCurrency
	 */
	public void setCurrency(Currency newCurrency) {
		if (this.currency == null || !this.currency.equals(newCurrency)) {
			if (this.currency != null) {
				Currency oldCurrency = this.currency;
				this.currency = null;
				oldCurrency.removeCitySettingDictionary(this);
			}
			if (newCurrency != null) {
				this.currency = newCurrency;
				this.currency.addCitySettingDictionary(this);
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
	 * @return the cityName
	 */
	public String getCityName() {
		return cityName;
	}

	/**
	 * @param cityName
	 *            the cityName to set
	 */
	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	/**
	 * @return the cityEnName
	 */
	public String getCityEnName() {
		return cityEnName;
	}

	/**
	 * @param cityEnName
	 *            the cityEnName to set
	 */
	public void setCityEnName(String cityEnName) {
		this.cityEnName = cityEnName;
	}

	/**
	 * @return the coordinates
	 */
	public String getCoordinates() {
		return coordinates;
	}

	/**
	 * @param coordinates
	 *            the coordinates to set
	 */
	public void setCoordinates(String coordinates) {
		this.coordinates = coordinates;
	}

	/**
	 * @return the isPort
	 */
	public String getIsPort() {
		return isPort;
	}

	/**
	 * @param isPort
	 *            the isPort to set
	 */
	public void setIsPort(String isPort) {
		this.isPort = isPort;
	}

	/**
	 * @return the isUserd
	 */
	public String getIsUserd() {
		return isUserd;
	}

	/**
	 * @param isUserd
	 *            the isUserd to set
	 */
	public void setIsUserd(String isUserd) {
		this.isUserd = isUserd;
	}

}