/***********************************************************************
 * Module:  Richeng.java
 * Author:  Administrator
 * Purpose: Defines the Class Richeng
 ***********************************************************************/
package com.fenghuang.entiey;
import java.util.*;

/** 日行程
 * 
 * @pdOid 39735ae7-5d8e-4ec1-b52a-08a04d071f2b */
public class Richeng {
   /** 日行程ID
    * 
    * @pdOid 025a20ab-d34d-4926-8225-820860f9b943 */
   public long riid;
   /** 日程安排
    * 
    * @pdOid 0e367b58-50ad-42b3-bd5b-32960b588396 */
   public java.lang.String richenganpai;
   /** 日程活动
    * 
    * @pdOid 8f35db3e-4f34-46a3-b352-383fd4be0184 */
   public java.lang.String huodong;
   /** 酒店
    * 
    * @pdOid 59c44143-737a-4d49-b9bf-6637108d63e1 */
   public String jiudian;
   /** 城市ID
    * 
    * @pdOid a2437159-5443-4566-934e-721672d70dba */
   public long chengshiid;
   /** 交通
    * 
    * @pdOid 7d11fe38-4527-4178-a719-f99efead3f33 */
   public long jiaotong;
   /** 早餐
    * 
    * @pdOid d8088698-e0e0-4d85-9cf2-14670e08f6a9 */
   public String zao;
   /** 中餐
    * 
    * @pdOid 16c150d1-2eb2-43b5-b3d5-fec7a783d862 */
   public String zhong;
   /** 晚餐
    * 
    * @pdOid 0af04793-416f-448f-9b2c-e1839164b5c6 */
   public String wan;
   /** 线路id
    * 
    * @pdOid 0af04793-416f-448f-9b2c-e1839164b5c6 */
   public long xianluid;
   /** 交通城市
    * 
    * @pdOid 7dcf0cd9-ff93-4c27-8014-de4a278b58b1 */
   public java.lang.String jiaotongchengshi;
   /** 车ID
    * 
    * @pdOid 7dcf0cd9-ff93-4c27-8014-de4a278b58b1 */
   private int cheid;
   /** 购物ID
    * 
    * @pdOid 7dcf0cd9-ff93-4c27-8014-de4a278b58b1 */
   private int gouwuid;
   
public int getCheid() {
	return cheid;
}
public void setCheid(int cheid) {
	this.cheid = cheid;
}
public int getGouwuid() {
	return gouwuid;
}
public void setGouwuid(int gouwuid) {
	this.gouwuid = gouwuid;
}
public java.lang.String getJiaotongchengshi() {
	return jiaotongchengshi;
}
public void setJiaotongchengshi(java.lang.String jiaotongchengshi) {
	this.jiaotongchengshi = jiaotongchengshi;
}
public long getXianluid() {
	return xianluid;
}
public void setXianluid(long xianluid) {
	this.xianluid = xianluid;
}
public long getRiid() {
	return riid;
}
public void setRiid(long riid) {
	this.riid = riid;
}
public java.lang.String getRichenganpai() {
	return richenganpai;
}
public void setRichenganpai(java.lang.String richenganpai) {
	this.richenganpai = richenganpai;
}
public java.lang.String getHuodong() {
	return huodong;
}
public void setHuodong(java.lang.String huodong) {
	this.huodong = huodong;
}

public long getChengshiid() {
	return chengshiid;
}
public void setChengshiid(long chengshiid) {
	this.chengshiid = chengshiid;
}
public long getJiaotong() {
	return jiaotong;
}
public void setJiaotong(long jiaotong) {
	this.jiaotong = jiaotong;
}
public String getJiudian() {
	return jiudian;
}
public void setJiudian(String jiudian) {
	this.jiudian = jiudian;
}
public String getZao() {
	return zao;
}
public void setZao(String zao) {
	this.zao = zao;
}
public String getZhong() {
	return zhong;
}
public void setZhong(String zhong) {
	this.zhong = zhong;
}
public String getWan() {
	return wan;
}
public void setWan(String wan) {
	this.wan = wan;
}


}