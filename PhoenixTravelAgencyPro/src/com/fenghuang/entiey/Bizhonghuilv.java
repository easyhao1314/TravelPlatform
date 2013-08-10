package com.fenghuang.entiey;

/***********************************************************************
 * Module:  Bizhonghuilv.java
 * Author:  Administrator
 * Purpose: Defines the Class Bizhonghuilv
 ***********************************************************************/

import java.util.*;

/** 汇率
 * 
 * @pdOid 6bee1b28-2244-4984-8c32-3f00e28d8c6f */
public class Bizhonghuilv {
   /** @pdOid 4788b8c2-62ce-40b8-9940-dcd77952e30d */
   public long id;
   /** 币种ID
    * 
    * @pdOid dfc2b683-f22b-4d8f-9288-9cb39325703c */
   public java.lang.String bizhong;
   /** 日期
    * 
    * @pdOid 99a1ab9a-73e0-4da8-bfc4-40a21569ab5b */
   public java.util.Date riqi;
   /** 现金汇率
    * 
    * @pdOid 9b84900e-16c5-4a30-8de7-ef7e3778a35a */
   public double xianjinhuilv;
   /** 对公收款/换汇汇率
    * 
    * @pdOid b6c38cf1-e56f-4747-afaa-82826610d2bf */
   public double gongshou;
   /** 中行折算价/基准价
    * 
    * @pdOid d2445907-fa38-402b-9939-78d8eb9a29e1 */
   public double zhonghang;
   /** 公司最低汇率标准
    * 
    * @pdOid 4cbcfdba-a760-4cca-a6cc-c720cc309a50 */
   public double zuidihuilv;
   /** 汇率
    * 
    * @pdOid d54cbb8d-4e21-4807-b5fe-f918f42b5c61 */
   public double huilv;
   /** 简写
    * 
    * @pdOid c96aeaaa-9db8-4b7e-bed6-fb446d3ad626 */
   public java.lang.String jianxie;
   /** 简写+全名
    * 
    * @pdOid 71ba900a-3272-4440-a7f7-0581e46b94f8 */
   public java.lang.String jianxiemingchen;
   /** 单位
    * 
    * @pdOid e9830caf-5791-4c9a-8ec3-3b9324cf46a1 */
   public double danwei;
public long getId() {
	return id;
}
public void setId(long id) {
	this.id = id;
}
public java.lang.String getBizhong() {
	return bizhong;
}
public void setBizhong(java.lang.String bizhong) {
	this.bizhong = bizhong;
}
public java.util.Date getRiqi() {
	return riqi;
}
public void setRiqi(java.util.Date riqi) {
	this.riqi = riqi;
}
public double getXianjinhuilv() {
	return xianjinhuilv;
}
public void setXianjinhuilv(double xianjinhuilv) {
	this.xianjinhuilv = xianjinhuilv;
}
public double getGongshou() {
	return gongshou;
}
public void setGongshou(double gongshou) {
	this.gongshou = gongshou;
}
public double getZhonghang() {
	return zhonghang;
}
public void setZhonghang(double zhonghang) {
	this.zhonghang = zhonghang;
}
public double getZuidihuilv() {
	return zuidihuilv;
}
public void setZuidihuilv(double zuidihuilv) {
	this.zuidihuilv = zuidihuilv;
}
public double getHuilv() {
	return huilv;
}
public void setHuilv(double huilv) {
	this.huilv = huilv;
}
public java.lang.String getJianxie() {
	return jianxie;
}
public void setJianxie(java.lang.String jianxie) {
	this.jianxie = jianxie;
}
public java.lang.String getJianxiemingchen() {
	return jianxiemingchen;
}
public void setJianxiemingchen(java.lang.String jianxiemingchen) {
	this.jianxiemingchen = jianxiemingchen;
}
public double getDanwei() {
	return danwei;
}
public void setDanwei(double danwei) {
	this.danwei = danwei;
}
   
}