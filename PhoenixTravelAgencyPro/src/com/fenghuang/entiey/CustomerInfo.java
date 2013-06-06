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
   /** 客户公司名称
    * 
    * @pdOid 58e4655a-604f-44cc-9823-7cee616e7840 */
   public String name;
   /** 所在省份
    * 
    * @pdOid 3e04720d-3d87-41b0-b927-531ca90fe7df */
   public long province;
   /** 所在城市
    * 
    * @pdOid 922bca2b-dc8e-4a60-a0f9-cb37ce7ae236 */
   public long city;
   /** 联系人
    * 
    * @pdOid 3f10cf18-64a7-482f-923b-a721a489bf3a */
   public String contact;
   /** 职位
    * 
    * @pdOid 6709731f-54db-4f95-9c61-454acd14c1f6 */
   public String post;
   /** 地址
    * 
    * @pdOid f1a28008-5011-4edb-bca8-6cd2c49fa29c */
   public String address;
   /** 手机
    * 
    * @pdOid 16ec1587-ef2c-4d4a-be9b-2eb372dd4842 */
   public String moblePhone;
   /** 座机
    * 
    * @pdOid 03f8267f-54fa-4d4a-93d6-bddada1becc0 */
   public String telePhone;
   /** @pdOid 7f7edc8b-ab01-4426-be1c-d6e0504eadbd */
   public String qq;
   /** @pdOid 8435f4ec-beba-4fe2-989e-0df555d05570 */
   public String msn;
   /** @pdOid 56f0342a-296f-46bd-87e5-71a0fac36912 */
   public String fax;
   /** @pdOid 121681fd-e05c-4971-a2d4-ffc4c0d8d46d */
   public String email;
/**
 * @return the id
 */
public long getId() {
	return id;
}
/**
 * @param id the id to set
 */
public void setId(long id) {
	this.id = id;
}
/**
 * @return the name
 */
public String getName() {
	return name;
}
/**
 * @param name the name to set
 */
public void setName(String name) {
	this.name = name;
}
/**
 * @return the province
 */
public long getProvince() {
	return province;
}
/**
 * @param province the province to set
 */
public void setProvince(long province) {
	this.province = province;
}
/**
 * @return the city
 */
public long getCity() {
	return city;
}
/**
 * @param city the city to set
 */
public void setCity(long city) {
	this.city = city;
}
/**
 * @return the contact
 */
public String getContact() {
	return contact;
}
/**
 * @param contact the contact to set
 */
public void setContact(String contact) {
	this.contact = contact;
}
/**
 * @return the post
 */
public String getPost() {
	return post;
}
/**
 * @param post the post to set
 */
public void setPost(String post) {
	this.post = post;
}
/**
 * @return the address
 */
public String getAddress() {
	return address;
}
/**
 * @param address the address to set
 */
public void setAddress(String address) {
	this.address = address;
}
/**
 * @return the moblePhone
 */
public String getMoblePhone() {
	return moblePhone;
}
/**
 * @param moblePhone the moblePhone to set
 */
public void setMoblePhone(String moblePhone) {
	this.moblePhone = moblePhone;
}
/**
 * @return the telePhone
 */
public String getTelePhone() {
	return telePhone;
}
/**
 * @param telePhone the telePhone to set
 */
public void setTelePhone(String telePhone) {
	this.telePhone = telePhone;
}
/**
 * @return the qq
 */
public String getQq() {
	return qq;
}
/**
 * @param qq the qq to set
 */
public void setQq(String qq) {
	this.qq = qq;
}
/**
 * @return the msn
 */
public String getMsn() {
	return msn;
}
/**
 * @param msn the msn to set
 */
public void setMsn(String msn) {
	this.msn = msn;
}
/**
 * @return the fax
 */
public String getFax() {
	return fax;
}
/**
 * @param fax the fax to set
 */
public void setFax(String fax) {
	this.fax = fax;
}
/**
 * @return the email
 */
public String getEmail() {
	return email;
}
/**
 * @param email the email to set
 */
public void setEmail(String email) {
	this.email = email;
}
   
   

}