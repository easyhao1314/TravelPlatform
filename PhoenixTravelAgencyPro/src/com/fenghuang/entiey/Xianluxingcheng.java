/***********************************************************************
 * Module:  Xianluxingcheng.java
 * Author:  Administrator
 * Purpose: Defines the Class Xianluxingcheng
 ***********************************************************************/
package com.fenghuang.entiey;
import java.util.*;

/** 线路/行程库维护
 * 
 * @pdOid 82a60975-b19a-4bac-92b2-89ac22ee1837 */
public class Xianluxingcheng {
   /** 编号
    * 
    * @pdOid f90890fa-f617-430e-9369-f0e6bf2de838 */
   public int id;
   /** 线路名称
    * 
    * @pdOid 0f0beeb8-3b0c-4c53-bf95-8d2f873dbaae */
   public java.lang.String name;
   /** 全程天数
    * 
    * @pdOid dd07bf75-e4b4-40c0-878a-07cfe5121d65 */
   public int tianshu;
   /** 旅游国家数
    * 
    * @pdOid 20425460-1a03-4898-b393-24153a53aa12 */
   public int guojiashu;
   /** 出境城市（出境城市id）
    * 
    * @pdOid 355c8ff4-0684-4b2c-b4d5-6b88236fcfaf */
   public long chujingchengshiid;
   /** 入境城市
    * 
    * @pdOid 5a8a80fd-5678-44c9-8a0c-fde04654dcda */
   public long rujingchengshiid;
   /** 是否经典
    * 
    * @pdOid f66c55dd-7624-459f-b954-7dd7127609f6 */
   public int jingdian;
   /** 维护人（维护人ID）
    * 
    * @pdOid 1268d78e-3a9d-467d-995a-4f8e27165c14 */
   public long weihuren;
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public java.lang.String getName() {
	return name;
}
public void setName(java.lang.String name) {
	this.name = name;
}
public int getTianshu() {
	return tianshu;
}
public void setTianshu(int tianshu) {
	this.tianshu = tianshu;
}
public int getGuojiashu() {
	return guojiashu;
}
public void setGuojiashu(int guojiashu) {
	this.guojiashu = guojiashu;
}
public long getChujingchengshiid() {
	return chujingchengshiid;
}
public void setChujingchengshiid(long chujingchengshiid) {
	this.chujingchengshiid = chujingchengshiid;
}
public long getRujingchengshiid() {
	return rujingchengshiid;
}
public void setRujingchengshiid(long rujingchengshiid) {
	this.rujingchengshiid = rujingchengshiid;
}
public int getJingdian() {
	return jingdian;
}
public void setJingdian(int jingdian) {
	this.jingdian = jingdian;
}
public long getWeihuren() {
	return weihuren;
}
public void setWeihuren(long weihuren) {
	this.weihuren = weihuren;
}

}