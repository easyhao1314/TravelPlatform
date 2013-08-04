package com.fenghuang.entiey;

/***********************************************************************
 * Module:  Tuanbiao.java
 * Author:  Administrator
 * Purpose: Defines the Class Tuanbiao
 ***********************************************************************/

import java.util.*;

/** 团队信息
 * 
 * @pdOid a8c4d38f-5600-4d75-8fd8-40f0e30ae35b */
public class Tuanbiao {
   /** @pdOid 55c7ca74-8fb9-497b-b4c6-60556a8ff644 */
   public long id;
   /** 付款日期
    * 
    * @pdOid 70b84526-724b-49bd-a26d-7d373bdbcbd2 */
   public java.util.Date payment;
   /** 团号ID
    * 
    * @pdOid 83936ce5-86ec-4b68-9a15-b6e42836acc7 */
   public java.lang.String team;
   /** 供应商ID
    * 
    * @pdOid 2981c3e0-b47f-4b56-8627-ce8527e50891 */
   public java.lang.String suppliers;
   /** 操作
    * 
    * @pdOid 4279f71c-2f6d-4a85-b0fb-d8dce670fa67 */
   public java.lang.String caozuo;
   /** 销售人员
    * 
    * @pdOid df642516-ed64-4a06-b1a1-8e9549afba98 */
   public java.lang.String xiaoshou;
   /** 财务id
    * 
    * @pdOid b1b6f3fd-2fa2-4685-a677-b41b69915a91 */
   public int caiwuid;
   /** 账号id
    * 
    * @pdOid d0f1751b-69a9-4790-97c2-c6fd5fb6dbbc */
   public int zhanghaoid;
   /** 身份id
    * 
    * @pdOid 2f37eafc-b3a6-4e14-a139-be0a5bdbc24c */
   public int shenfenid;
   /** 出团时间
    * 
    * @pdOid d31b65fd-4598-433b-a27e-d9d59c6d1920 */
   public java.util.Date chutuantime;
   /** 回团日期
    * 
    * @pdOid d7b46923-62a6-46b4-bea9-7df9227b353d */
   public java.util.Date huituantime;
   /** 应收
    * 
    * @pdOid dfaf7f41-98fa-4b13-b798-8214be418537 */
   public double yingshou;
   /** 已收
    * 
    * @pdOid e2db6c76-650a-4b92-86df-45ce6f345309 */
   public double yishou;
   /** 已付
    * 
    * @pdOid b3a3e473-7e9c-4f24-b4ed-f22a113cf872 */
   public double yifu;
   /** 退款
    * 
    * @pdOid 52af7a3c-2263-4a89-999b-d696ee1e21b2 */
   public double tuikuan;
   /** 返佣
    * 
    * @pdOid 9eab84ef-dab2-4f52-99d0-443688b0edab */
   public double fanyong;
   /** 预计利润
    * 
    * @pdOid 5c0f0a08-ddf3-4019-a2b7-a5bef3256b04 */
   public double yujilirun;
   /** 实际利润
    * 
    * @pdOid 74200bd6-78fa-4adf-a071-f3092ef8b234 */
   public double shijilirun;
   /** 单号
    * 
    * @pdOid 4469f4a7-e65b-4bdd-ac2e-59c4ea5f154c */
   public java.lang.String danhao;
   /** 付款日期
    * 
    * @pdOid 1d896a48-f009-4c18-bc2a-8c6964aa7131 */
   public java.util.Date fukuantime;
   /** 预收日期
    * 
    * @pdOid c3a9722f-d6de-44bd-b4ba-98a84d7a4990 */
   public java.util.Date yushoutime;
   /** 汇率
    * 
    * @pdOid f3d10a3e-f7bc-400a-b240-98777c63377c */
   public int huilvID;
   /** 已开发票
    * 
    * @pdOid f4ca40b4-0036-4c5d-90e9-942e382aaca2 */
   public int ykfp;
   /** 发票许可
    * 
    * @pdOid 6b16fff2-0df0-4385-9a61-5e7b6a922760 */
   public int fpxk;
   /** 负责人
    * 
    * @pdOid 61c60c44-d78e-4092-9cd2-1283224c72a3 */
   public java.lang.String fuzeren;
   /** 状态
    * 
    * @pdOid 3b639c60-1357-4253-a3dc-22516cd0dd03 */
   public int zhuangtai;
   /** 应收款应付款统计身份
    * 
    * @pdOid 77a21041-e0e8-4ee5-ad24-ea8e6e96891f */
   public int ysyfID;
   /** 客户名称
    * 
    * @pdOid c1286413-6562-4a7d-8aa2-1f001502db2d */
   public java.lang.String khmc;
   /** 款项说明
    * 
    * @pdOid 35c194b1-dd4e-4e80-9623-6827b46bcaf5 */
   public int kxsm;
   /** 人数
    * 
    * @pdOid aa17cd50-1bfc-4195-be7b-73f03d5b76bc */
   public int renshu;
   /** 订单金额
    * 
    * @pdOid fde12d76-c3f0-4cff-98b7-90cf6c83088f */
   public double ddje;
   /** 返款
    * 
    * @pdOid b78849c5-b42c-4802-b54a-4f4833bda9c4 */
   public double fankuan;
   /** 押金
    * 
    * @pdOid 44f71a00-fbc9-4d5f-9e03-a8dea5f7da5a */
   public double yajin;
   /** 采购金额
    * 
    * @pdOid e859c0c9-3221-4bb4-a5d7-6fe4a8ecc27f */
   public double cgje;
   /** 采购利润
    * 
    * @pdOid 23b1ab21-e0ae-4c59-b034-07d521117927 */
   public double cglr;
   /** 支出
    * 
    * @pdOid 4d95f44a-3b23-48eb-9444-cba1896665b0 */
   public double zhichu;
   /** 毛利
    * 
    * @pdOid e497914c-a48f-4b1e-8ee9-7543fc81bf20 */
   public double maoli;
   /** 毛利率
    * 
    * @pdOid 18d5cb09-a127-47f7-b06d-09dca08c1069 */
   public double maolilv;
   /** 备注
    * 
    * @pdOid 9d8b8be5-d113-4ae6-ab4b-5b5b68dd890c */
   public java.lang.String beizhu;
   /** 应付
    * 
    * @pdOid 8e487904-eadd-497a-8fb7-c8d9e45ccfab */
   public double yfk;
   /** 报价
    * 
    * @pdOid cff2d460-32bc-4d77-b844-4d7ab0b9c36e */
   public double baojia;
   /** 成本
    * 
    * @pdOid 07af50cf-460e-4db7-ab8d-77ea3d8e7259 */
   public double chengben;
   /** 团队名称
    * 
    * @pdOid 32eac982-c725-4627-b10a-5b9b71a5b823 */
   public java.lang.String tuanduimc;
   /** 删除的身份
    * 
    * @pdOid 8d66cc9e-4eea-4ef8-912a-c318b48da51a */
   public int shanchu;
public long getId() {
	return id;
}
public void setId(long id) {
	this.id = id;
}
public java.util.Date getPayment() {
	return payment;
}
public void setPayment(java.util.Date payment) {
	this.payment = payment;
}
public java.lang.String getTeam() {
	return team;
}
public void setTeam(java.lang.String team) {
	this.team = team;
}
public java.lang.String getSuppliers() {
	return suppliers;
}
public void setSuppliers(java.lang.String suppliers) {
	this.suppliers = suppliers;
}
public java.lang.String getCaozuo() {
	return caozuo;
}
public void setCaozuo(java.lang.String caozuo) {
	this.caozuo = caozuo;
}
public java.lang.String getXiaoshou() {
	return xiaoshou;
}
public void setXiaoshou(java.lang.String xiaoshou) {
	this.xiaoshou = xiaoshou;
}
public int getCaiwuid() {
	return caiwuid;
}
public void setCaiwuid(int caiwuid) {
	this.caiwuid = caiwuid;
}
public int getZhanghaoid() {
	return zhanghaoid;
}
public void setZhanghaoid(int zhanghaoid) {
	this.zhanghaoid = zhanghaoid;
}
public int getShenfenid() {
	return shenfenid;
}
public void setShenfenid(int shenfenid) {
	this.shenfenid = shenfenid;
}
public java.util.Date getChutuantime() {
	return chutuantime;
}
public void setChutuantime(java.util.Date chutuantime) {
	this.chutuantime = chutuantime;
}
public java.util.Date getHuituantime() {
	return huituantime;
}
public void setHuituantime(java.util.Date huituantime) {
	this.huituantime = huituantime;
}
public double getYingshou() {
	return yingshou;
}
public void setYingshou(double yingshou) {
	this.yingshou = yingshou;
}
public double getYishou() {
	return yishou;
}
public void setYishou(double yishou) {
	this.yishou = yishou;
}
public double getYifu() {
	return yifu;
}
public void setYifu(double yifu) {
	this.yifu = yifu;
}
public double getTuikuan() {
	return tuikuan;
}
public void setTuikuan(double tuikuan) {
	this.tuikuan = tuikuan;
}
public double getFanyong() {
	return fanyong;
}
public void setFanyong(double fanyong) {
	this.fanyong = fanyong;
}
public double getYujilirun() {
	return yujilirun;
}
public void setYujilirun(double yujilirun) {
	this.yujilirun = yujilirun;
}
public double getShijilirun() {
	return shijilirun;
}
public void setShijilirun(double shijilirun) {
	this.shijilirun = shijilirun;
}
public java.lang.String getDanhao() {
	return danhao;
}
public void setDanhao(java.lang.String danhao) {
	this.danhao = danhao;
}
public java.util.Date getFukuantime() {
	return fukuantime;
}
public void setFukuantime(java.util.Date fukuantime) {
	this.fukuantime = fukuantime;
}
public java.util.Date getYushoutime() {
	return yushoutime;
}
public void setYushoutime(java.util.Date yushoutime) {
	this.yushoutime = yushoutime;
}
public int getHuilvID() {
	return huilvID;
}
public void setHuilvID(int huilvID) {
	this.huilvID = huilvID;
}
public int getYkfp() {
	return ykfp;
}
public void setYkfp(int ykfp) {
	this.ykfp = ykfp;
}
public int getFpxk() {
	return fpxk;
}
public void setFpxk(int fpxk) {
	this.fpxk = fpxk;
}
public java.lang.String getFuzeren() {
	return fuzeren;
}
public void setFuzeren(java.lang.String fuzeren) {
	this.fuzeren = fuzeren;
}
public int getZhuangtai() {
	return zhuangtai;
}
public void setZhuangtai(int zhuangtai) {
	this.zhuangtai = zhuangtai;
}
public int getYsyfID() {
	return ysyfID;
}
public void setYsyfID(int ysyfID) {
	this.ysyfID = ysyfID;
}
public java.lang.String getKhmc() {
	return khmc;
}
public void setKhmc(java.lang.String khmc) {
	this.khmc = khmc;
}
public int getKxsm() {
	return kxsm;
}
public void setKxsm(int kxsm) {
	this.kxsm = kxsm;
}
public int getRenshu() {
	return renshu;
}
public void setRenshu(int renshu) {
	this.renshu = renshu;
}
public double getDdje() {
	return ddje;
}
public void setDdje(double ddje) {
	this.ddje = ddje;
}
public double getFankuan() {
	return fankuan;
}
public void setFankuan(double fankuan) {
	this.fankuan = fankuan;
}
public double getYajin() {
	return yajin;
}
public void setYajin(double yajin) {
	this.yajin = yajin;
}
public double getCgje() {
	return cgje;
}
public void setCgje(double cgje) {
	this.cgje = cgje;
}
public double getCglr() {
	return cglr;
}
public void setCglr(double cglr) {
	this.cglr = cglr;
}
public double getZhichu() {
	return zhichu;
}
public void setZhichu(double zhichu) {
	this.zhichu = zhichu;
}
public double getMaoli() {
	return maoli;
}
public void setMaoli(double maoli) {
	this.maoli = maoli;
}
public double getMaolilv() {
	return maolilv;
}
public void setMaolilv(double maolilv) {
	this.maolilv = maolilv;
}
public java.lang.String getBeizhu() {
	return beizhu;
}
public void setBeizhu(java.lang.String beizhu) {
	this.beizhu = beizhu;
}
public double getYfk() {
	return yfk;
}
public void setYfk(double yfk) {
	this.yfk = yfk;
}
public double getBaojia() {
	return baojia;
}
public void setBaojia(double baojia) {
	this.baojia = baojia;
}
public double getChengben() {
	return chengben;
}
public void setChengben(double chengben) {
	this.chengben = chengben;
}
public java.lang.String getTuanduimc() {
	return tuanduimc;
}
public void setTuanduimc(java.lang.String tuanduimc) {
	this.tuanduimc = tuanduimc;
}
public int getShanchu() {
	return shanchu;
}
public void setShanchu(int shanchu) {
	this.shanchu = shanchu;
}
   

}