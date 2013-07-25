package com.fenghuang.entiey;

/***********************************************************************
 * Module:  Fukuanfangshi.java
 * Author:  Administrator
 * Purpose: Defines the Class Fukuanfangshi
 ***********************************************************************/

import java.util.*;

/** @pdOid 9de1996e-0c4f-429c-bc3e-6d988adb32cb */
public class Fukuanfangshi {
   /** @pdOid 6d701840-87da-460a-aa36-d87e62e7a42c */
   public long id;
   /** 付款方式名称
    * 
    * @pdOid 8b5b81ce-fccc-43a5-bf29-e684fa658868 */
   public java.lang.String fukuanfangshi;
   /** 付款方式描述
    * 
    * @pdOid 0144650c-3b43-4c09-9e5e-b88a30bbe697 */
   public java.lang.String miaoshu;
public long getId() {
	return id;
}
public void setId(long id) {
	this.id = id;
}
public java.lang.String getFukuanfangshi() {
	return fukuanfangshi;
}
public void setFukuanfangshi(java.lang.String fukuanfangshi) {
	this.fukuanfangshi = fukuanfangshi;
}
public java.lang.String getMiaoshu() {
	return miaoshu;
}
public void setMiaoshu(java.lang.String miaoshu) {
	this.miaoshu = miaoshu;
}

}