package com.fenghuang.entiey;

/***********************************************************************
 * Module:  Fukuanqueren.java
 * Author:  Administrator
 * Purpose: Defines the Class Fukuanqueren
 ***********************************************************************/

import java.util.*;

/** 付款确认
 * 
 * @pdOid 530a1e8e-cd3c-4094-b399-c2a6d2f25829 */
public class Fukuanqueren {
   /** @pdOid 59db92bf-7494-48d3-9501-d7b8e2df536a */
   public long id;
   /** 团表ID
    * 
    * @pdOid a70495aa-a34a-4c52-acc0-88fb305b12b2 */
   public int tuanbiaoid;
   public long getId() {
	return id;
}
public void setId(long id) {
	this.id = id;
}
public int getTuanbiaoid() {
	return tuanbiaoid;
}
public void setTuanbiaoid(int tuanbiaoid) {
	this.tuanbiaoid = tuanbiaoid;
}
public int getCaiwubiaoid() {
	return caiwubiaoid;
}
public void setCaiwubiaoid(int caiwubiaoid) {
	this.caiwubiaoid = caiwubiaoid;
}
/** 财务表id
    * 
    * @pdOid 25551d74-9978-48ac-a1b0-8f71a42a6b59 */
   public int caiwubiaoid;

}