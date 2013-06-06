/***********************************************************************
 * Module:  HotleStardictionary.java
 * Author:  baoguohao
 * Purpose: Defines the Class HotleStardictionary
 ***********************************************************************/
package com.fenghuang.entiey;
import java.util.*;

/** 酒店-星级字典维护
 * 
 * @pdOid ccc5e623-8ede-4d75-a7c8-d0e82aa1e7d1 */
public class HotleStardictionary {
   /** 编号
    * 
    * @pdOid 729b832d-97b9-47bd-957e-d335a9044eb9 */
   public String hsdNo;
   /**
 * @return the hsdNo
 */
public String getHsdNo() {
	return hsdNo;
}
/**
 * @param hsdNo the hsdNo to set
 */
public void setHsdNo(String hsdNo) {
	this.hsdNo = hsdNo;
}
/**
 * @return the hsbName
 */
public String getHsbName() {
	return hsbName;
}
/**
 * @param hsbName the hsbName to set
 */
public void setHsbName(String hsbName) {
	this.hsbName = hsbName;
}
/**
 * @return the hsbDesc
 */
public String getHsbDesc() {
	return hsbDesc;
}
/**
 * @param hsbDesc the hsbDesc to set
 */
public void setHsbDesc(String hsbDesc) {
	this.hsbDesc = hsbDesc;
}
/**
 * @return the hsbHelp
 */
public String getHsbHelp() {
	return hsbHelp;
}
/**
 * @param hsbHelp the hsbHelp to set
 */
public void setHsbHelp(String hsbHelp) {
	this.hsbHelp = hsbHelp;
}
/**
 * @return the hsbSortNo
 */
public long getHsbSortNo() {
	return hsbSortNo;
}
/**
 * @param hsbSortNo the hsbSortNo to set
 */
public void setHsbSortNo(long hsbSortNo) {
	this.hsbSortNo = hsbSortNo;
}
/** 名称
    * 
    * @pdOid b7760d78-b0bc-4b22-88aa-f87868cfe929 */
   public String hsbName;
   /** @pdOid fa170113-9cc4-467b-9b0d-3644cafbbf42 */
   public String hsbDesc;
   /** @pdOid 756cb2f3-74cf-404a-9cd9-66739df168ee */
   public String hsbHelp;
   /** 显示循序
    * 
    * @pdOid 0066ec83-adc1-48eb-9cb9-837d75492b07 */
   public long hsbSortNo;

}