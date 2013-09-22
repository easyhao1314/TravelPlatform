/***********************************************************************
 * Module:  Dingche.java
 * Author:  Administrator
 * Purpose: Defines the Class Dingche
 ***********************************************************************/
package com.fenghuang.entiey;
import java.util.*;

/** 订车表
 * 
 * @pdOid af950bac-5a66-4161-b682-9e459340fc35 */
public class Dingche {
   /** @pdOid 16703cdd-ef0a-48b3-9b53-8fc3c5784614 */
   public long id;
   /** 车名
    * 
    * @pdOid 35fa6703-10f4-4d94-9f67-937af7a4f024 */
   public java.lang.String cheName;
   /** 车信息
    * 
    * @pdOid 625b816d-40e1-4ae5-8de4-c217ebee5171 */
   public java.lang.String chexinxi;
   /** 车牌号
    * 
    * @pdOid 7b918738-25a9-4ab4-8329-5f7b60cf70ed */
   public java.lang.String chepaihao;
   /** 司机
    * 
    * @pdOid a98ec72c-d193-496f-b062-7041c00addac */
   public java.lang.String siji;
   /** 司机导游是否
    * 
    * @pdOid 765bacfd-4600-4d98-aae8-6b76db7e8031 */
   public int sidao;
   /** 座位数
    * 
    * @pdOid d3db9c20-5208-4082-8f03-ff7e1823fa85 */
   public int zuoweishu;
   /** 价格
    * 
    * @pdOid f1411229-d317-4ecd-8754-94e3f9ff6670 */
   public float jiage;
   /** 供应商
    * 
    * @pdOid f1411229-d317-4ecd-8754-94e3f9ff6670 */
   private int gongyingshang;
   
   
public int getGongyingshang() {
	return gongyingshang;
}
public void setGongyingshang(int gongyingshang) {
	this.gongyingshang = gongyingshang;
}
public long getId() {
	return id;
}
public void setId(long id) {
	this.id = id;
}
public java.lang.String getCheName() {
	return cheName;
}
public void setCheName(java.lang.String cheName) {
	this.cheName = cheName;
}
public java.lang.String getChexinxi() {
	return chexinxi;
}
public void setChexinxi(java.lang.String chexinxi) {
	this.chexinxi = chexinxi;
}
public java.lang.String getChepaihao() {
	return chepaihao;
}
public void setChepaihao(java.lang.String chepaihao) {
	this.chepaihao = chepaihao;
}
public java.lang.String getSiji() {
	return siji;
}
public void setSiji(java.lang.String siji) {
	this.siji = siji;
}
public int getSidao() {
	return sidao;
}
public void setSidao(int sidao) {
	this.sidao = sidao;
}
public int getZuoweishu() {
	return zuoweishu;
}
public void setZuoweishu(int zuoweishu) {
	this.zuoweishu = zuoweishu;
}
public float getJiage() {
	return jiage;
}
public void setJiage(float jiage) {
	this.jiage = jiage;
}
   
   
   
   
   
}