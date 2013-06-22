/***********************************************************************
 * Module:  DantuanXinXi.java
 * Author:  baoguohao
 * Purpose: Defines the Class DantuanXinXi
 ***********************************************************************/
package com.fenghuang.entiey;
import java.util.*;

/** 单团信息
 * 
 * @pdOid 4adc4617-8aa9-449d-8b19-64154b8f1af3 */
public class DantuanXinXi {
   /** 团号，根据给定的字符串产生的
    * 
    * @pdOid 856cc23c-2324-49ee-b408-7c734c146607 */
   public String tuanNO;
   /** 客户id
    * 
    * @pdOid 2fb605b8-f6fc-4c1f-8ee6-0b1c4d707b3f */
   public long khId;
   /** 团队操作类型
    * 
    * @pdOid 722dd21c-e17a-48a8-95ce-54ce993ffb85 */
   public String tdczlx;
   /** 团名
    * 
    * @pdOid b3c6f6c1-c320-4617-ae3d-10501f37221d */
   public String tdm;
   /** 团队级别
    * 
    * @pdOid 83da6d02-4ea2-449e-b693-922ac5a2efba */
   public String tdjb;
   /** 团队状态
    * 
    * @pdOid fbb457ec-586e-4058-8b9e-bf4fc6d2e1f5 */
   public String tdzt;
   /** 出访人数
    * 
    * @pdOid 59d73507-f470-45b7-a04b-e967f97d21bf */
   public long cfrs;
   /** 出访天数
    * 
    * @pdOid 2bde53f8-23d8-44a0-89a6-92ae2f0de01e */
   public long cfts;
   /** 出访国家
    * 
    * @pdOid e4cf384d-e594-4539-93f1-dcd0de47db46 */
   public String cfgj;
   /** 旅游区域
    * 
    * @pdOid 3fd0bda7-43a7-4b50-983f-388ff5244ec5 */
   public long lyqy;
   /** 出团时间
    * 
    * @pdOid 7e664b93-3281-4880-93da-b5d3567fe609 */
   public java.util.Date ctsj;
   /** 回团时间
    * 
    * @pdOid 5112f260-3e66-4220-868b-24642112a10d */
   public java.util.Date htsj;
   /** 销售编号
    * 
    * @pdOid 66a1f42d-d6b6-473f-b581-1ee23ff9b4e2 */
   public String xsNo;
   /** 计调编号
    * 
    * @pdOid 8319d29e-a36d-4fdc-996f-930cf3ee13cd */
   public String jdNo;
   /** 客户经理编号
    * 
    * @pdOid 0ca5490d-bdf6-4561-98d5-6e45d7e83e8e */
   public String khjlNo;
   /** 签证类型，这个是在字典中
    * 
    * @pdOid e9ab1ff4-ed58-409d-8620-23643357737b */
   public String qzlx;
   /** 需办签证
    * 
    * @pdOid 2fdbcc32-ffb4-434c-b5c6-ecc650a7d01c */
   public String xbqz;
   /** 需办邀请
    * 
    * @pdOid 217c5d3c-74fe-46ac-bb08-7ba6d5b05831 */
   public String xbyq;
   /** 酒店标准，在字段中
    * 
    * @pdOid 86f73f99-a8ec-4ef2-a66e-836f24b8c111 */
   public String jdbzNo;
   /** 早餐标准，在字典中
    * 
    * @pdOid 7bcd84c0-01ce-4983-9f10-2c09a59d9a3d */
   public String zcNo;
   /** 中餐标准，在字段中
    * 
    * @pdOid 22ef5535-6f62-407b-82d9-2c1a95b4e9ba */
   public String zhongcNo;
   /** 晚餐标准
    * 
    * @pdOid 20661436-5244-4fdd-a2ac-cc5e84134922 */
   public String wcNo;
   /** 巴士司导
    * 
    * @pdOid fe5f32a1-3d3f-4ecc-bd7d-b6c9cbcbf7db */
   public String bssdNo;
   /** 车型
    * 
    * @pdOid f5e3ccd7-6742-448f-82ea-29ba3a2ec143 */
   public String cheXingNo;
   /** 酒店报价标准,在字段中
    * 
    * @pdOid 3337aa1f-3674-4545-9c63-2ff3517103a0 */
   public String jdbjNo;
   /** 巴士报价标准，在字段中
    * 
    * @pdOid a72b5f91-412e-4bae-a338-5552ce7695a6 */
   public String bsbjNo;
   /** 用餐报价标准,在字段中
    * 
    * @pdOid ff1eb850-df71-413a-a022-6c37300b59b6 */
   public String ycbjNo;
   /** 导游报价标准，在字典中
    * 
    * @pdOid 11478424-24d0-4e06-a67f-23e8c0fdf5da */
   public String dybjNo;
   /** 其他地接要求
    * 
    * @pdOid 1f695c9c-d956-4813-aa08-8782e75bdbcc */
   public String qtdjDesc;
   /** 特殊要求
    * 
    * @pdOid 69d03899-9779-487e-9b0c-94d6c40ab15e */
   public String tsDesc;
   /** 审批状态
    * 
    * @pdOid 69d03899-9779-487e-9b0c-94d6c40ab15e */
   public boolean shenpi;
   /**
    * @return the tuanNO
    */
   public boolean getShenpi() {
   	return shenpi;
   }
   /**
    * @param tuanNO the tuanNO to set
    */
   public void setShenpi(boolean shenpi) {
   	this.shenpi = shenpi;
   }
   
/**
 * @return the tuanNO
 */
public String getTuanNO() {
	return tuanNO;
}
/**
 * @param tuanNO the tuanNO to set
 */
public void setTuanNO(String tuanNO) {
	this.tuanNO = tuanNO;
}
/**
 * @return the khId
 */
public long getKhId() {
	return khId;
}
/**
 * @param khId the khId to set
 */
public void setKhId(long khId) {
	this.khId = khId;
}
/**
 * @return the tdczlx
 */
public String getTdczlx() {
	return tdczlx;
}
/**
 * @param tdczlx the tdczlx to set
 */
public void setTdczlx(String tdczlx) {
	this.tdczlx = tdczlx;
}
/**
 * @return the tdm
 */
public String getTdm() {
	return tdm;
}
/**
 * @param tdm the tdm to set
 */
public void setTdm(String tdm) {
	this.tdm = tdm;
}
/**
 * @return the tdjb
 */
public String getTdjb() {
	return tdjb;
}
/**
 * @param tdjb the tdjb to set
 */
public void setTdjb(String tdjb) {
	this.tdjb = tdjb;
}
/**
 * @return the tdzt
 */
public String getTdzt() {
	return tdzt;
}
/**
 * @param tdzt the tdzt to set
 */
public void setTdzt(String tdzt) {
	this.tdzt = tdzt;
}
/**
 * @return the cfrs
 */
public long getCfrs() {
	return cfrs;
}
/**
 * @param cfrs the cfrs to set
 */
public void setCfrs(long cfrs) {
	this.cfrs = cfrs;
}
/**
 * @return the cfts
 */
public long getCfts() {
	return cfts;
}
/**
 * @param cfts the cfts to set
 */
public void setCfts(long cfts) {
	this.cfts = cfts;
}
/**
 * @return the cfgj
 */
public String getCfgj() {
	return cfgj;
}
/**
 * @param cfgj the cfgj to set
 */
public void setCfgj(String cfgj) {
	this.cfgj = cfgj;
}
/**
 * @return the lyqy
 */
public long getLyqy() {
	return lyqy;
}
/**
 * @param lyqy the lyqy to set
 */
public void setLyqy(long lyqy) {
	this.lyqy = lyqy;
}
/**
 * @return the ctsj
 */
public java.util.Date getCtsj() {
	return ctsj;
}
/**
 * @param ctsj the ctsj to set
 */
public void setCtsj(java.util.Date ctsj) {
	this.ctsj = ctsj;
}
/**
 * @return the htsj
 */
public java.util.Date getHtsj() {
	return htsj;
}
/**
 * @param htsj the htsj to set
 */
public void setHtsj(java.util.Date htsj) {
	this.htsj = htsj;
}
/**
 * @return the xsNo
 */
public String getXsNo() {
	return xsNo;
}
/**
 * @param xsNo the xsNo to set
 */
public void setXsNo(String xsNo) {
	this.xsNo = xsNo;
}
/**
 * @return the jdNo
 */
public String getJdNo() {
	return jdNo;
}
/**
 * @param jdNo the jdNo to set
 */
public void setJdNo(String jdNo) {
	this.jdNo = jdNo;
}
/**
 * @return the khjlNo
 */
public String getKhjlNo() {
	return khjlNo;
}
/**
 * @param khjlNo the khjlNo to set
 */
public void setKhjlNo(String khjlNo) {
	this.khjlNo = khjlNo;
}
/**
 * @return the qzlx
 */
public String getQzlx() {
	return qzlx;
}
/**
 * @param qzlx the qzlx to set
 */
public void setQzlx(String qzlx) {
	this.qzlx = qzlx;
}
/**
 * @return the xbqz
 */
public String getXbqz() {
	return xbqz;
}
/**
 * @param xbqz the xbqz to set
 */
public void setXbqz(String xbqz) {
	this.xbqz = xbqz;
}
/**
 * @return the xbyq
 */
public String getXbyq() {
	return xbyq;
}
/**
 * @param xbyq the xbyq to set
 */
public void setXbyq(String xbyq) {
	this.xbyq = xbyq;
}
/**
 * @return the jdbzNo
 */
public String getJdbzNo() {
	return jdbzNo;
}
/**
 * @param jdbzNo the jdbzNo to set
 */
public void setJdbzNo(String jdbzNo) {
	this.jdbzNo = jdbzNo;
}
/**
 * @return the zcNo
 */
public String getZcNo() {
	return zcNo;
}
/**
 * @param zcNo the zcNo to set
 */
public void setZcNo(String zcNo) {
	this.zcNo = zcNo;
}
/**
 * @return the zhongcNo
 */
public String getZhongcNo() {
	return zhongcNo;
}
/**
 * @param zhongcNo the zhongcNo to set
 */
public void setZhongcNo(String zhongcNo) {
	this.zhongcNo = zhongcNo;
}
/**
 * @return the wcNo
 */
public String getWcNo() {
	return wcNo;
}
/**
 * @param wcNo the wcNo to set
 */
public void setWcNo(String wcNo) {
	this.wcNo = wcNo;
}
/**
 * @return the bssdNo
 */
public String getBssdNo() {
	return bssdNo;
}
/**
 * @param bssdNo the bssdNo to set
 */
public void setBssdNo(String bssdNo) {
	this.bssdNo = bssdNo;
}
/**
 * @return the cheXingNo
 */
public String getCheXingNo() {
	return cheXingNo;
}
/**
 * @param cheXingNo the cheXingNo to set
 */
public void setCheXingNo(String cheXingNo) {
	this.cheXingNo = cheXingNo;
}
/**
 * @return the jdbjNo
 */
public String getJdbjNo() {
	return jdbjNo;
}
/**
 * @param jdbjNo the jdbjNo to set
 */
public void setJdbjNo(String jdbjNo) {
	this.jdbjNo = jdbjNo;
}
/**
 * @return the bsbjNo
 */
public String getBsbjNo() {
	return bsbjNo;
}
/**
 * @param bsbjNo the bsbjNo to set
 */
public void setBsbjNo(String bsbjNo) {
	this.bsbjNo = bsbjNo;
}
/**
 * @return the ycbjNo
 */
public String getYcbjNo() {
	return ycbjNo;
}
/**
 * @param ycbjNo the ycbjNo to set
 */
public void setYcbjNo(String ycbjNo) {
	this.ycbjNo = ycbjNo;
}
/**
 * @return the dybjNo
 */
public String getDybjNo() {
	return dybjNo;
}
/**
 * @param dybjNo the dybjNo to set
 */
public void setDybjNo(String dybjNo) {
	this.dybjNo = dybjNo;
}
/**
 * @return the qtdjDesc
 */
public String getQtdjDesc() {
	return qtdjDesc;
}
/**
 * @param qtdjDesc the qtdjDesc to set
 */
public void setQtdjDesc(String qtdjDesc) {
	this.qtdjDesc = qtdjDesc;
}
/**
 * @return the tsDesc
 */
public String getTsDesc() {
	return tsDesc;
}
/**
 * @param tsDesc the tsDesc to set
 */
public void setTsDesc(String tsDesc) {
	this.tsDesc = tsDesc;
}
   

}