/***********************************************************************
 * Module:  HotelGuestRoomDictionary.java
 * Author:  baoguohao
 * Purpose: Defines the Class HotelGuestRoomDictionary
 ***********************************************************************/
package com.fenghuang.entiey;
import java.util.*;

/** 酒店-客户房型维护
 * 
 * @pdOid ae9b355f-4d72-4606-b652-ca07644656bc */
public class HotelGuestRoomDictionary {
   /** 主键，自动增长
    * 
    * @pdOid 6d8dbea8-82f5-4c6d-ad0d-d7035a99e384 */
   public long id;
   /** 项名
    * 
    * @pdOid 89152649-9ab4-485a-888b-e6c4116377e1 */
   public String hgrdName;
   /** 输出语义
    * 
    * @pdOid 0e618aee-6448-46ac-8504-478f7675905e */
   public String hgrdPrint;
   /** 使用说明
    * 
    * @pdOid 8ac88d3b-6565-45ea-a818-eb718d57a7aa */
   public String hgrdDesc;
/**
 * @return the id
 */
public long getId() {
	return id;
}
/**
 * @param id the id to set
 */
public void setId(long id) {
	this.id = id;
}
/**
 * @return the hgrdName
 */
public String getHgrdName() {
	return hgrdName;
}
/**
 * @param hgrdName the hgrdName to set
 */
public void setHgrdName(String hgrdName) {
	this.hgrdName = hgrdName;
}
/**
 * @return the hgrdPrint
 */
public String getHgrdPrint() {
	return hgrdPrint;
}
/**
 * @param hgrdPrint the hgrdPrint to set
 */
public void setHgrdPrint(String hgrdPrint) {
	this.hgrdPrint = hgrdPrint;
}
/**
 * @return the hgrdDesc
 */
public String getHgrdDesc() {
	return hgrdDesc;
}
/**
 * @param hgrdDesc the hgrdDesc to set
 */
public void setHgrdDesc(String hgrdDesc) {
	this.hgrdDesc = hgrdDesc;
}
   
   

}