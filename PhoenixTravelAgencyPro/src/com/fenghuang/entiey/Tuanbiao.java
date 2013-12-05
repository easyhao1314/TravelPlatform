package com.fenghuang.entiey;

/***********************************************************************
 * Module:  Tuanbiao.java
 * Author:  Administrator
 * Purpose: Defines the Class Tuanbiao
 ***********************************************************************/

import java.util.*;

/** 团队信息
 * 
 * @pdOid 80d0fb8f-fed1-437d-9ad5-7c7a96635a5c */
public class Tuanbiao {
   /** @pdOid 51b4ddd3-62fb-467d-96de-8f53fbcaf8a0 */
   public long id;
   /** 付款日期
    * 
    * @pdOid 70849751-6e51-442e-af9b-a23b2f585ac0 */
   public java.util.Date payment;
   /** 团号ID
    * 
    * @pdOid 22b298c6-af0d-4a94-b191-5d68867cf7b2 */
   public java.lang.String team;
   /** 供应商ID
    * 
    * @pdOid fa91e375-f059-4e3e-81c4-83c1936c172d */
   public java.lang.String suppliers;
   /** 操作
    * 
    * @pdOid f99eee3f-b6ca-4418-bc4d-69c1778470ea */
   public java.lang.String caozuo;
   /** 销售人员
    * 
    * @pdOid 28be7c6d-7a86-4af6-99d3-d91185c64303 */
   public java.lang.String xiaoshou;
   /** 财务id
    * 
    * @pdOid b33f6d1f-5598-4c44-8183-89c8aec989c4 */
   public int caiwuid;
   /** 账号id
    * 
    * @pdOid db1afd4c-f59f-447e-a53b-01e5e26aeaa7 */
   public int zhanghaoid;
   /** 身份id
    * 
    * @pdOid 8f1ed703-da0b-40b6-a0b1-a7728bb09ebf */
   public int shenfenid;
   /** 出团时间
    * 
    * @pdOid f6386105-c36e-4a92-8790-56d138cd20d1 */
   public java.util.Date chutuantime;
   /** 回团日期
    * 
    * @pdOid 7fe4b8a0-b2f6-4f78-8104-44a30bbecd78 */
   public java.util.Date huituantime;
   /** 应收
    * 
    * @pdOid 88614fe3-6ec6-431a-b65c-424de2f3c0bc */
   public float yingshou;
   /** 已收
    * 
    * @pdOid 6fab1b6a-cc43-491d-a619-cf6fefcf238d */
   public float yishou;
   /** 已付
    * 
    * @pdOid 6387ee87-fcac-428e-91fb-a3fd8df96717 */
   public float yifu;
   /** 退款
    * 
    * @pdOid 8457dd37-0760-46f6-a7cc-b2e3908cb661 */
   public float tuikuan;
   /** 返佣
    * 
    * @pdOid ac4fe577-1915-4748-85ce-382d638d5b62 */
   public float fanyong;
   /** 预计利润
    * 
    * @pdOid 0d96ef10-f4c2-4d40-bd6f-e62794ede2e4 */
   public float yujilirun;
   /** 实际利润
    * 
    * @pdOid 6421bccf-6f05-4bf2-8bfe-a3e660931e05 */
   public float shijilirun;
   /** 单号
    * 
    * @pdOid 13fd8e75-6766-498c-98e0-2e73bbdee6b0 */
   public java.lang.String danhao;
   /** 付款日期
    * 
    * @pdOid 54518fb1-9da8-41bd-a386-d6ed62edeacd */
   public java.util.Date fukuantime;
   /** 预收日期
    * 
    * @pdOid d048fe34-3c93-4311-a7d6-4c32343b76c0 */
   public java.util.Date yushoutime;
   /** 汇率
    * 
    * @pdOid 3c7d0fe3-c2a2-464a-895b-56631d4f2886 */
   public int huilvID;
   /** 已开发票
    * 
    * @pdOid 566f46ff-67f3-46d7-be4b-14bfb035510d */
   public int ykfp;
   /** 发票许可
    * 
    * @pdOid 3aae4a70-564f-4c71-ba8c-7b3a0a28cfb2 */
   public int fpxk;
   /** 负责人
    * 
    * @pdOid 54fe5f40-c883-4bf3-b059-2d11479b1c40 */
   public java.lang.String fuzeren;
   /** 状态
    * 
    * @pdOid d7e91a60-fcb9-4827-9337-3f4e2d0310e6 */
   public int zhuangtai;
   /** 应收款应付款统计身份
    * 
    * @pdOid 6edce38b-d30e-4e3b-aa7d-aac778a6f027 */
   public int ysyfID;
   /** 客户名称
    * 
    * @pdOid c577b347-2d79-45ce-9ae6-31d9454b3c5d */
   public java.lang.String khmc;
   /** 款项说明
    * 
    * @pdOid baccabab-ac88-4dc8-a4ca-00bd7fd63de9 */
   public java.lang.String kxsm;
   /** 人数	
    * 
    * @pdOid ad779dd5-463a-4712-ab12-9d84ddde83b4 */
   public int renshu;
   /** 订单金额
    * 
    * @pdOid 872ed341-b61c-4347-a2e9-7568ff89357e */
   public float ddje;
   /** 返款
    * 
    * @pdOid 20b9cf36-4dab-44a5-b2e4-10b9e6b5edb6 */
   public float fankuan;
   /** 押金
    * 
    * @pdOid e7cb3ecd-03e0-40d4-920c-6b451b1b406c */
   public float yajin;
   /** 采购金额
    * 
    * @pdOid b349e5c9-db6b-4961-b4f9-19ea91fbf656 */
   public float cgje;
   /** 采购利润
    * 
    * @pdOid cb3b36e8-2c01-429e-9e3a-4b8ed6c07b46 */
   public float cglr;
   /** 支出
    * 
    * @pdOid 95e6ebb4-5bac-4bab-9a3c-58b28835f2bb */
   public float zhichu;
   /** 毛利
    * 
    * @pdOid a6db619c-5ba7-4bef-a4b6-fe3453c6b839 */
   public float maoli;
   /** 毛利率
    * 
    * @pdOid 14d91535-18c6-4de5-a24c-fdba28e77f58 */
   public float maolilv;
   /** 备注
    * 
    * @pdOid cf0389b4-223e-488c-8163-04ad7619c168 */
   public java.lang.String beizhu;
   /** 应付
    * 
    * @pdOid 62845769-d277-4716-81e6-8b765f6116ef */
   public float yfk;
   /** 报价
    * 
    * @pdOid c6e560c4-94e0-47c8-b534-51cc78cb3da1 */
   public float baojia;
   /** 成本
    * 
    * @pdOid 3c0b0009-bdd8-4da5-9dab-a098efeb9f1b */
   public float chengben;
   /** 团队名称
    * 
    * @pdOid 5cda6606-39eb-4515-998a-659bd9d8c5fe */
   public java.lang.String tuanduimc;
   /** 删除的身份
    * 
    * @pdOid 07b2dd7d-9cee-49b2-b5e1-6333544c395c */
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
public float getYingshou() {
	return yingshou;
}
public void setYingshou(float yingshou) {
	this.yingshou = yingshou;
}
public float getYishou() {
	return yishou;
}
public void setYishou(float yishou) {
	this.yishou = yishou;
}
public float getYifu() {
	return yifu;
}
public void setYifu(float yifu) {
	this.yifu = yifu;
}
public float getTuikuan() {
	return tuikuan;
}
public void setTuikuan(float tuikuan) {
	this.tuikuan = tuikuan;
}
public float getFanyong() {
	return fanyong;
}
public void setFanyong(float fanyong) {
	this.fanyong = fanyong;
}
public float getYujilirun() {
	return yujilirun;
}
public void setYujilirun(float yujilirun) {
	this.yujilirun = yujilirun;
}
public float getShijilirun() {
	return shijilirun;
}
public void setShijilirun(float shijilirun) {
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
public java.lang.String getKxsm() {
	return kxsm;
}
public void setKxsm(java.lang.String kxsm) {
	this.kxsm = kxsm;
}
public int getRenshu() {
	return renshu;
}
public void setRenshu(int renshu) {
	this.renshu = renshu;
}
public float getDdje() {
	return ddje;
}
public void setDdje(float ddje) {
	this.ddje = ddje;
}
public float getFankuan() {
	return fankuan;
}
public void setFankuan(float fankuan) {
	this.fankuan = fankuan;
}
public float getYajin() {
	return yajin;
}
public void setYajin(float yajin) {
	this.yajin = yajin;
}
public float getCgje() {
	return cgje;
}
public void setCgje(float cgje) {
	this.cgje = cgje;
}
public float getCglr() {
	return cglr;
}
public void setCglr(float cglr) {
	this.cglr = cglr;
}
public float getZhichu() {
	return zhichu;
}
public void setZhichu(float zhichu) {
	this.zhichu = zhichu;
}
public float getMaoli() {
	return maoli;
}
public void setMaoli(float maoli) {
	this.maoli = maoli;
}
public float getMaolilv() {
	return maolilv;
}
public void setMaolilv(float maolilv) {
	this.maolilv = maolilv;
}
public java.lang.String getBeizhu() {
	return beizhu;
}
public void setBeizhu(java.lang.String beizhu) {
	this.beizhu = beizhu;
}
public float getYfk() {
	return yfk;
}
public void setYfk(float yfk) {
	this.yfk = yfk;
}
public float getBaojia() {
	return baojia;
}
public void setBaojia(float baojia) {
	this.baojia = baojia;
}
public float getChengben() {
	return chengben;
}
public void setChengben(float chengben) {
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