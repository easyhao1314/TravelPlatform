/***********************************************************************
 * Module:  Xianlu.java
 * Author:  Administrator
 * Purpose: Defines the Class Xianlu
 ***********************************************************************/
package com.fenghuang.entiey;
import java.util.*;

/** 线路行程
 * 
 * @pdOid 2e44a65e-ddc4-421d-a3e3-ace0008750e7 */
public class Xianlu {
   /** 线路ID自增
    * 
    * @pdOid 09b6b4dc-2701-4374-9fba-21ccc56ee2f2 */
   public long xianid;
   /** 线路名称
    * 
    * @pdOid ef19c64c-e145-432e-afb4-950ec4e30c37 */
   public java.lang.String xianluname;
   /** 全程天数
    * 
    * @pdOid e48efdd8-39cf-4302-9fda-02502e71f7f1 */
   public int tianshu;
   /** 旅游国家数
    * 
    * @pdOid 22e6576d-6a3d-49e1-b96d-02f352342c7d */
   public int guojia;
   /** 维护人
    * 
    * @pdOid 666d8278-f875-4d84-b579-06d30c61e1b1 */
   public long weihuren;
   /** 是否属于行程库
    * 
    * @pdOid 666d8278-f875-4d84-b579-06d30c61e1b1 */
   public int xingchengku;
   
public int getXingchengku() {
	return xingchengku;
}
public void setXingchengku(int xingchengku) {
	this.xingchengku = xingchengku;
}
public long getXianid() {
	return xianid;
}
public void setXianid(long xianid) {
	this.xianid = xianid;
}
public java.lang.String getXianluname() {
	return xianluname;
}
public void setXianluname(java.lang.String xianluname) {
	this.xianluname = xianluname;
}
public int getTianshu() {
	return tianshu;
}
public void setTianshu(int tianshu) {
	this.tianshu = tianshu;
}
public int getGuojia() {
	return guojia;
}
public void setGuojia(int guojia) {
	this.guojia = guojia;
}
public long getWeihuren() {
	return weihuren;
}
public void setWeihuren(long weihuren) {
	this.weihuren = weihuren;
}
   
}