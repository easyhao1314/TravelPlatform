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
   public long jiudian;
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
   public long zao;
   /** 中餐
    * 
    * @pdOid 16c150d1-2eb2-43b5-b3d5-fec7a783d862 */
   public long zhong;
   /** 晚餐
    * 
    * @pdOid 0af04793-416f-448f-9b2c-e1839164b5c6 */
   public long wan;
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
public long getJiudian() {
	return jiudian;
}
public void setJiudian(long jiudian) {
	this.jiudian = jiudian;
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
public long getZao() {
	return zao;
}
public void setZao(long zao) {
	this.zao = zao;
}
public long getZhong() {
	return zhong;
}
public void setZhong(long zhong) {
	this.zhong = zhong;
}
public long getWan() {
	return wan;
}
public void setWan(long wan) {
	this.wan = wan;
}

}