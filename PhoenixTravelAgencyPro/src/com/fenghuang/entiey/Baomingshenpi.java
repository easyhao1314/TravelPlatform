/***********************************************************************
 * Module:  Baomingshenpi.java
 * Author:  Administrator
 * Purpose: Defines the Class Baomingshenpi
 ***********************************************************************/
package com.fenghuang.entiey;
import java.util.*;

/** 散拼报名审批、专团申请、退团申请
 * 
 * @pdOid f0de45b9-dad5-4a2f-9965-db1d8982ebe9 */
public class Baomingshenpi {
   /** 自增ID
    * 
    * @pdOid e0a3fe54-fccf-4ae1-8134-5f0eca76746c */
   public long bmid;
   /** 客户信息ID
    * 
    * @pdOid e30eb583-3946-4af3-a7c6-0845cabbd963 */
   public long kehuid;
   /** 报名审批 是否、1是、2否
    * 
    * @pdOid de5a6ecb-399b-41d3-9f5b-8a843da353a6 */
   public int baomingsp;
   /** 报名受理 是否、1是、2否
    * 
    * @pdOid f25e04c3-181d-48f1-a980-f44a5b059ba6 */
   public int baomingsl;
   /** 押金确认1是2否
    * 
    * @pdOid 4b3245e0-7a84-429d-bea4-fe1eaa5d64cd */
   public int yajinqueren;
   /** 出票确认 1是2否
    * 
    * @pdOid f5114b3f-b26a-4442-ad56-df7637dcac3d */
   public int chupiaoqueren;
   /** 出团确认 1是2否
    * 
    * @pdOid 756b374a-f399-45a5-bcf9-b8b09334fe98 */
   public int chutuanqueren;
   /** 备注
    * 
    * @pdOid 719a6a0e-ac21-4a0f-9037-72da536978ac */
   public java.lang.String beizhu;
   /** 客户姓名
    * 
    * @pdOid 0543d827-716d-4c24-bfc0-200310dc13e2 */
   public java.lang.String kehuname;
   /** 性别
    * 
    * @pdOid 24741dfb-3f93-492a-b4b8-3316cd15c065 */
   public long sex;
   /** 证件号、身份证号
    * 
    * @pdOid 49cade96-5cfe-46fb-801e-db69264f53b8 */
   public java.lang.String zhengjianhao;
public java.lang.String getKehuname() {
	return kehuname;
}
public void setKehuname(java.lang.String kehuname) {
	this.kehuname = kehuname;
}
public long getSex() {
	return sex;
}
public void setSex(long sex) {
	this.sex = sex;
}
public java.lang.String getZhengjianhao() {
	return zhengjianhao;
}
public void setZhengjianhao(java.lang.String zhengjianhao) {
	this.zhengjianhao = zhengjianhao;
}
public long getBmid() {
	return bmid;
}
public void setBmid(long bmid) {
	this.bmid = bmid;
}
public long getKehuid() {
	return kehuid;
}
public void setKehuid(long kehuid) {
	this.kehuid = kehuid;
}
public int getBaomingsp() {
	return baomingsp;
}
public void setBaomingsp(int baomingsp) {
	this.baomingsp = baomingsp;
}
public int getBaomingsl() {
	return baomingsl;
}
public void setBaomingsl(int baomingsl) {
	this.baomingsl = baomingsl;
}
public int getYajinqueren() {
	return yajinqueren;
}
public void setYajinqueren(int yajinqueren) {
	this.yajinqueren = yajinqueren;
}
public int getChupiaoqueren() {
	return chupiaoqueren;
}
public void setChupiaoqueren(int chupiaoqueren) {
	this.chupiaoqueren = chupiaoqueren;
}
public int getChutuanqueren() {
	return chutuanqueren;
}
public void setChutuanqueren(int chutuanqueren) {
	this.chutuanqueren = chutuanqueren;
}
public java.lang.String getBeizhu() {
	return beizhu;
}
public void setBeizhu(java.lang.String beizhu) {
	this.beizhu = beizhu;
}
   
}