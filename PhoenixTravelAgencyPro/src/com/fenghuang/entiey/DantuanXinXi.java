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
   /** 团队名称
    * 
    * @pdOid 856cc23c-2324-49ee-b408-7c734c146607 */
   public String tuanName;
   /** 客户id
    * 
    * @pdOid 2fb605b8-f6fc-4c1f-8ee6-0b1c4d707b3f */
   public long khId;
   /** 团队操作类型
    * 
    * @pdOid 722dd21c-e17a-48a8-95ce-54ce993ffb85 */
   public long tdczlx;

   /** 团队级别
    * 
    * @pdOid 83da6d02-4ea2-449e-b693-922ac5a2efba */
   public long tdjb;
   /** 团队状态
    * 
    * @pdOid fbb457ec-586e-4058-8b9e-bf4fc6d2e1f5 */
   public long tdzt;
   /** 出访人数
    * 
    * @pdOid 59d73507-f470-45b7-a04b-e967f97d21bf */
   public int cfrs;
   /** 出访天数
    * 
    * @pdOid 2bde53f8-23d8-44a0-89a6-92ae2f0de01e */
   public int cfts;
   /** 出访国家
    * 
    * @pdOid e4cf384d-e594-4539-93f1-dcd0de47db46 */
   public long cfgj;
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
   public long xsNo;
   /** 计调编号
    * 
    * @pdOid 8319d29e-a36d-4fdc-996f-930cf3ee13cd */
   public long jdNo;
   /** 客户经理编号
    * 
    * @pdOid 0ca5490d-bdf6-4561-98d5-6e45d7e83e8e */
   public long khjlNo;
   /** 签证类型，这个是在字典中
    * 
    * @pdOid e9ab1ff4-ed58-409d-8620-23643357737b */
   public long qzlx;
   /** 需办签证
    * 
    * @pdOid 2fdbcc32-ffb4-434c-b5c6-ecc650a7d01c */
   public long xbqz;
   /** 需办邀请
    * 
    * @pdOid 217c5d3c-74fe-46ac-bb08-7ba6d5b05831 */
   public long xbyq;
   /** 酒店标准，在字段中
    * 
    * @pdOid 86f73f99-a8ec-4ef2-a66e-836f24b8c111 */
   public long jdbzNo;
   /** 早餐标准，在字典中
    * 
    * @pdOid 7bcd84c0-01ce-4983-9f10-2c09a59d9a3d */
   public long zcNo;
   /** 中餐标准，在字段中
    * 
    * @pdOid 22ef5535-6f62-407b-82d9-2c1a95b4e9ba */
   public long zhongcNo;
   /** 晚餐标准
    * 
    * @pdOid 20661436-5244-4fdd-a2ac-cc5e84134922 */
   public long wcNo;
   /** 巴士司导
    * 
    * @pdOid fe5f32a1-3d3f-4ecc-bd7d-b6c9cbcbf7db */
   public long bssdNo;
   /** 车型
    * 
    * @pdOid f5e3ccd7-6742-448f-82ea-29ba3a2ec143 */
   public long cheXingNo;
   /** 酒店报价标准,在字段中
    * 
    * @pdOid 3337aa1f-3674-4545-9c63-2ff3517103a0 */
   public long jdbjNo;
   /** 巴士报价标准，在字段中
    * 
    * @pdOid a72b5f91-412e-4bae-a338-5552ce7695a6 */
   public long bsbjNo;
   /** 用餐报价标准,在字段中
    * 
    * @pdOid ff1eb850-df71-413a-a022-6c37300b59b6 */
   public long ycbjNo;
   /** 导游报价标准，在字典中
    * 
    * @pdOid 11478424-24d0-4e06-a67f-23e8c0fdf5da */
   public long dybjNo;
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
   public long shenpi;
