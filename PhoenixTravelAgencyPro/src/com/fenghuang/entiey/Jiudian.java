/***********************************************************************
 * Module:  Jiudian.java
 * Author:  Administrator
 * Purpose: Defines the Class Jiudian
 ***********************************************************************/
package com.fenghuang.entiey;
import java.util.*;

/** 酒店供应商
 * 
 * @pdOid 9ea7ca06-a1ad-4b07-9bce-7f157d2f7eda */
public class Jiudian {
   /** 编号
    * 
    * @pdOid 18edf4fe-19a6-423b-a65b-99d83a4338ed */
   public long id;
   /** 城市
    * 
    * @pdOid c314e748-1410-45dc-965c-cd0e6619b8e1 */
   public long chengshi;
   /** 酒店供应商名称
    * 
    * @pdOid 194eb6e8-5a41-4cdb-8660-91e3c088f001 */
   public java.lang.String name;
   /** 酒店房间数
    * 
    * @pdOid 6076c883-3854-4c4f-8b54-6023e79883bf */
   public long fangjian;
   /** 合作级别
    * 
    * @pdOid 691d3945-f06d-409b-9011-acd1acb8cfd2 */
   public java.lang.String hzjb;
   /** 维护人
    * 
    * @pdOid c337075c-9a2b-442a-aac8-c76a505730c4 */
   public java.lang.String whr;

   /** 星级标准
    * 
    * @pdOid 27f3ed98-7553-4997-bcb2-976f6b39aea1 */
   public java.lang.String xjbz;
   /** 电话
    * 
    * @pdOid 69cb080e-4792-4d47-94cc-19bee4f9b050 */
   public java.lang.String dianhua;
   /** 传真
    * 
    * @pdOid 0edfc2b3-6cc2-496d-b908-644b4dc929e7 */
   public java.lang.String chuanzhen;
   /** 邮箱
    * 
    * @pdOid 0ca4b285-3468-4de2-8b04-6bc778c6ac21 */
   public java.lang.String email;
 
/** 官网
    * 
    * @pdOid 802e51af-ebbf-4f31-98e4-5290f536a3ce */
   public java.lang.String guanwang;
   /** 地址
    * 
    * @pdOid 652cee58-0f99-4bc9-81ef-621c69efff25 */
   public java.lang.String dizhi;
   /** 评价
    * 
    * @pdOid 6a5d87b4-138b-4fcb-b606-3850916becd6 */
   public java.lang.String pingjia;
   /** 提示
    * 
    * @pdOid 666b8116-9d2d-4559-bba9-45d49671033f */
   public java.lang.String tishi;
   /** 淡季价
    * 
    * @pdOid 7aeee942-21ee-4624-ac36-9a06bea98d3d */
   public int danjijia;
   /** 旺季价
    * 
    * @pdOid 33ae3db7-c878-4979-abf6-08b4f6ddae11 */
   public int wangjijia;
   /** 价格说明
    * 
    * @pdOid 4e492ba6-d13d-4676-8a83-7960e88c3853 */
   public java.lang.String jgsm;
   /** 备注
    * 
    * @pdOid 087057a8-206d-4bad-bed5-78b690298c5d */
   public java.lang.String bz;
   
   
   public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public long getChengshi() {
		return chengshi;
	}
	public void setChengshi(long chengshi) {
		this.chengshi = chengshi;
	}
	public java.lang.String getName() {
		return name;
	}
	public void setName(java.lang.String name) {
		this.name = name;
	}
	public long getFangjian() {
		return fangjian;
	}
	public void setFangjian(long fangjian) {
		this.fangjian = fangjian;
	}
	public java.lang.String getHzjb() {
		return hzjb;
	}
	public void setHzjb(java.lang.String hzjb) {
		this.hzjb = hzjb;
	}
	public java.lang.String getWhr() {
		return whr;
	}
	public void setWhr(java.lang.String whr) {
		this.whr = whr;
	}
	public java.lang.String getXjbz() {
		return xjbz;
	}
	public void setXjbz(java.lang.String xjbz) {
		this.xjbz = xjbz;
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
	public java.lang.String getGuanwang() {
		return guanwang;
	}
	public void setGuanwang(java.lang.String guanwang) {
		this.guanwang = guanwang;
	}
	public java.lang.String getDizhi() {
		return dizhi;
	}
	public void setDizhi(java.lang.String dizhi) {
		this.dizhi = dizhi;
	}
	public java.lang.String getPingjia() {
		return pingjia;
	}
	public void setPingjia(java.lang.String pingjia) {
		this.pingjia = pingjia;
	}
	public java.lang.String getTishi() {
		return tishi;
	}
	public void setTishi(java.lang.String tishi) {
		this.tishi = tishi;
	}
	public int getDanjijia() {
		return danjijia;
	}
	public void setDanjijia(int danjijia) {
		this.danjijia = danjijia;
	}
	public int getWangjijia() {
		return wangjijia;
	}
	public void setWangjijia(int wangjijia) {
		this.wangjijia = wangjijia;
	}
	public java.lang.String getJgsm() {
		return jgsm;
	}
	public void setJgsm(java.lang.String jgsm) {
		this.jgsm = jgsm;
	}
	public java.lang.String getBz() {
		return bz;
	}
	public void setBz(java.lang.String bz) {
		this.bz = bz;
	}

}