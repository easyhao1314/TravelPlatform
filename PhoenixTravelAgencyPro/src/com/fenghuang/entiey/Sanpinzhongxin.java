/***********************************************************************
 * Module:  Sanpinzhongxin.java
 * Author:  Administrator
 * Purpose: Defines the Class Sanpinzhongxin
 ***********************************************************************/
package com.fenghuang.entiey;
import java.util.*;

/** 散拼中心
 * 
 * @pdOid 9376c814-30d5-4512-9b1a-f2c6cdd167bb */
public class Sanpinzhongxin {
   /** 团号
    * 
    * @pdOid 969fac73-94fa-4f70-a081-4c758a4d7b18 */
   public java.lang.String tuanNo;
   /** 团名 
    * 
    * @pdOid 55403240-932c-4d7b-94f5-0ddb921bf0b8 */
   public java.lang.String tuanName;
   /** 地域类型
    * 
    * @pdOid 5fbfe401-b1d8-4921-aa85-96b6786247e7 */
   public long areatype;
   /** 目标人群
    * 
    * @pdOid 3a9bc051-9915-4bad-98fc-2a6456dc7e73 */
   public long targetpopulation;
   /** 出发城市
    * 
    * @pdOid 815799d0-1b4b-429f-955d-bfc7c8ce2342 */
   public long departurecity;
   /** 终点城市
    * 
    * @pdOid eefacd82-1921-46c8-bd97-70f0c38d8b16 */
   public long terminalCity;
   /** 产品类型
    * 
    * @pdOid 4f5f4256-9327-422b-a6ce-1e69132249b7 */
   public long producttypes;
   /** 产品品牌
    * 
    * @pdOid a428ed5c-1ee8-4984-8588-cf3ca5df850e */
   public long productbrand;
   /** 酒店标准
    * 
    * @pdOid 2a4a6576-b474-472c-b3eb-0cce7f87bef4 */
   public long hotel;
   /** 旅游国家数量
    * 
    * @pdOid 9779f74d-d6f2-4804-ba6e-72d3411ab584 */
   public int numbercountry;
   /** 人数
    * 
    * @pdOid eb15d830-6041-4c79-8fe1-9657669b612e */
   public int numbermaster;
   /** 航空公司
    * 
    * @pdOid 60f673d3-3d48-41de-ab5f-6318dbf3df1c */
   public java.lang.String airways;
   /** 去程航班
    * 
    * @pdOid 0305186a-f106-42de-9fd5-4c45f1ab1ba2 */
   public java.lang.String groupflight;
   /** 回程航班
    * 
    * @pdOid 1c77c68c-8737-4e3f-9ff2-94fd82c1393a */
   public java.lang.String tourflight;
   /** 预警人数（出境）
    * 
    * @pdOid fb877199-4eaf-49b2-8972-09c9dbf71cb2 */
   public int predict;
   /** 报警人数（出境）
    * 
    * @pdOid 62133f3a-05cd-462e-8b68-02b2ea3f47cb */
   public int report;
   /** 团队特色说明
    * 
    * @pdOid 7320e8e0-5d79-417e-aa7e-a2a85538a7af */
   public java.lang.String teamexplains;
   /** 服务包含
    * 
    * @pdOid 6801e4d7-2086-455c-89c8-4bf5f3f6a4de */
   public java.lang.String servicesinclude;
   /** 服务不含
    * 
    * @pdOid ad4ac6d9-7596-4f90-b9a6-e840ccd9f669 */
   public java.lang.String servicenoinclude;
   /** 参团须知
    * 
    * @pdOid 671b74a6-f6a3-447f-9e6b-a25228cfd653 */
   public java.lang.String notes;
   /** 审核状态
    * 
    * @pdOid f60df380-4d96-4d89-abf9-2d96e953cd3f */
   public int reviewstatus;
   /** 审批价
    * 
    * @pdOid 9e098fdd-9c01-4a91-8871-30be1ef859a9 */
   public float shenpijia;
   /** 大客户价
    * 
    * @pdOid 3580a8e9-72ee-4ebb-a8cd-f64c3ae78139 */
   public float dakehujia;
   /** 直客价
    * 
    * @pdOid 196ae5da-e776-47f0-a189-1fed218a4893 */
   public float zhikejia;
   /** 同行价
    * 
    * @pdOid 4c581b31-8a52-4c9c-966a-ecb8861c794f */
   public float tonghang;
   /** 儿童站床价
    * 
    * @pdOid bd306e7a-10ce-4bee-907f-720888d49e75 */
   public float ertongzhanchuang;
   /** 儿童不占床价
    * 
    * @pdOid 1eeec1e9-b00e-44f5-9d78-a9f757618149 */
   public float ertongbuzhanchuang;
   /** 自备签价
    * 
    * @pdOid 7cd91fdf-e2c0-4d6c-8a96-8e5588ab41fa */
   public float zibeiqianjia;
   /** 全程天数
    * 
    * @pdOid c35c3748-b199-45e2-ae7d-f1c1b3743442 */
   public int numberday;
   /** 出团日期
    * 
    * @pdOid f713d81e-98de-496d-8a24-bc6590934304 */
   public java.util.Date groupdate;
   /** 回团日期
    * 
    * @pdOid 28f76ba5-c3f5-415c-b38b-a034c5ef1ec8 */
   public java.util.Date tourdate;
   /** 早餐
    * 
    * @pdOid ed85b88d-2508-47bb-a9e9-078c27559c64 */
   public long zao;
   /** 中餐
    * 
    * @pdOid 8ec6a22f-3a57-47c0-9d54-f0b8f3aa0811 */
   public long zhong;
   /** 晚餐
    * 
    * @pdOid bbb16735-aa57-49d5-9c4a-c1a691766211 */
   public long wan;
   /** 发布状态
    *  0=取消发布状态 1=散拼操作状态 2=散拼列表状态
    * @pdOid 0959eef5-4797-4f17-b0bf-028afa6b3842 */
   public int fabustate;
   /** 收客状态
    * 
    * @pdOid c4d686bf-eee3-43cc-9f5a-3b12e5dab105 */
   public int shoukestate;
   /** 散拼图片
    * 
    *  */
   private String tupian;
   /** 建团人
    * 
    *  */
   private long jiantuanren;
public long getJiantuanren() {
	return jiantuanren;
}
public void setJiantuanren(long jiantuanren) {
	this.jiantuanren = jiantuanren;
}
public String getTupian() {
	return tupian;
}
public void setTupian(String tupian) {
	this.tupian = tupian;
}
public java.lang.String getTuanNo() {
	return tuanNo;
}
public void setTuanNo(java.lang.String tuanNo) {
	this.tuanNo = tuanNo;
}
public java.lang.String getTuanName() {
	return tuanName;
}
public void setTuanName(java.lang.String tuanName) {
	this.tuanName = tuanName;
}
public long getAreatype() {
	return areatype;
}
public void setAreatype(long areatype) {
	this.areatype = areatype;
}
public long getTargetpopulation() {
	return targetpopulation;
}
public void setTargetpopulation(long targetpopulation) {
	this.targetpopulation = targetpopulation;
}
public long getDeparturecity() {
	return departurecity;
}
public void setDeparturecity(long departurecity) {
	this.departurecity = departurecity;
}
public long getTerminalCity() {
	return terminalCity;
}
public void setTerminalCity(long terminalCity) {
	this.terminalCity = terminalCity;
}
public long getProducttypes() {
	return producttypes;
}
public void setProducttypes(long producttypes) {
	this.producttypes = producttypes;
}
public long getProductbrand() {
	return productbrand;
}
public void setProductbrand(long productbrand) {
	this.productbrand = productbrand;
}
public long getHotel() {
	return hotel;
}
public void setHotel(long hotel) {
	this.hotel = hotel;
}
public int getNumbercountry() {
	return numbercountry;
}
public void setNumbercountry(int numbercountry) {
	this.numbercountry = numbercountry;
}
public int getNumbermaster() {
	return numbermaster;
}
public void setNumbermaster(int numbermaster) {
	this.numbermaster = numbermaster;
}
public java.lang.String getAirways() {
	return airways;
}
public void setAirways(java.lang.String airways) {
	this.airways = airways;
}
public java.lang.String getGroupflight() {
	return groupflight;
}
public void setGroupflight(java.lang.String groupflight) {
	this.groupflight = groupflight;
}
public java.lang.String getTourflight() {
	return tourflight;
}
public void setTourflight(java.lang.String tourflight) {
	this.tourflight = tourflight;
}
public int getPredict() {
	return predict;
}
public void setPredict(int predict) {
	this.predict = predict;
}
public int getReport() {
	return report;
}
public void setReport(int report) {
	this.report = report;
}
public java.lang.String getTeamexplains() {
	return teamexplains;
}
public void setTeamexplains(java.lang.String teamexplains) {
	this.teamexplains = teamexplains;
}
public java.lang.String getServicesinclude() {
	return servicesinclude;
}
public void setServicesinclude(java.lang.String servicesinclude) {
	this.servicesinclude = servicesinclude;
}
public java.lang.String getServicenoinclude() {
	return servicenoinclude;
}
public void setServicenoinclude(java.lang.String servicenoinclude) {
	this.servicenoinclude = servicenoinclude;
}
public java.lang.String getNotes() {
	return notes;
}
public void setNotes(java.lang.String notes) {
	this.notes = notes;
}
public int getReviewstatus() {
	return reviewstatus;
}
public void setReviewstatus(int reviewstatus) {
	this.reviewstatus = reviewstatus;
}
public float getShenpijia() {
	return shenpijia;
}
public void setShenpijia(float shenpijia) {
	this.shenpijia = shenpijia;
}
public float getDakehujia() {
	return dakehujia;
}
public void setDakehujia(float dakehujia) {
	this.dakehujia = dakehujia;
}
public float getZhikejia() {
	return zhikejia;
}
public void setZhikejia(float zhikejia) {
	this.zhikejia = zhikejia;
}
public float getTonghang() {
	return tonghang;
}
public void setTonghang(float tonghang) {
	this.tonghang = tonghang;
}
public float getErtongzhanchuang() {
	return ertongzhanchuang;
}
public void setErtongzhanchuang(float ertongzhanchuang) {
	this.ertongzhanchuang = ertongzhanchuang;
}
public float getErtongbuzhanchuang() {
	return ertongbuzhanchuang;
}
public void setErtongbuzhanchuang(float ertongbuzhanchuang) {
	this.ertongbuzhanchuang = ertongbuzhanchuang;
}
public float getZibeiqianjia() {
	return zibeiqianjia;
}
public void setZibeiqianjia(float zibeiqianjia) {
	this.zibeiqianjia = zibeiqianjia;
}
public int getNumberday() {
	return numberday;
}
public void setNumberday(int numberday) {
	this.numberday = numberday;
}
public java.util.Date getGroupdate() {
	return groupdate;
}
public void setGroupdate(java.util.Date groupdate) {
	this.groupdate = groupdate;
}
public java.util.Date getTourdate() {
	return tourdate;
}
public void setTourdate(java.util.Date tourdate) {
	this.tourdate = tourdate;
}
public long getZao() {
	return zao;
}
public void setZao(long zao) {
	this.zao = zao;
}
public long getZhong() {
	return zhong;
}
public void setZhong(long zhong) {
	this.zhong = zhong;
}
public long getWan() {
	return wan;
}
public void setWan(long wan) {
	this.wan = wan;
}
public int getFabustate() {
	return fabustate;
}
public void setFabustate(int fabustate) {
	this.fabustate = fabustate;
}
public int getShoukestate() {
	return shoukestate;
}
public void setShoukestate(int shoukestate) {
	this.shoukestate = shoukestate;
}

}