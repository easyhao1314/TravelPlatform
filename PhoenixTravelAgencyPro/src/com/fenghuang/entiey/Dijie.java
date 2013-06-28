/***********************************************************************
 * Module:  Dijie.java
 * Author:  Administrator
 * Purpose: Defines the Class Dijie
 ***********************************************************************/
package com.fenghuang.entiey;
import java.util.*;

/** 地接供应商
 * 
 * @pdOid 1e7f9de0-4a7c-46f1-86bb-b7d08af5e843 */
public class Dijie {
   /** 编号
    * 
    * @pdOid 7242a95b-d3ee-4a60-93ee-0d1c48d5ee01 */
   public long id;
   /** 供应商名称
    * 
    * @pdOid 4a7c7ee8-0606-40f9-bb99-60ded99dbd3a */
   public java.lang.String name;
   /** 英文名称
    * 
    * @pdOid d7fabc35-4a0e-4746-a4d6-8aedbc5fe08f */
   public java.lang.String ywname;
   /** 城市Id
    * 
    * @pdOid 04f3d23c-58f0-4360-a1ce-796b67957cd3 */
   public int chengshiId;
   /** 地址
    * 
    * @pdOid 5cf1bebd-a7a5-43d9-9455-0bb1fa06a4b0 */
   public java.lang.String dizhi;
   /** 合作级别Id
    * 
    * @pdOid 44376d9b-bee9-49ad-8f04-5c9540226dba */
   public int hzjbId;
   /** 联系人
    * 
    * 
    * @pdOid 940767e1-781a-460a-8684-ab08edf8e98b */
   public java.lang.String lianxiren;
   /** 联系电话
    * 
    * @pdOid fb5a65c0-01a2-4ed3-afb5-0e4391943b97 */
   public java.lang.String dianhua;
   /** 手机
    * 
    * @pdOid ea5443b1-67d3-4957-af88-acab2cbacdec */
   public java.lang.String shouji;
   /** 传真
    * 
    * @pdOid 256d558c-d8fd-4c5b-9d2a-042142b0030f */
   public java.lang.String chuanzhen;
   /** 邮箱
    * 
    * @pdOid 12a1ab60-772a-4705-98e6-b93a49e32255 */
   public java.lang.String email;
   /** SKYPE
    * 
    * @pdOid ebd7b408-21da-418e-ab5f-c52d87b47d1e */
   public java.lang.String skype;
   /** MSN
    * 
    * @pdOid 8010dcd7-d706-4a38-91db-4265a88192f7 */
   public java.lang.String msn;
   /** YAHOO
    * 
    * @pdOid 99731cb8-26e6-441f-9294-12d754ac1007 */
   public java.lang.String yahoo;
   /** 网址
    * 
    * @pdOid a6b1cd5d-ed59-4a4c-a5a7-19df65e7aa17 */
   public java.lang.String wangzhi;
   /** 代理人开户银
    * 
    * @pdOid f2ffbdab-345f-4f03-93fb-87f01fbbfc80 */
   public java.lang.String kaihu;
   /** 代理人账号
    * 
    * @pdOid b403d6dc-2243-47f7-b64c-4e99ce908753 */
   public java.lang.String dlrzh;
   /** 银行地址
    * 
    * @pdOid c8cd621b-3a2d-45f1-9b35-9c0eb79f92e6 */
   public java.lang.String yhdz;
   /** 收款人账号
    * 
    * @pdOid d705ecac-0fa4-4fac-a7f0-7ef906f9661a */
   public java.lang.String skrzh;
   /** 收款人姓名
    * 
    * @pdOid 96f40ddb-bf57-47e6-b6b5-4c639c194186 */
   public java.lang.String skrxm;
   /** 收款人地址
    * 
    * @pdOid 4964d8e4-dc76-45d1-8066-904a34996c1c */
   public java.lang.String skrdz;
   /** 业务覆盖区域Id（洲）
    * 
    * @pdOid 837df61e-2e92-4dc5-97e8-08410731b743 */
   public int ywqyId;
   /** 地接社描述
    * 
    * @pdOid 13dee6d0-b4a6-4a60-87db-0cd06e3cb01f */
   public java.lang.String djsms;
   /** 性价比
    * 
    * @pdOid e8f24865-f3a1-49e4-9253-56248c29096a */
   public java.lang.String xjb;
   /** 优势
    * 
    * @pdOid d28c8309-1f90-4a1f-990d-42def35b93b7 */
   public java.lang.String youshi;
   /** 备注
    * 
    * @pdOid d617a34d-8532-4f43-ae31-5372f76b2105 */
   public java.lang.String bz;
public long getId() {
	return id;
}
public void setId(long id) {
	this.id = id;
}
public java.lang.String getName() {
	return name;
}
public void setName(java.lang.String name) {
	this.name = name;
}
public java.lang.String getYwname() {
	return ywname;
}
public void setYwname(java.lang.String ywname) {
	this.ywname = ywname;
}
public int getChengshiId() {
	return chengshiId;
}
public void setChengshiId(int chengshiId) {
	this.chengshiId = chengshiId;
}
public java.lang.String getDizhi() {
	return dizhi;
}
public void setDizhi(java.lang.String dizhi) {
	this.dizhi = dizhi;
}
public int getHzjbId() {
	return hzjbId;
}
public void setHzjbId(int hzjbId) {
	this.hzjbId = hzjbId;
}
public java.lang.String getLianxiren() {
	return lianxiren;
}
public void setLianxiren(java.lang.String lianxiren) {
	this.lianxiren = lianxiren;
}
public java.lang.String getDianhua() {
	return dianhua;
}
public void setDianhua(java.lang.String dianhua) {
	this.dianhua = dianhua;
}
public java.lang.String getShouji() {
	return shouji;
}
public void setShouji(java.lang.String shouji) {
	this.shouji = shouji;
}
public java.lang.String getChuanzhen() {
	return chuanzhen;
}
public void setChuanzhen(java.lang.String chuanzhen) {
	this.chuanzhen = chuanzhen;
}
public java.lang.String getEmail() {
	return email;
}
public void setEmail(java.lang.String email) {
	this.email = email;
}
public java.lang.String getSkype() {
	return skype;
}
public void setSkype(java.lang.String skype) {
	this.skype = skype;
}
public java.lang.String getMsn() {
	return msn;
}
public void setMsn(java.lang.String msn) {
	this.msn = msn;
}
public java.lang.String getYahoo() {
	return yahoo;
}
public void setYahoo(java.lang.String yahoo) {
	this.yahoo = yahoo;
}
public java.lang.String getWangzhi() {
	return wangzhi;
}
public void setWangzhi(java.lang.String wangzhi) {
	this.wangzhi = wangzhi;
}
public java.lang.String getKaihu() {
	return kaihu;
}
public void setKaihu(java.lang.String kaihu) {
	this.kaihu = kaihu;
}
public java.lang.String getDlrzh() {
	return dlrzh;
}
public void setDlrzh(java.lang.String dlrzh) {
	this.dlrzh = dlrzh;
}
public java.lang.String getYhdz() {
	return yhdz;
}
public void setYhdz(java.lang.String yhdz) {
	this.yhdz = yhdz;
}
public java.lang.String getSkrzh() {
	return skrzh;
}
public void setSkrzh(java.lang.String skrzh) {
	this.skrzh = skrzh;
}
public java.lang.String getSkrxm() {
	return skrxm;
}
public void setSkrxm(java.lang.String skrxm) {
	this.skrxm = skrxm;
}
public java.lang.String getSkrdz() {
	return skrdz;
}
public void setSkrdz(java.lang.String skrdz) {
	this.skrdz = skrdz;
}
public int getYwqyId() {
	return ywqyId;
}
public void setYwqyId(int ywqyId) {
	this.ywqyId = ywqyId;
}
public java.lang.String getDjsms() {
	return djsms;
}
public void setDjsms(java.lang.String djsms) {
	this.djsms = djsms;
}
public java.lang.String getXjb() {
	return xjb;
}
public void setXjb(java.lang.String xjb) {
	this.xjb = xjb;
}
public java.lang.String getYoushi() {
	return youshi;
}
public void setYoushi(java.lang.String youshi) {
	this.youshi = youshi;
}
public java.lang.String getBz() {
	return bz;
}
public void setBz(java.lang.String bz) {
	this.bz = bz;
}
   

}