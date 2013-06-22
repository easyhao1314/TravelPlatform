/**
 * 散拼中心实体类
 */
package com.fenghuang.entiey;
import java.util.*;

/** 散拼中心
 * 
 * @pdOid 3b9ec0f7-bd72-4d52-a746-e11a0b8cfa75 */
public class Sanpinzhongxin {
   /** 团号
    * 
    * @pdOid 095b2b8b-67d6-4bf9-b400-6359d5b9f4a5 */
   public java.lang.String tuanNo;
   /** 团名 
    * 
    * @pdOid e15d9eeb-12c1-49d0-ae0b-84a5b60d0c95 */
   public java.lang.String tuanName;
   /** 地域类型
    * 
    * @pdOid 0908250c-3c40-4079-9ab4-4d58ad23e008 */
   public long areatype;
   /** 目标人群
    * 
    * @pdOid c3b6da34-d9c7-4e41-b9ed-0fdea6115fc8 */
   public long targetpopulation;
   /** 出发城市
    * 
    * @pdOid 8047d8c7-1df5-45c9-bcf0-f543dc33e94d */
   public long departurecity;
   /** 终点城市
    * 
    * @pdOid 8773d19d-791e-46f8-b388-b898d1eeb2ab */
   public long terminalCity;
   /** 产品类型
    * 
    * @pdOid a80170f7-0cd6-4e15-89ef-bf2883b6a3e7 */
   public long producttypes;
   /** 产品品牌
    * 
    * @pdOid 8ad19ee1-887d-4484-b306-70261c4cce03 */
   public long productbrand;
   /** 酒店标准
    * 
    * @pdOid ac5ad0a0-4d17-48bf-bbed-9d026b37fb9c */
   public long hotel;
   /** 旅游国家数量
    * 
    * @pdOid bafd96f3-e1e7-490a-88c5-50edf5ee93d5 */
   public int numbercountry;
   /** 人数
    * 
    * @pdOid 75067216-e241-4584-8d61-7994df57edbc */
   public int numbermaster;
   /** 航空公司
    * 
    * @pdOid 25aff2ac-7503-4fac-90c6-8ad798581734 */
   public java.lang.String airways;
   /** 去程航班
    * 
    * @pdOid e7017d3b-b9a9-406b-9530-5c81f0b51e03 */
   public java.lang.String groupflight;
   /** 回程航班
    * 
    * @pdOid b0e9eae4-9132-4d1c-aba7-8a26590e95a4 */
   public java.lang.String tourflight;
   /** 预警人数（出境）
    * 
    * @pdOid 0f5983ef-fc2b-4a1f-bf1e-f75a64bd4a7d */
   public int predict;
   /** 报警人数（出境）
    * 
    * @pdOid a265ebcf-cafd-476f-af92-90afc311d008 */
   public int report;
   /** 团队特色说明
    * 
    * @pdOid 1f5265a2-e8bf-4419-bfc3-4588f0f8fe91 */
   public java.lang.String teamexplains;
   /** 服务包含
    * 
    * @pdOid a268e457-34c5-4d61-bdb4-7c4f3e1b8b0e */
   public java.lang.String servicesinclude;
   /** 服务不含
    * 
    * @pdOid 7299d638-3c2f-4ac1-aaac-a8e5753eec37 */
   public java.lang.String servicenoinclude;
   /** 参团须知
    * 
    * @pdOid 0e4cf6c3-f72b-47f7-b378-ea4ea4ecd93e */
   public java.lang.String notes;
   /** 审核状态
    * 
    * @pdOid c8e379aa-09c7-4d71-b0e1-43a52b462398 */
   public int reviewstatus;
   /** 审批价
    * 
    * @pdOid f0d275b6-6eba-4fd8-8c3d-3e7364c863f0 */
   public float shenpijia;
   /** 大客户价
    * 
    * @pdOid e05cb9c0-b949-4534-9396-93e47995578c */
   public float dakehujia;
   /** 直客价
    * 
    * @pdOid 151fbba9-a360-4ddc-a707-9101d79f513b */
   public float zhikejia;
   /** 同行价
    * 
    * @pdOid f7406a27-e78a-49c8-9976-ab72e94b075e */
   public float tonghang;
   /** 儿童站床价
    * 
    * @pdOid 89390dd9-e94a-47df-afb0-e6c3ab92a5e1 */
   public float ertongzhanchuang;
   /** 儿童不占床价
    * 
    * @pdOid 0ec7cc8f-a5b9-4b81-a002-d4329ab6a219 */
   public float ertongbuzhanchuang;
   /** 自备签价
    * 
    * @pdOid e2655aba-2e47-4c9b-92e9-8471e18674a5 */
   public float zibeiqianjia;
   
   /** @pdOid 8dc544b2-6fd6-4ff1-a4c8-4fed5c672394 */
   public java.lang.String getTuanNo() {
      return tuanNo;
   }
   
   /** @param newTuanNo
    * @pdOid 779a7ddc-e0fb-4b66-8523-574b8dc62252 */
   public void setTuanNo(java.lang.String newTuanNo) {
      tuanNo = newTuanNo;
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

}