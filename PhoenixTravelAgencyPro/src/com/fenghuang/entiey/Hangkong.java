/***********************************************************************
 * Module:  Hangkong.java
 * Author:  Administrator
 * Purpose: Defines the Class Hangkong
 ***********************************************************************/
package com.fenghuang.entiey;
import java.util.*;

/** 航空公司
 * 
 * @pdOid 79a9dc5b-2e4d-46c4-98cb-c54d0029d82c */
public class Hangkong {
	 /** 编号
	    * 
	    * @pdOid f9fb16a8-1fe9-429d-8eb2-f5ecda609038 */
	   public long id;
   /** 国际航协代码
    * 
    * @pdOid a79b26b1-ce18-459a-89e8-738fc1d9fb57 */
   public java.lang.String daima;
   /** 航空公司名称
    * 
    * @pdOid f0f631cc-3358-412a-b819-6edf86db2339 */
   public java.lang.String name;
   /** 税
    * 
    * @pdOid 0a6cf31f-a259-41bc-92a2-bb264ec77fde */
   public float shui;
   /** 币种
    * 
    * @pdOid 49051a06-cdf7-4334-b7a6-a621c3f98a4f */
   public int bizongId;
public long getId() {
	return id;
}
public void setId(long id) {
	this.id = id;
}
public java.lang.String getDaima() {
	return daima;
}
public void setDaima(java.lang.String daima) {
	this.daima = daima;
}
public java.lang.String getName() {
	return name;
}
public void setName(java.lang.String name) {
	this.name = name;
}
public float getShui() {
	return shui;
}
public void setShui(float shui) {
	this.shui = shui;
}
public int getBizongId() {
	return bizongId;
}
public void setBizongId(int bizongId) {
	this.bizongId = bizongId;
}

}