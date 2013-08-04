package com.fenghuang.entiey;

/***********************************************************************
 * Module:  Bizhonghuilv.java
 * Author:  Administrator
 * Purpose: Defines the Class Bizhonghuilv
 ***********************************************************************/

import java.util.*;

/** 汇率
 * 
 * @pdOid 0d5b618b-4d58-4aed-b8af-0f8aa2cffcdf */
public class Bizhonghuilv {
   /** @pdOid f54dc3dd-6fa0-47f5-b0db-a84dbc8372f7 */
   public long id;
   /** 币种ID
    * 
    * @pdOid 26629f54-cdc7-4a7f-8b33-3c1167ae291d */
   public java.lang.String bizhong;
   /** 日期
    * 
    * @pdOid bcaac160-32a7-4568-9ea5-2d14c3983b9c */
   public java.util.Date riqi;
   /** 现金汇率
    * 
    * @pdOid fafad420-85cb-4052-afd5-2edcaec9d236 */
   public double xianjinhuilv;
   /** 对公收款/换汇汇率
    * 
    * @pdOid 878161c9-2911-43fd-8564-1ad1fd08dfcf */
   public double gongshou;
   /** 中行折算价/基准价
    * 
    * @pdOid 7e760b88-8fa1-475e-b23a-c06df9f8ef69 */
   public double zhonghang;
   /** 公司最低汇率标准
    * 
    * @pdOid ac17f87a-d24f-48e2-97a4-1f9335989799 */
   public double zuidihuilv;
   /** 汇率
    * 
    * @pdOid 6d86ac5b-c242-41de-9bab-b9fba3888fda */
   public double huilv;
   /** 简写
    * 
    * @pdOid 04e4ba81-5508-4682-a26f-65e752833d31 */
   public java.lang.String jianxie;
   /** 简写+全名
    * 
    * @pdOid 98935a81-4927-48f8-8bbe-ee22391fe32e */
   public java.lang.String jianxiemingchen;
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
   

}