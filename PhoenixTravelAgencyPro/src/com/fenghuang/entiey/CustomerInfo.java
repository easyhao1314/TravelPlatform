/***********************************************************************
 * Module:  CustomerInfo.java
 * Author:  baoguohao
 * Purpose: Defines the Class CustomerInfo
 ***********************************************************************/
package com.fenghuang.entiey;
import java.util.*;

/** 客户信息表
 * 
 * @pdOid 405de95b-2c0b-47cb-b625-f1369b8dc8ed */
public class CustomerInfo {
   /** 主键，自动增长
    * 
    * @pdOid 2b8fe5c7-cc34-485c-9448-9d80bbf14d79 */
   public long id;
   /** 团号
    * 
    * @pdOid 58e4655a-604f-44cc-9823-7cee616e7840 */
   public String tuanNo;
   public String getTuanNo() {
	return tuanNo;
}
public void setTuanNo(String tuanNo) {
	this.tuanNo = tuanNo;
}
public java.util.Date getZhtime() {
	return zhtime;
}
public void setZhtime(java.util.Date zhtime) {
	this.zhtime = zhtime;
}
/** 客户公司名称
    * 
    * @pdOid 58e4655a-604f-44cc-9823-7cee616e7840 */
   public String name;
   /** 联系人
    * 
    * @pdOid 3f10cf18-64a7-482f-923b-a721a489bf3a */
   public String lxr;
   /** 职位
    * 
    * @pdOid 6709731f-54db-4f95-9c61-454acd14c1f6 */
   public String post;
   /** 年龄
    * 
    * @pdOid 6709731f-54db-4f95-9c61-454acd14c1f6 */
   public String age;
   /** 性别
    * 
    * @pdOid 6709731f-54db-4f95-9c61-454acd14c1f6 */
   public long sex;
   /** 手机
    * 
    * @pdOid 16ec1587-ef2c-4d4a-be9b-2eb372dd4842 */
   public String moblePhone;
   /** 电话
    * 
    * @pdOid 03f8267f-54fa-4d4a-93d6-bddada1becc0 */
   public String telePhone;
   /** QQ */
   public String qq;
   /** 邮箱 */
   public String email;
   /** msn */
   public String msn;
   /**传真*/
   public String chuanzhen;
   /** 身份证号 */
   public String sfzn;
   /** 集团
    * 
    * @pdOid 922bca2b-dc8e-4a60-a0f9-cb37ce7ae236 */
   public String jituan;
   /** 所在城市
    * 
    * @pdOid 922bca2b-dc8e-4a60-a0f9-cb37ce7ae236 */
   public long city;
   /** 所属大区
    * 
    * @pdOid 3e04720d-3d87-41b0-b927-531ca90fe7df */
   public long daqu;
  
   /** 地址
    * 
    * @pdOid f1a28008-5011-4edb-bca8-6cd2c49fa29c */
   public String address;
  
   /** 合作级别*/
   public int hzjb;
   /** 销售/维护人 */
   public String xiaoshou;
   /** 创建时间 */
  public java.util.Date cjtime;
  /** 最后联系时间 */
  public java.util.Date zhtime;
  /** 联系人数 */
  public int lxrs;
  /** 备注 */
  public String bz;
  /** 团队类型*/
  public int type;
public long getId() {
	return id;
}
public void setId(long id) {
	this.id = id;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getLxr() {
	return lxr;
}
public void setLxr(String lxr) {
	this.lxr = lxr;
}
public String getPost() {
	return post;
}
public void setPost(String post) {
	this.post = post;
}
public String getAge() {
	return age;
}
public void setAge(String age) {
	this.age = age;
}

public long getSex() {
	return sex;
}
public void setSex(long sex) {
	this.sex = sex;
}
public String getMoblePhone() {
	return moblePhone;
}
public void setMoblePhone(String moblePhone) {
	this.moblePhone = moblePhone;
}
public String getTelePhone() {
	return telePhone;
}
public void setTelePhone(String telePhone) {
	this.telePhone = telePhone;
}
public String getQq() {
	return qq;
}
public void setQq(String qq) {
	this.qq = qq;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getMsn() {
	return msn;
}
public void setMsn(String msn) {
	this.msn = msn;
}
public String getChuanzhen() {
	return chuanzhen;
}
public void setChuanzhen(String chuanzhen) {
	this.chuanzhen = chuanzhen;
}
public String getSfzn() {
	return sfzn;
}
public void setSfzn(String sfzn) {
	this.sfzn = sfzn;
}

public String getJituan() {
	return jituan;
}
public void setJituan(String jituan) {
	this.jituan = jituan;
}
public long getCity() {
	return city;
}
public void setCity(long city) {
	this.city = city;
}
public long getDaqu() {
	return daqu;
}
public void setDaqu(long daqu) {
	this.daqu = daqu;
}
public String getAddress() {
	return address;
}
public void setAddress(String address) {
	this.address = address;
}
public int getHzjb() {
	return hzjb;
}
public void setHzjb(int hzjb) {
	this.hzjb = hzjb;
}
public String getXiaoshou() {
	return xiaoshou;
}
public void setXiaoshou(String xiaoshou) {
	this.xiaoshou = xiaoshou;
}
public java.util.Date getCjtime() {
	return cjtime;
}
public void setCjtime(java.util.Date cjtime) {
	this.cjtime = cjtime;
}
public int getLxrs() {
	return lxrs;
}
public void setLxrs(int lxrs) {
	this.lxrs = lxrs;
}
public String getBz() {
	return bz;
}
public void setBz(String bz) {
	this.bz = bz;
}
public int getType() {
	return type;
}
public void setType(int type) {
	this.type = type;
}

  



}