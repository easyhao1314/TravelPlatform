/***********************************************************************
 * Module:  Currency.java
 * Author:  baoguohao
 * Purpose: Defines the Class Currency
 ***********************************************************************/
package com.fenghuang.entiey;
import java.util.*;

/** 币种
 * 
 * @pdOid 7bc8de0a-70db-4035-b039-4fee5d298f1c */
public class Currency {
   /** 主键  自动增长
    * 
    * @pdOid f6aa3148-6530-43cc-8b86-3de05d9d9400 */
   public long id;
   /** 币种名称
    * 
    * @pdOid 0c84e0f1-2045-4060-a52c-4b5ee91ffd76 */
   public String currencyName;
   /** 币种简写
    * 
    * @pdOid 9b616331-282e-4b3b-9cd1-dc522c3c4dee */
   public String currencyShort;
   /** @pdOid d305e538-a94b-45cd-8d2f-2919589f8635 */
   public String symbol;
   /** 描述
    * 
    * @pdOid 20dbe61c-16d6-46bd-8cff-944fbbde7dd6 */
   public String desc;
   /** 是否使用 0：不使用，1：使用
    * 
    * @pdOid 159e22d0-da00-445b-8dc6-492083603caa */
   public String isUes;
   
   /**
 * @return the id
 */
public long getId() {
	return id;
}

/**
 * @param id the id to set
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
 * @param currencyName the currencyName to set
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
 * @param currencyShort the currencyShort to set
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
 * @param symbol the symbol to set
 */
public void setSymbol(String symbol) {
	this.symbol = symbol;
}

/**
 * @return the desc
 */
public String getDesc() {
	return desc;
}

/**
 * @param desc the desc to set
 */
public void setDesc(String desc) {
	this.desc = desc;
}

/**
 * @return the isUes
 */
public String getIsUes() {
	return isUes;
}

/**
 * @param isUes the isUes to set
 */
public void setIsUes(String isUes) {
	this.isUes = isUes;
}

/** @pdRoleInfo migr=no name=CitySettingDictionary assc=currencyAndCityCsdRef coll=java.util.Collection impl=java.util.HashSet mult=0..* */
   public java.util.Collection citySettingDictionary;
   
   
   /** @pdGenerated default getter */
   public java.util.Collection getCitySettingDictionary() {
      if (citySettingDictionary == null)
         citySettingDictionary = new java.util.HashSet();
      return citySettingDictionary;
   }
   
   /** @pdGenerated default iterator getter */
   public java.util.Iterator getIteratorCitySettingDictionary() {
      if (citySettingDictionary == null)
         citySettingDictionary = new java.util.HashSet();
      return citySettingDictionary.iterator();
   }
   
   /** @pdGenerated default setter
     * @param newCitySettingDictionary */
   public void setCitySettingDictionary(java.util.Collection newCitySettingDictionary) {
      removeAllCitySettingDictionary();
      for (java.util.Iterator iter = newCitySettingDictionary.iterator(); iter.hasNext();)
         addCitySettingDictionary((CitySettingDictionary)iter.next());
   }
   
   /** @pdGenerated default add
     * @param newCitySettingDictionary */
   public void addCitySettingDictionary(CitySettingDictionary newCitySettingDictionary) {
      if (newCitySettingDictionary == null)
         return;
      if (this.citySettingDictionary == null)
         this.citySettingDictionary = new java.util.HashSet();
      if (!this.citySettingDictionary.contains(newCitySettingDictionary))
      {
         this.citySettingDictionary.add(newCitySettingDictionary);
         newCitySettingDictionary.setCurrency(this);      
      }
   }
   
   /** @pdGenerated default remove
     * @param oldCitySettingDictionary */
   public void removeCitySettingDictionary(CitySettingDictionary oldCitySettingDictionary) {
      if (oldCitySettingDictionary == null)
         return;
      if (this.citySettingDictionary != null)
         if (this.citySettingDictionary.contains(oldCitySettingDictionary))
         {
            this.citySettingDictionary.remove(oldCitySettingDictionary);
            oldCitySettingDictionary.setCurrency((Currency)null);
         }
   }
   
   /** @pdGenerated default removeAll */
   public void removeAllCitySettingDictionary() {
      if (citySettingDictionary != null)
      {
         CitySettingDictionary oldCitySettingDictionary;
         for (java.util.Iterator iter = getIteratorCitySettingDictionary(); iter.hasNext();)
         {
            oldCitySettingDictionary = (CitySettingDictionary)iter.next();
            iter.remove();
            oldCitySettingDictionary.setCurrency((Currency)null);
         }
      }
   }

}