/***********************************************************************
 * Module:  ProvinceSettingDictionary.java
 * Author:  baoguohao
 * Purpose: Defines the Class ProvinceSettingDictionary
 ***********************************************************************/
package com.fenghuang.entiey;
import java.util.*;

/** 国内省份设置
 * 
 * @pdOid d8072759-1e1a-489b-affd-231430b760ca */
public class ProvinceSettingDictionary {
   /** 主键，自动增长
    * 
    * @pdOid 915de6e9-ad50-4e6c-b177-c1886640aea7 */
   public long id;
   /** 省份名称
    * 
    * @pdOid 2bf8b646-fb0b-4861-821a-c1fcb972aba8 */
   public String pcdName;
   /** 省份英文名称
    * 
    * @pdOid 95514304-e87a-4813-a578-2f3057e1194c */
   public String pcdEnName;
   /** 拼音全拼
    * 
    * @pdOid 7f8fe026-fc6e-4c0b-b1fb-978956032766 */
   public String pcdPinYin;
   /** 拼音简写
    * 
    * @pdOid 15fc81f8-c05a-413b-8158-b49bcf2f6e50 */
   public int pcdJianXie;
   
   /** @pdRoleInfo migr=no name=CitySettingDictionary assc=psdAndCityCsd coll=java.util.Collection impl=java.util.HashSet mult=0..* */
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
         newCitySettingDictionary.setProvinceSettingDictionary(this);      
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
            oldCitySettingDictionary.setProvinceSettingDictionary((ProvinceSettingDictionary)null);
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
            oldCitySettingDictionary.setProvinceSettingDictionary((ProvinceSettingDictionary)null);
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
 * @param id the id to set
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
 * @param pcdName the pcdName to set
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
 * @param pcdEnName the pcdEnName to set
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
 * @param pcdPinYin the pcdPinYin to set
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
 * @param pcdJianXie the pcdJianXie to set
 */
public void setPcdJianXie(int pcdJianXie) {
	this.pcdJianXie = pcdJianXie;
}
   
   

}