/***********************************************************************
 * Module:  Jiaotong.java
 * Author:  Administrator
 * Purpose: Defines the Class Jiaotong
 ***********************************************************************/
package com.fenghuang.entiey;
import java.util.*;

/** 交通供应商
 * 
 * @pdOid e5f837c5-7950-4f21-ac75-32ee45c4871d */
public class Jiaotong {

/** 编号
    * 
    * @pdOid f9fb16a8-1fe9-429d-8eb2-f5ecda609038 */
   public long id;
   /** 供应商名称
    * 
    * @pdOid 89fe6a6b-62b3-4660-85ef-610f11e244eb */
   public java.lang.String name;
   /** 联系人
    * 
    * @pdOid f33f297a-0a18-4bb3-b9a2-28da9a504731 */
   public java.lang.String lianxiren;
   /** 城市Id
    * 
    * 
    * @pdOid 3163e708-871d-4c0e-bf11-3b764599dfa0 */
   public int chengshiId;
   /** 地址
    * 
    * @pdOid fc515a4f-4731-4da7-b3e1-e759224fc436 */
   public java.lang.String dizhi;
   /** 电话
    * 
    * @pdOid ad13d058-d12b-443e-8000-31774f0920dd */
   public int dianhua;
   /** 手机
    * 
    * @pdOid f1894906-ccb9-467b-8a53-3252596ba7d4 */
   public int shouji;
   /** 邮箱
    * 
    * @pdOid d57959bd-008e-448a-a909-6d782442fca2 */
   public java.lang.String email;
   /** 传真
    * 
    * @pdOid f5a8f722-da48-4028-9f25-594718c914f7 */
   public java.lang.String chuanzhen;
   /** 网址
    * 
    * @pdOid 98b3f157-07db-4b2a-9b48-98309aa149c9 */
   public java.lang.String wangzhi;
   /** 价格
    * 
    * @pdOid c3080cf4-24d0-4391-bdf7-461b8b0b4b4c */
   public int jiage;
   /** 合作级别Id
    * 
    * @pdOid bf3d9a7b-2f0a-4c87-bc44-729acbad5257 */
   public int hzjbId;
   /** 外呼方式id
    * 
    * @pdOid 7e7cd036-a492-4ff4-9655-a2b430866458 */
   public int whfsid;
   /** 备注
    * 
    * @pdOid 86dbc7b6-4dc1-4b25-8002-67f9715ba446 */
   public java.lang.String beizhu;
   
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
	public java.lang.String getLianxiren() {
		return lianxiren;
	}
	public void setLianxiren(java.lang.String lianxiren) {
		this.lianxiren = lianxiren;
	}
	public int getChengshiId() {
		return chengshiId;
	}
	public void setChengshiId(int chengshiId) {
		this.chengshiId = chengshiId;
	}
	public java.lang.String getDizhi() {
		return dizhi;
	}
	public void setDizhi(java.lang.String dizhi) {
		this.dizhi = dizhi;
	}
	public int getDianhua() {
		return dianhua;
	}
	public void setDianhua(int dianhua) {
		this.dianhua = dianhua;
	}
	public int getShouji() {
		return shouji;
	}
	public void setShouji(int shouji) {
		this.shouji = shouji;
	}
	public java.lang.String getEmail() {
		return email;
	}
	public void setEmail(java.lang.String email) {
		this.email = email;
	}
	public java.lang.String getChuanzhen() {
		return chuanzhen;
	}
	public void setChuanzhen(java.lang.String chuanzhen) {
		this.chuanzhen = chuanzhen;
	}
	public java.lang.String getWangzhi() {
		return wangzhi;
	}
	public void setWangzhi(java.lang.String wangzhi) {
		this.wangzhi = wangzhi;
	}
	public int getJiage() {
		return jiage;
	}
	public void setJiage(int jiage) {
		this.jiage = jiage;
	}
	public int getHzjbId() {
		return hzjbId;
	}
	public void setHzjbId(int hzjbId) {
		this.hzjbId = hzjbId;
	}
	public int getWhfsid() {
		return whfsid;
	}
	public void setWhfsid(int whfsid) {
		this.whfsid = whfsid;
	}
	public java.lang.String getBeizhu() {
		return beizhu;
	}
	public void setBeizhu(java.lang.String beizhu) {
		this.beizhu = beizhu;
	}

}