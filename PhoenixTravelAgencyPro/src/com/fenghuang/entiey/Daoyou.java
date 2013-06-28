/***********************************************************************
 * Module:  Daoyou.java
 * Author:  Administrator
 * Purpose: Defines the Class Daoyou
 ***********************************************************************/
package com.fenghuang.entiey;
import java.util.*;

/** 导游
 * 
 * @pdOid 4800717f-944f-4ec5-a3ba-e4f71d5623f3 */
public class Daoyou {
   /** 编号
    * 
    * @pdOid 01a942cb-5f79-4496-956b-59e6a7a6e936 */
   public long id;
   /** 国籍（国家）
    * 
    * @pdOid 1dd2e75f-4bdc-4658-8ff1-140ca77da7e4 */
   public long guojiaId;
   /** 姓名
    * 
    * @pdOid 1dd2e75f-4bdc-4658-8ff1-140ca77da7e4 */
   public java.lang.String name;
   /** 姓名拼音
    * 
    * @pdOid dcb42310-946f-44a0-b010-682e5025e968 */
   public java.lang.String name2;
   /** 
    * 英文名字
    * 
    * @pdOid aebd7684-c36b-4f4f-9511-c10134fb9e06 */
   public java.lang.String name3;
   /** 证件类型
    * 
    * @pdOid 4886564a-ef6d-4a18-9bc4-dc99001a437a */
   public java.lang.String zjlx;
   /** 证件号码
    * 
    * @pdOid 8a1b18f5-6a18-4b90-975d-bd28c7cb79d2 */
   public java.lang.String zjhm;
   /** 常驻地（城市）
    * 
    * @pdOid 1fad2e06-415c-4191-b8a8-d6a25b23bb13 */
   public int chengshiId;
   /** 电话
    * 
    * @pdOid 39088985-8425-4731-b787-667a40294e34 */
   public java.lang.String dinhua;
   /** 联系方式1
    * 
    * @pdOid 04365e6c-7228-45d5-a26d-c46924ac330b */
   public java.lang.String lxfs1;
   /** 联系方式2
    * 
    * @pdOid e62e37f8-164c-4e47-8937-98bcea80e9e8 */
   public java.lang.String lxfs2;
   /** 联系方式3
    * 
    * @pdOid 55eca568-7ef1-4b08-a62e-746befae04c9 */
   public java.lang.String lxfs3;
   /** Email
    * 
    * @pdOid 545d85f9-b34d-4166-b6d9-52f6af27dda0 */
   public java.lang.String email;
   /** 手机
    * 
    * @pdOid 545d85f9-b34d-4166-b6d9-52f6af27dda0 */
   public java.lang.String shouji;
   /** FAX
    * 
    * @pdOid 37f85621-6d23-48c5-949e-5c0fd33a060d */
   public java.lang.String fax;
   /** 导游费用
    * 
    * @pdOid 95780d66-31d5-4948-9e58-b28d1ce1ac37 */
   public int dyfy;
   /** 合作级别id
    * 
    * @pdOid 8a236b0e-38ab-49f1-bde7-f8cdab9c9eb1 */
   public int hzjbId;
   /** 备注
    * 
    * @pdOid be303d19-e27d-4bb9-ba23-528fed569bfc */
   public java.lang.String bz;
   /** 照片
    * 
    * @pdOid 680ee95d-dbf4-4f1d-ab34-7ebac7f84eef */
   public java.lang.String zhaopian;
public long getId() {
	return id;
}
public void setId(long id) {
	this.id = id;
}
public long getGuojiaId() {
	return guojiaId;
}
public void setGuojiaId(long guojiaId) {
	this.guojiaId = guojiaId;
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
public java.lang.String getName3() {
	return name3;
}
public void setName3(java.lang.String name3) {
	this.name3 = name3;
}
public java.lang.String getZjlx() {
	return zjlx;
}
public void setZjlx(java.lang.String zjlx) {
	this.zjlx = zjlx;
}
public java.lang.String getZjhm() {
	return zjhm;
}
public void setZjhm(java.lang.String zjhm) {
	this.zjhm = zjhm;
}
public int getChengshiId() {
	return chengshiId;
}
public void setChengshiId(int chengshiId) {
	this.chengshiId = chengshiId;
}
public java.lang.String getDinhua() {
	return dinhua;
}
public void setDinhua(java.lang.String dinhua) {
	this.dinhua = dinhua;
}
public java.lang.String getLxfs1() {
	return lxfs1;
}
public void setLxfs1(java.lang.String lxfs1) {
	this.lxfs1 = lxfs1;
}
public java.lang.String getLxfs2() {
	return lxfs2;
}
public void setLxfs2(java.lang.String lxfs2) {
	this.lxfs2 = lxfs2;
}
public java.lang.String getLxfs3() {
	return lxfs3;
}
public void setLxfs3(java.lang.String lxfs3) {
	this.lxfs3 = lxfs3;
}
public java.lang.String getEmail() {
	return email;
}
public void setEmail(java.lang.String email) {
	this.email = email;
}
public java.lang.String getShouji() {
	return shouji;
}
public void setShouji(java.lang.String shouji) {
	this.shouji = shouji;
}
public java.lang.String getFax() {
	return fax;
}
public void setFax(java.lang.String fax) {
	this.fax = fax;
}
public int getDyfy() {
	return dyfy;
}
public void setDyfy(int dyfy) {
	this.dyfy = dyfy;
}
public int getHzjbId() {
	return hzjbId;
}
public void setHzjbId(int hzjbId) {
	this.hzjbId = hzjbId;
}
public java.lang.String getBz() {
	return bz;
}
public void setBz(java.lang.String bz) {
	this.bz = bz;
}
public java.lang.String getZhaopian() {
	return zhaopian;
}
public void setZhaopian(java.lang.String zhaopian) {
	this.zhaopian = zhaopian;
}
   

}