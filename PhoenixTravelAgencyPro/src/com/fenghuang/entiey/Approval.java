/***********************************************************************
 * Module:  Approval.java
 * Author:  Administrator
 * Purpose: Defines the Class Approval
 ***********************************************************************/
package com.fenghuang.entiey;
import java.util.*;

/** 单团散拼审批表
 * 
 * @pdOid 28fb2cb2-7956-441a-8781-46e792b48f17 */
public class Approval {
   /** @pdOid 2e2d49ae-8a29-403c-8ca6-6113f20d4e2f */
   private int attribute8;
   
   /** 审批自增列
    * 
    * @pdOid 524b2645-7e84-4987-85d2-a2d7b97abd85 */
   public long approvalNo;
   /** 申请日期
    * 
    * @pdOid 8ccb348f-f79c-463a-ad14-19c9b68b34ce */
   public java.util.Date shenqingDate;
   /** 事物说明
    * 
    * @pdOid 84dcfe90-20a3-4ea0-90e0-210261544566 */
   public java.lang.String shiwu;
   /** 申请人
    * 
    * @pdOid 1c067f5e-a0ca-4d9b-a0cd-fc0d1161cc74 */
   public long shenqingren;
   /** 审核人
    * 
    * @pdOid 12c1ddb8-c5e1-4a02-8859-a960cac1a373 */
   public long shenheren;
   /** 审批状态
    * 
    * @pdOid 5d0f0611-7f6b-4ebb-9e28-99caaf6e5320 */
   public int approvalStatus;
   /** 审批日期
    * 
    * @pdOid 48aa3081-2415-41af-9646-89fd93a61e97 */
   public java.util.Date shenpiDate;
   /** 备注
    * 
    * @pdOid ea938324-ddcb-440e-997c-854de4f820d2 */
   public java.lang.String beizhu;
public int getAttribute8() {
	return attribute8;
}
public void setAttribute8(int attribute8) {
	this.attribute8 = attribute8;
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

}