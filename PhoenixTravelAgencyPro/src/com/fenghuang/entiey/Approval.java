/***********************************************************************
 * Module:  Approval.java
 * Author:  Administrator
 * Purpose: Defines the Class Approval
 ***********************************************************************/
package com.fenghuang.entiey;
import java.util.*;

/** 单团散拼审批表
 * 
 * @pdOid f2232751-995f-4890-a04a-39937e09dde3 */
public class Approval {
   /** 审批自增列
    * 
    * @pdOid 4122af54-f1c5-4e2b-9384-29c1b881039f */
   public long approvalNo;
   /** 申请日期
    * 
    * @pdOid e4f6c72a-c155-4ae8-8c31-6a18d3242649 */
   public java.util.Date shenqingDate;
   /** 事物说明
    * 
    * @pdOid 8dd3dd58-2079-49dd-9d0b-43fe1f18866a */
   public java.lang.String shiwu;
   /** 申请人
    * 
    * @pdOid 318bb592-6f36-44a7-aca4-8dc26d7f8a62 */
   public long shenqingren;
   /** 审核人
    * 
    * @pdOid ae35205f-3d23-439e-a3a4-ccd1c758a5cb */
   public long shenheren;
   /** 审批状态
    * 
    * @pdOid 5068fba2-f3b9-4579-b74c-64238762d72d */
   public int approvalStatus;
   /** 审批日期
    * 
    * @pdOid a94c3836-5fae-45d6-bbf8-55f481380df9 */
   public java.util.Date shenpiDate;
   /** 备注
    * 
    * @pdOid 90d3af61-4ce0-4438-84e8-bff4bc9d163a */
   public java.lang.String beizhu;
   /** 审批类型 1、退团审批    2、转团审批    3、报名审批
    * 
    * @pdOid 3c2fa4e4-197b-45ef-a04a-aae03f29a2db */
   public int shenpitype;
   /** 申请的团
    * 
    * @pdOid e441579d-7c67-4a7c-83f3-f190050419f3 */
   public java.lang.String approvaltuanNo;
   /** 报名ID
    * 
    * @pdOid 65c20a95-9124-480b-9608-c945b77e7716 */
   public long bmid;
   
   
   
public long getBmid() {
	return bmid;
}
public void setBmid(long bmid) {
	this.bmid = bmid;
}
public long getApprovalNo() {
	return approvalNo;
}
public void setApprovalNo(long approvalNo) {
	this.approvalNo = approvalNo;
}
public java.util.Date getShenqingDate() {
	return shenqingDate;
}
public void setShenqingDate(java.util.Date shenqingDate) {
	this.shenqingDate = shenqingDate;
}
public java.lang.String getShiwu() {
	return shiwu;
}
public void setShiwu(java.lang.String shiwu) {
	this.shiwu = shiwu;
}
public long getShenqingren() {
	return shenqingren;
}
public void setShenqingren(long shenqingren) {
	this.shenqingren = shenqingren;
}
public long getShenheren() {
	return shenheren;
}
public void setShenheren(long shenheren) {
	this.shenheren = shenheren;
}
public int getApprovalStatus() {
	return approvalStatus;
}
public void setApprovalStatus(int approvalStatus) {
	this.approvalStatus = approvalStatus;
}
public java.util.Date getShenpiDate() {
	return shenpiDate;
}
public void setShenpiDate(java.util.Date shenpiDate) {
	this.shenpiDate = shenpiDate;
}
public java.lang.String getBeizhu() {
	return beizhu;
}
public void setBeizhu(java.lang.String beizhu) {
	this.beizhu = beizhu;
}
public int getShenpitype() {
	return shenpitype;
}
public void setShenpitype(int shenpitype) {
	this.shenpitype = shenpitype;
}
public java.lang.String getApprovaltuanNo() {
	return approvaltuanNo;
}
public void setApprovaltuanNo(java.lang.String approvaltuanNo) {
	this.approvaltuanNo = approvaltuanNo;
}
   
}