public String getTuanNO() {
	return tuanNO;
}
public void setTuanNO(String tuanNO) {
	this.tuanNO = tuanNO;
}
public String getTuanName() {
	return tuanName;
}
public void setTuanName(String tuanName) {
	this.tuanName = tuanName;
}
public long getKhId() {
	return khId;
}
public void setKhId(long khId) {
	this.khId = khId;
}
public long getTdczlx() {
	return tdczlx;
}
public void setTdczlx(long tdczlx) {
	this.tdczlx = tdczlx;
}
public long getTdjb() {
	return tdjb;
}
public void setTdjb(long tdjb) {
	this.tdjb = tdjb;
}
public long getTdzt() {
	return tdzt;
}
public void setTdzt(long tdzt) {
	this.tdzt = tdzt;
}
public int getCfrs() {
	return cfrs;
}
public void setCfrs(int cfrs) {
	this.cfrs = cfrs;
}
public int getCfts() {
	return cfts;
}
public void setCfts(int cfts) {
	this.cfts = cfts;
}
public long getCfgj() {
	return cfgj;
}
public void setCfgj(long cfgj) {
	this.cfgj = cfgj;
}
public long getLyqy() {
	return lyqy;
}
public void setLyqy(long lyqy) {
	this.lyqy = lyqy;
}
public java.util.Date getCtsj() {
	return ctsj;
}
public void setCtsj(java.util.Date ctsj) {
	this.ctsj = ctsj;
}
public java.util.Date getHtsj() {
	return htsj;
}
public void setHtsj(java.util.Date htsj) {
	this.htsj = htsj;
}
public long getXsNo() {
	return xsNo;
}
public void setXsNo(long xsNo) {
	this.xsNo = xsNo;
}
public long getJdNo() {
	return jdNo;
}
public void setJdNo(long jdNo) {
	this.jdNo = jdNo;
}
public long getKhjlNo() {
	return khjlNo;
}
public void setKhjlNo(long khjlNo) {
	this.khjlNo = khjlNo;
}
public long getQzlx() {
	return qzlx;
}
public void setQzlx(long qzlx) {
	this.qzlx = qzlx;
}
public long getXbqz() {
	return xbqz;
}
public void setXbqz(long xbqz) {
	this.xbqz = xbqz;
}
public long getXbyq() {
	return xbyq;
}
public void setXbyq(long xbyq) {
	this.xbyq = xbyq;
}
public long getJdbzNo() {
	return jdbzNo;
}
public void setJdbzNo(long jdbzNo) {
	this.jdbzNo = jdbzNo;
}
public long getZcNo() {
	return zcNo;
}
public void setZcNo(long zcNo) {
	this.zcNo = zcNo;
}
public long getZhongcNo() {
	return zhongcNo;
}
public void setZhongcNo(long zhongcNo) {
	this.zhongcNo = zhongcNo;
}
public long getWcNo() {
	return wcNo;
}
public void setWcNo(long wcNo) {
	this.wcNo = wcNo;
}
public long getBssdNo() {
	return bssdNo;
}
public void setBssdNo(long bssdNo) {
	this.bssdNo = bssdNo;
}
public long getCheXingNo() {
	return cheXingNo;
}
public void setCheXingNo(long cheXingNo) {
	this.cheXingNo = cheXingNo;
}
public long getJdbjNo() {
	return jdbjNo;
}
public void setJdbjNo(long jdbjNo) {
	this.jdbjNo = jdbjNo;
}
public long getBsbjNo() {
	return bsbjNo;
}
public void setBsbjNo(long bsbjNo) {
	this.bsbjNo = bsbjNo;
}
public long getYcbjNo() {
	return ycbjNo;
}
public void setYcbjNo(long ycbjNo) {
	this.ycbjNo = ycbjNo;
}
public long getDybjNo() {
	return dybjNo;
}
public void setDybjNo(long dybjNo) {
	this.dybjNo = dybjNo;
}
public String getQtdjDesc() {
	return qtdjDesc;
}
public void setQtdjDesc(String qtdjDesc) {
	this.qtdjDesc = qtdjDesc;
}
public String getTsDesc() {
	return tsDesc;
}
public void setTsDesc(String tsDesc) {
	this.tsDesc = tsDesc;
}
public long getShenpi() {
	return shenpi;
}
public void setShenpi(long shenpi) {
	this.shenpi = shenpi;
}
   

}