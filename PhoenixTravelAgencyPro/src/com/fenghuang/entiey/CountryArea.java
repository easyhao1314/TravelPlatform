/***********************************************************************
 * Module:  CountryArea.java
 * Author:  baoguohao
 * Purpose: Defines the Class CountryArea
 ***********************************************************************/
package com.fenghuang.entiey;
import java.util.*;

/** 地区表和报价区域
 * 
 * @pdOid 3f223d7e-8d31-420f-a2a1-bc8da9ad234b */
public class CountryArea {
   /** 主键，自动增长
    * 
    * @pdOid 65568617-9d8f-4000-b349-6e5c7c4f2c72 */
   public long id;
   /** @pdOid 872efb4e-82e5-4d3c-b865-6e37c28af1e3 */
   public String caName;
   /** 地区描述
    * 
    * @pdOid d70c8401-e134-419e-9439-18f2616099e7 */
   public String caDesc;
   /** 地区类型
    * 1：正常地区，0：报价区域
    * 
    * @pdOid 9a7f69ca-05f0-4785-b38b-283cb4817b8b */
   public int caType;
   
   /** @pdRoleInfo migr=no name=CountrySettingDictionary assc=countryAreaRef coll=java.util.Collection impl=java.util.HashSet mult=0..* */
   public java.util.Collection countrySettingDictionary;
   /** @pdRoleInfo migr=no name=CitySettingDictionary assc=caANDCitysdRef coll=java.util.Collection impl=java.util.HashSet mult=0..* */
   public java.util.Collection citySettingDictionary;
   
   
   /** @pdGenerated default getter */
   public java.util.Collection getCountrySettingDictionary() {
      if (countrySettingDictionary == null)
         countrySettingDictionary = new java.util.HashSet();
      return countrySettingDictionary;
   }
   
   /** @pdGenerated default iterator getter */
   public java.util.Iterator getIteratorCountrySettingDictionary() {
      if (countrySettingDictionary == null)
         countrySettingDictionary = new java.util.HashSet();
      return countrySettingDictionary.iterator();
   }
   
   /** @pdGenerated default setter
     * @param newCountrySettingDictionary */
   public void setCountrySettingDictionary(java.util.Collection newCountrySettingDictionary) {
      removeAllCountrySettingDictionary();
      for (java.util.Iterator iter = newCountrySettingDictionary.iterator(); iter.hasNext();)
         addCountrySettingDictionary((CountrySettingDictionary)iter.next());
   }
   
   /** @pdGenerated default add
     * @param newCountrySettingDictionary */
   public void addCountrySettingDictionary(CountrySettingDictionary newCountrySettingDictionary) {
      if (newCountrySettingDictionary == null)
         return;
      if (this.countrySettingDictionary == null)
         this.countrySettingDictionary = new java.util.HashSet();
      if (!this.countrySettingDictionary.contains(newCountrySettingDictionary))
      {
         this.countrySettingDictionary.add(newCountrySettingDictionary);
         newCountrySettingDictionary.setCountryArea(this);      
      }
   }
   
   /** @pdGenerated default remove
     * @param oldCountrySettingDictionary */
   public void removeCountrySettingDictionary(CountrySettingDictionary oldCountrySettingDictionary) {
      if (oldCountrySettingDictionary == null)
         return;
      if (this.countrySettingDictionary != null)
         if (this.countrySettingDictionary.contains(oldCountrySettingDictionary))
         {
            this.countrySettingDictionary.remove(oldCountrySettingDictionary);
            oldCountrySettingDictionary.setCountryArea((CountryArea)null);
         }
   }
   
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
 * @return the caName
 */
public String getCaName() {
	return caName;
}

/**
 * @param caName the caName to set
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
 * @param caDesc the caDesc to set
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
 * @param caType the caType to set
 */
public void setCaType(int caType) {
	this.caType = caType;
}

/** @pdGenerated default removeAll */
   public void removeAllCountrySettingDictionary() {
      if (countrySettingDictionary != null)
      {
         CountrySettingDictionary oldCountrySettingDictionary;
         for (java.util.Iterator iter = getIteratorCountrySettingDictionary(); iter.hasNext();)
         {
            oldCountrySettingDictionary = (CountrySettingDictionary)iter.next();
            iter.remove();
            oldCountrySettingDictionary.setCountryArea((CountryArea)null);
         }
      }
   }
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
         newCitySettingDictionary.setCountryArea(this);      
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
            oldCitySettingDictionary.setCountryArea((CountryArea)null);
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
            oldCitySettingDictionary.setCountryArea((CountryArea)null);
         }
      }
   }

}