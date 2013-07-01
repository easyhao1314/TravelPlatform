/***********************************************************************
 * Module:  Yaoqinghan.java
 * Author:  Administrator
 * Purpose: Defines the Class Yaoqinghan
 ***********************************************************************/
package com.fenghuang.entiey;
import java.util.*;

/** 邀请函成本维护
 * 
 * @pdOid d47299e1-6d59-42d0-995f-585028583def */
public class Yaoqinghan {
   /** 编号
    * 
    * @pdOid 23550bb8-4a6d-4af5-b0e2-bcaf402f0a9d */
   public long id;
   /** 国度（国家）
    * 
    * @pdOid 629b868e-1a66-43db-bcd2-381a331b3254 */
   public int guoduid;
   /** 描述
    * 
    * @pdOid cb244d39-9dec-4f8a-8c32-938885c36a50 */
   public java.lang.String miaoshu;
   /** 成本
    * 
    * @pdOid ee61a2f9-6f11-4bdf-9ed9-c68b7d511fd8 */
   public java.lang.String chengben;
   /** 币种
    * 
    * @pdOid 9ae1f047-51d6-450a-80dc-088cd6264b12 */
   public int bizhongId;
   /** 是否使用
    * 
    * @pdOid 2dd6e0f1-aed2-4c98-b3b8-d89b6231f4bc */
   public int shiyongid;
public long getId() {
	return id;
}
public void setId(long id) {
	this.id = id;
}
public int getGuoduid() {
	return guoduid;
}
public void setGuoduid(int guoduid) {
	this.guoduid = guoduid;
}
public java.lang.String getMiaoshu() {
	return miaoshu;
}
public void setMiaoshu(java.lang.String miaoshu) {
	this.miaoshu = miaoshu;
}
public java.lang.String getChengben() {
	return chengben;
}
public void setChengben(java.lang.String chengben) {
	this.chengben = chengben;
}
public int getBizhongId() {
	return bizhongId;
}
public void setBizhongId(int bizhongId) {
	this.bizhongId = bizhongId;
}
public int getShiyongid() {
	return shiyongid;
}
public void setShiyongid(int shiyongid) {
	this.shiyongid = shiyongid;
}
   

}