/***********************************************************************
 * Module:  CountryState.java
 * Author:  baoguohao
 * Purpose: Defines the Class CountryState
 ***********************************************************************/
package com.fenghuang.entiey;
import java.util.*;

/** 国家所属州
 * 
 * @pdOid 7079dd20-892d-46fb-bbf8-1cc255ac5cfb */
public class CountryState {
   /** 主键，自动增长
    * 
    * @pdOid b8c024b3-60a6-4178-99a7-1c4aaa7f5ba1 */
   public long id;
   /** 州名字
    * 
    * @pdOid d0265fc5-3d1d-49dd-a3fa-390574e2f6cf */
   public String csName;
   /** 州的描述
    * 
    * @pdOid 7304defd-e1bd-41a2-a8db-2767cab8f7b6 */
   public String csDesc;
   
   /** @pdRoleInfo migr=no name=CountrySettingDictionary assc=countryStateRef coll=java.util.Collection impl=java.util.HashSet mult=0..* */
   public java.util.Collection countrySettingDictionary;
   
   
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
         newCountrySettingDictionary.setCountryState(this);      
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
            oldCountrySettingDictionary.setCountryState((CountryState)null);
         }
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
            oldCountrySettingDictionary.setCountryState((CountryState)null);
         }
      }
   }

}