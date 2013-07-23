package com.fenghuang.entiey;

/***********************************************************************
 * Module:  Tuanbiao.java
 * Author:  Administrator
 * Purpose: Defines the Class Tuanbiao
 ***********************************************************************/

import java.util.*;

/** 团队信息
 * 
 * @pdOid 2e6c90da-a695-4a8f-a1c7-22499c89e56c */
public class Tuanbiao {
   /** @pdOid cca18799-9332-4694-8c8a-9ddbb51db735 */
   public long id;
   /** 付款日期
    * 
    * @pdOid a1e08e92-cc9b-43a4-b862-2baf4c52e39d */
   public java.util.Date payment;
   /** 团号ID
    * 
    * @pdOid 20096192-2be1-4f45-bd3b-232cc9ccd7f8 */
   public int team;
   /** 供应商ID
    * 
    * @pdOid ff87441e-0e22-4602-adac-0f25b4dc1360 */
   public int suppliers;
   /** 供应商
    * 
    * @pdOid 17877511-ead0-4df4-a200-79a0b4b493b9 */
   public int gysid;
   /** 操作
    * 
    * @pdOid 259e1c39-c8bb-44cd-a747-df07a2cca265 */
   public java.lang.String caozuo;
   /** 销售人员
    * 
    * @pdOid d97d177f-f744-40d9-81fb-aa0e3b295d09 */
   public java.lang.String xiaoshou;
   /** 财务id
    * 
    * @pdOid 5140c3bf-400b-453a-9e02-e2cdc7182498 */
   public int caiwuid;
   /** 账号id
    * 
    * @pdOid 00823506-0734-48b0-9f6e-062d8f1ceac8 */
   public int zhanghaoid;
public long getId() {
	return id;
}
public void setId(long id) {
	this.id = id;
}
public java.util.Date getPayment() {
	return payment;
}
public void setPayment(java.util.Date payment) {
	this.payment = payment;
}
public int getTeam() {
	return team;
}
public void setTeam(int team) {
	this.team = team;
}
public int getSuppliers() {
	return suppliers;
}
public void setSuppliers(int suppliers) {
	this.suppliers = suppliers;
}
public int getGysid() {
	return gysid;
}
public void setGysid(int gysid) {
	this.gysid = gysid;
}
public java.lang.String getCaozuo() {
	return caozuo;
}
public void setCaozuo(java.lang.String caozuo) {
	this.caozuo = caozuo;
}
public java.lang.String getXiaoshou() {
	return xiaoshou;
}
public void setXiaoshou(java.lang.String xiaoshou) {
	this.xiaoshou = xiaoshou;
}
public int getCaiwuid() {
	return caiwuid;
}
public void setCaiwuid(int caiwuid) {
	this.caiwuid = caiwuid;
}
public int getZhanghaoid() {
	return zhanghaoid;
}
public void setZhanghaoid(int zhanghaoid) {
	this.zhanghaoid = zhanghaoid;
}
   
}