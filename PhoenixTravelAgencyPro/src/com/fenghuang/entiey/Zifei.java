/***********************************************************************
 * Module:  Zifei.java
 * Author:  Administrator
 * Purpose: Defines the Class Zifei
 ***********************************************************************/
package com.fenghuang.entiey;
import java.util.*;

/** 自费
 * 
 * @pdOid 8e671e26-67a1-4aab-b072-78d32cce1d55 */
public class Zifei {
   /** 编号
    * 
    * @pdOid 56ad8dd3-9183-4674-a611-244aba6c62e3 */
   public long id;
   /** 自费节目名称
    * 
    * @pdOid f1e9fbbc-0a1e-464b-8a37-6196b5335a87 */
   public java.lang.String name;
   /** 费用
    * 
    * @pdOid a0d6660d-187f-4a05-a24a-172e352b61a0 */
   public int feiyong;
   /** 币种
    * 
    * @pdOid afc95faf-ccec-4f41-ab85-da5f43337a2f */
   public int bizhongId;
   /** 所属城市
    * 
    * @pdOid 5aea8d74-d8fd-41a6-9883-303c8ef756cf */
   public int chengshiId;
   /** 开放时间起
    * 
    * @pdOid d431a027-7104-4904-9d4d-1e069a99b78a */
   public java.lang.String kftimeqi;
   /** 开放时间止
    * 
    * @pdOid ced8c239-b4a3-42d9-80a6-1f6fa53f1739 */
   public java.lang.String kftimezhi;
   /** 时间是否可变
    * 
    * @pdOid 513691bb-1415-4294-be6d-63f3c947360e */
   public int timekb;
   /** 时间地接安排
    * 
    * @pdOid 3adc4601-e6dc-4864-87af-d3c51b92eef5 */
   public int djaptime;
   /** 描述
    * 
    * @pdOid 3adc4601-e6dc-4864-87af-d3c51b92eef5 */
   public java.lang.String miaoshu;
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
public int getFeiyong() {
	return feiyong;
}
public void setFeiyong(int feiyong) {
	this.feiyong = feiyong;
}
public int getBizhongId() {
	return bizhongId;
}
public void setBizhongId(int bizhongId) {
	this.bizhongId = bizhongId;
}
public int getChengshiId() {
	return chengshiId;
}
public void setChengshiId(int chengshiId) {
	this.chengshiId = chengshiId;
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
public int getDjaptime() {
	return djaptime;
}
public void setDjaptime(int djaptime) {
	this.djaptime = djaptime;
}
public java.lang.String getMiaoshu() {
	return miaoshu;
}
public void setMiaoshu(java.lang.String miaoshu) {
	this.miaoshu = miaoshu;
}
   
   

}