/***********************************************************************
 * Module:  Jingdian.java
 * Author:  Administrator
 * Purpose: Defines the Class Jingdian
 ***********************************************************************/
package com.fenghuang.entiey;
import java.util.*;

/** 景点
 * 
 * @pdOid af85ee0f-1a78-4535-879a-cb7d1d39029e */
public class Jingdian {
   /** 编号
    * 
    * @pdOid c506d7b0-50cd-4f2f-8bd4-1303b4bb060f */
   public long id;
   /** 名称
    * 
    * @pdOid 1fdab2cc-9ac7-4bd3-b05e-74697f82e42e */
   public java.lang.String name;
   /** 景点英文名称
    * 
    * @pdOid 49619d1c-a3f6-4f78-add9-298fc0a0edf6 */
   public java.lang.String name2;
   /** 城市id
    * 
    * @pdOid eedb7602-52ce-484b-9549-4c7a3f5f830c */
   public int chengsiId;
   /** 门票价格
    * 
    * @pdOid 37e63d12-c1cb-47c8-bdcd-235ba8a35543 */
   public int jiage;
   /** 币种id
    * 
    * @pdOid 1128816b-ddb8-43ff-bf26-8615d14882c3 */
   public int bizongId;
   /** 开发时间起
    * 
    * @pdOid 19827443-bdaf-4583-b79b-326b76aa5f49 */
   public java.lang.String kftimeqi;
   /** 开发时间止
    * 
    * @pdOid ac7f2263-8900-41c8-84bf-95dcbc5d7541 */
   public java.lang.String kftimezhi;
   /** 时间是否可变
    * 
    * @pdOid 2f56477a-68db-48c1-a499-9fccf9750d9a */
   public int timekb;
   /** 联系人
    * 
    * @pdOid 3417a637-6ac4-4f77-b7d9-a0fa19ecf04b */
   public java.lang.String lianxiren;
   /** 电话
    * 
    * @pdOid a8f5b603-65f5-4a3d-b0e6-898d829265a1 */
   public java.lang.String dianhua;
   /** 传真
    * 
    * @pdOid 1f42bb3b-0a49-46eb-be2b-7999a5765248 */
   public java.lang.String chuanzhen;
   /** 邮箱
    * 
    * @pdOid dd518120-3bdb-46ec-b116-f34baa99b953 */
   public java.lang.String email;
   /** 是否订车默认景点
    * 
    * @pdOid 2dc4f024-b9ae-4755-87e9-37fdabde03ff */
   public int dcmr;
   /** 地址
    * 
    * @pdOid 1af62245-859b-4f54-acf4-9d84def9d7d7 */
   public java.lang.String dizhi;
   /** 英文地址
    * 
    * @pdOid 43ae7394-8168-413a-ad8c-30bf9297e844 */
   public java.lang.String ywdz;
   /** 景点描述
    * 
    * @pdOid 2cf4bc78-5502-468d-8256-ed2484ed153c */
   public java.lang.String jdms;
public long getId() {
	return id;
}
public void setId(long id) {
	this.id = id;
}
public java.lang.String getName() {
	return name;
}
public void setName(java.lang.String name) {
	this.name = name;
}
public java.lang.String getName2() {
	return name2;
}
public void setName2(java.lang.String name2) {
	this.name2 = name2;
}
public int getChengsiId() {
	return chengsiId;
}
public void setChengsiId(int chengsiId) {
	this.chengsiId = chengsiId;
}
public int getJiage() {
	return jiage;
}
public void setJiage(int jiage) {
	this.jiage = jiage;
}
public int getBizongId() {
	return bizongId;
}
public void setBizongId(int bizongId) {
	this.bizongId = bizongId;
}
public java.lang.String getKftimeqi() {
	return kftimeqi;
}
public void setKftimeqi(java.lang.String kftimeqi) {
	this.kftimeqi = kftimeqi;
}
public java.lang.String getKftimezhi() {
	return kftimezhi;
}
public void setKftimezhi(java.lang.String kftimezhi) {
	this.kftimezhi = kftimezhi;
}
public int getTimekb() {
	return timekb;
}
public void setTimekb(int timekb) {
	this.timekb = timekb;
}
public java.lang.String getLianxiren() {
	return lianxiren;
}
public void setLianxiren(java.lang.String lianxiren) {
	this.lianxiren = lianxiren;
}
public java.lang.String getDianhua() {
	return dianhua;
}
public void setDianhua(java.lang.String dianhua) {
	this.dianhua = dianhua;
}
public java.lang.String getChuanzhen() {
	return chuanzhen;
}
public void setChuanzhen(java.lang.String chuanzhen) {
	this.chuanzhen = chuanzhen;
}
public java.lang.String getEmail() {
	return email;
}
public void setEmail(java.lang.String email) {
	this.email = email;
}
public int getDcmr() {
	return dcmr;
}
public void setDcmr(int dcmr) {
	this.dcmr = dcmr;
}
public java.lang.String getDizhi() {
	return dizhi;
}
public void setDizhi(java.lang.String dizhi) {
	this.dizhi = dizhi;
}
public java.lang.String getYwdz() {
	return ywdz;
}
public void setYwdz(java.lang.String ywdz) {
	this.ywdz = ywdz;
}
public java.lang.String getJdms() {
	return jdms;
}
public void setJdms(java.lang.String jdms) {
	this.jdms = jdms;
}
   

}