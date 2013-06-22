/***********************************************************************
 * Module:  Currency.java
 * Author:  baoguohao
 * Purpose: Defines the Class Currency
 ***********************************************************************/
package com.fenghuang.entiey;

import java.util.*;

/**
 * 币种
 * 
 * @pdOid 7bc8de0a-70db-4035-b039-4fee5d298f1c
 */
public class Currency {
	/**
	 * 主键 自动增长
	 * 
	 * @pdOid f6aa3148-6530-43cc-8b86-3de05d9d9400
	 */
	public long id;
	/**
	 * 币种名称
	 * 
	 * @pdOid 0c84e0f1-2045-4060-a52c-4b5ee91ffd76
	 */
	public String currencyName;
	/**
	 * 币种简写
	 * 
	 * @pdOid 9b616331-282e-4b3b-9cd1-dc522c3c4dee
	 */
	public String currencyShort;
	/** @pdOid d305e538-a94b-45cd-8d2f-2919589f8635 */
	public String symbol;
	/**
	 * 描述
	 * 
	 * @pdOid 20dbe61c-16d6-46bd-8cff-944fbbde7dd6
	 */
	public String currDesc;
	/**
	 * 是否使用 0：不使用，1：使用
	 * 
	 * @pdOid 159e22d0-da00-445b-8dc6-492083603caa
	 */
	public String isUes;

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
	 * @return the currencyName
	 */
	public String getCurrencyName() {
		return currencyName;
	}

	/**
	 * @param currencyName
	 *            the currencyName to set
	 */
	public void setCurrencyName(String currencyName) {
		this.currencyName = currencyName;
	}

	/**
	 * @return the currencyShort
	 */
	public String getCurrencyShort() {
		return currencyShort;
	}

	/**
	 * @param currencyShort
	 *            the currencyShort to set
	 */
	public void setCurrencyShort(String currencyShort) {
		this.currencyShort = currencyShort;
	}

	/**
	 * @return the symbol
	 */
	public String getSymbol() {
		return symbol;
	}

	/**
	 * @param symbol
	 *            the symbol to set
	 */
	public void setSymbol(String symbol) {
		this.symbol = symbol;
	}

	/**
	 * @return the currDesc
	 */
	public String getCurrDesc() {
		return currDesc;
	}

	/**
	 * @param currDesc
	 *            the currDesc to set
	 */
	public void setCurrDesc(String currDesc) {
		this.currDesc = currDesc;
	}

	/**
	 * @return the isUes
	 */
	public String getIsUes() {
		return isUes;
	}

	/**
	 * @param isUes
	 *            the isUes to set
	 */
	public void setIsUes(String isUes) {
		this.isUes = isUes;
	}

}