/***********************************************************************
 * Module:  Operate.java
 * Author:  Administrator
 * Purpose: Defines the Class Operate
 ***********************************************************************/

package com.fenghuang.entiey;
import java.util.*;

/** 操作中心（操作表）
 * 
 * @pdOid 0c4c2e22-1df1-4fd2-a8ae-928e13e1d8b2 */
public class Operate {
   /** 自增ID
    * 
    * @pdOid 99234d60-df63-425d-bf87-2a582bac6aaa */
   public int oid;
   /** 团号
    * 
    * @pdOid d9b24ab3-4b7c-4785-8aab-249d468ddcbc */
   public java.lang.String tuanNo;
   /** 团名
    * 
    * @pdOid 37bc54e3-7bc7-4c50-be9e-8474e6e06d9a */
   public java.lang.String tuanName;
   /** 客户ID
    * 
    * @pdOid 063de5f9-8528-4b40-ac6e-c63781a5225d */
   public long kehuID;
   /** 客户名称
    * 
    * @pdOid 7f5be682-8833-40ae-9228-874080cf7539 */
   public java.lang.String kehuName;
   /** 出团日期
    * 
    * @pdOid 616b7a7f-1089-446d-9272-930bfc8bdab6 */
   public java.util.Date chutuantime;
   /** 回团日期
    * 
    * @pdOid 08999aa4-f39d-4d64-b9dd-d064f99cabdd */
   public java.util.Date huituantime;
   /** 派单人
    * 
    * @pdOid 7c061d9c-fe81-4ab1-8903-b78e5e6eb940 */
   public long paidanren;
   /** 接单人
    * 
    * @pdOid f11bfc26-151b-4aeb-ada4-ac7e79f361b4 */
   public long jiedanren;
   /** 操作进展
    * 
    * @pdOid 0ec81e2d-a0c3-427f-82fd-d3a52e37843b */
   public int jinzhan;
   /** 派单日期
    * 
    * @pdOid 690b16fe-869f-4c1c-9ba0-3e369f18400c */
   public java.util.Date paidantime;
   /** 订单类型   1、订房 2、订车3、订导游4、购物点
    * 
    * @pdOid 8fa2e367-4ec4-4204-a3a4-445f5e9f4529 */
   public int operateType;
   /** 操作状态  1、已下预订单 2、财务确认 3、核算完毕4、已派卡打款
    * 
    * @pdOid 90013b42-7003-4011-9966-d8aa5c93d3c3 */
   public int operatestate;

   
   
public int getOperatestate() {
	return operatestate;
}
public void setOperatestate(int operatestate) {
	this.operatestate = operatestate;
}
public int getOid() {
	return oid;
}
public void setOid(int oid) {
	this.oid = oid;
}
public java.lang.String getTuanNo() {
	return tuanNo;
}
public void setTuanNo(java.lang.String tuanNo) {
	this.tuanNo = tuanNo;
}
public java.lang.String getTuanName() {
	return tuanName;
}
public void setTuanName(java.lang.String tuanName) {
	this.tuanName = tuanName;
}
public long getKehuID() {
	return kehuID;
}
public void setKehuID(long kehuID) {
	this.kehuID = kehuID;
}
public java.lang.String getKehuName() {
	return kehuName;
}
public void setKehuName(java.lang.String kehuName) {
	this.kehuName = kehuName;
}
public java.util.Date getChutuantime() {
	return chutuantime;
}
public void setChutuantime(java.util.Date chutuantime) {
	this.chutuantime = chutuantime;
}
public java.util.Date getHuituantime() {
	return huituantime;
}
public void setHuituantime(java.util.Date huituantime) {
	this.huituantime = huituantime;
}
public long getPaidanren() {
	return paidanren;
}
public void setPaidanren(long paidanren) {
	this.paidanren = paidanren;
}
public long getJiedanren() {
	return jiedanren;
}
public void setJiedanren(long jiedanren) {
	this.jiedanren = jiedanren;
}
public int getJinzhan() {
	return jinzhan;
}
public void setJinzhan(int jinzhan) {
	this.jinzhan = jinzhan;
}
public java.util.Date getPaidantime() {
	return paidantime;
}
public void setPaidantime(java.util.Date paidantime) {
	this.paidantime = paidantime;
}
public int getOperateType() {
	return operateType;
}
public void setOperateType(int operateType) {
	this.operateType = operateType;
}

   
   
   
}