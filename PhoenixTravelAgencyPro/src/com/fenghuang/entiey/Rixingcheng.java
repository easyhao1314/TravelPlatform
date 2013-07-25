/***********************************************************************
 * Module:  Rixingcheng.java
 * Author:  Administrator
 * Purpose: Defines the Class Rixingcheng
 ***********************************************************************/
package com.fenghuang.entiey;
import java.util.*;

/** 日行程库维护
 * 
 * @pdOid f0e37b7a-1475-4689-893d-2f98817a8f15 */
public class Rixingcheng {
   /** 编号
    * 
    * @pdOid 4afc04ab-fe8f-4305-81fb-035333085084 */
   public int id;
   /** 日程安排
    * 
    * @pdOid 1518adb4-46a7-4af9-ab4f-8736986b80e0 */
   public java.lang.String richenganpai;
   /** 途径城市id
    * 
    * @pdOid 399a3263-6a38-4a43-9a16-d6cf9dda815b */
   public long tujingchengshiid;
   /** 是否采用
    * 
    * @pdOid 16d61e10-91d6-4407-bd4e-53368d6925bb */
   public int caiyong;
   /** 默认安排 
    * 
    * @pdOid 1035816c-5c55-4da0-9777-8b24af21cc2a */
   public int moren;
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public java.lang.String getRichenganpai() {
	return richenganpai;
}
public void setRichenganpai(java.lang.String richenganpai) {
	this.richenganpai = richenganpai;
}
public long getTujingchengshiid() {
	return tujingchengshiid;
}
public void setTujingchengshiid(long tujingchengshiid) {
	this.tujingchengshiid = tujingchengshiid;
}
public int getCaiyong() {
	return caiyong;
}
public void setCaiyong(int caiyong) {
	this.caiyong = caiyong;
}
public int getMoren() {
	return moren;
}
public void setMoren(int moren) {
	this.moren = moren;
}

}