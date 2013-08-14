/***********************************************************************
 * Module:  Users.java
 * Author:  baoguohao
 * Purpose: Defines the Class Users
 ***********************************************************************/
package com.fenghuang.entiey;

import java.io.Serializable;
import java.util.*;

/**
 * 用户表，用来记录用户信息的
 * 
 * @pdOid b461777c-0892-4f48-a4a6-7bf8c3668f61
 */
public class Users implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/** @pdOid 37b92e84-0c55-4148-9340-389744805148 */
	public Long id;
	/**
	 * 用户的编号，这个可以通过序列来产生
	 * 
	 * @pdOid 3c7f5775-a997-4830-ab41-4b265c2bbdb0
	 */
	public String userNumber;
	/**
	 * 用户名
	 * 
	 * @pdOid a7d28b2e-6198-4b13-b444-d2382aaaddfb
	 */
	public java.lang.String userName;
	/**
	 * 登陆名
	 * 
	 * @pdOid fbc81b75-953b-4518-a8a1-f3d61a6c40af
	 */
	public java.lang.String loginName;
	/**
	 * 英文名
	 * 
	 * @pdOid b4f36206-e2ef-4e80-9ef8-c7d2849390c6
	 */
	public java.lang.String enName;
	/**
	 * 性别 1：男，0：女
	 * 
	 * @pdOid 746a647f-8cff-4e3a-8912-aada8237b505
	 */
	public java.lang.String sex;
	/**
	 * 座机 电话
	 * 
	 * @pdOid d9c357a4-5db0-4d07-82fa-dae161cfe2e2
	 */
	public java.lang.String telephone;
	/**
	 * 出生日期
	 * 
	 * @pdOid eac63d43-55b7-44f2-9930-4418483d91b7
	 */
	public java.util.Date birthday;
	/**
	 * 座机分机号
	 * 
	 * @pdOid 6521d428-48ac-4f0e-b446-eebbe74fa0fd
	 */
	public java.lang.String telephoneExt;
	/**
	 * 用户的email
	 * 
	 * @pdOid 3036c7f8-3e48-406d-b52e-490974988b2b
	 */
	public java.lang.String email;
	/**
	 * 手机号
	 * 
	 * @pdOid 0c23f365-6c0d-4a2b-accb-16b7b976d5c9
	 */
	public java.lang.String mobilePhone;
	/** @pdOid b625d8fa-e149-4c0e-b505-f2e49b2e92b8 */
	public java.lang.String msn;
	/** @pdOid 927630c3-458e-4154-ac9c-6cf01bf20781 */
	public java.lang.String fax;
	/** @pdOid 755c4d46-eecd-40e5-9977-2ead735dbb3f */
	public java.lang.String msn2;
	/** @pdOid 3a06d62e-d73e-41ab-92c3-c05c1ccdc9b2 */
	public java.lang.String skype;
	/** @pdOid a3e38f13-c0b4-4427-92c0-e20f4f9e9dce */
	public java.lang.String msn3;
	/** @pdOid dfbdce1d-621b-4cd0-b14e-b75f4000aa3a */
	public java.lang.String qq;
	/**
	 * 职位描述
	 * 
	 * @pdOid 0d63c638-75c2-45cb-a30e-7cced6e75d89
	 */
	public java.lang.String jobDescription;
	/**
	 * 员工排序号
	 * 
	 * @pdOid 912f9556-74ac-4077-a418-5282555cd3cc
	 */
	public Long sortNumber;
	/**
	 * 地址
	 * 
	 * @pdOid a055df5c-ae38-4bbf-b6ea-ae42d8d98d5a
	 */
	public java.lang.String address;
	/**
	 * 邮编
	 * 
	 * @pdOid 2b1bc322-5726-4cc8-872e-d01069a4bc7c
	 */
	public java.lang.String zip;
	/**
	 * 描述
	 * 
	 * @pdOid 8cf6e3e3-5faa-4c36-a41e-5c3e317dc6e5
	 */
	public java.lang.String remark;
	/**
	 * 个人图片的路径
	 * 
	 * @pdOid e64db7a5-aaa7-4d41-b7f2-79bfd6adaa7b
	 */
	public java.lang.String imagePath;
	/**
	 * 用户的登陆密码
	 * 
	 * @pdOid cdd94f27-8726-46ef-bfa2-06b1ac045bf1
	 */
	public java.lang.String password;

	/**
	 * 用户所在的公司id，这里去掉了 面向对象的方式，修改为视图的方式查询
	 */
	public Long companyId;
	/** 用户部门关系 */
	public Long departmentId;
	
	/**
	 *  这个字段是在显示的时候用的
	 */
	public String companyName;
	/**
	 * 这个字段是在显示的时候用的
	 */
	public String departName;
	
	/**
	 * 是否离职。 0：在职。1:离职
	 */
	public String isWork;
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUserNumber() {
		return userNumber;
	}

	public void setUserNumber(String userNumber) {
		this.userNumber = userNumber;
	}

	public java.lang.String getUserName() {
		return userName;
	}

	public void setUserName(java.lang.String userName) {
		this.userName = userName;
	}

	public java.lang.String getLoginName() {
		return loginName;
	}

	public void setLoginName(java.lang.String loginName) {
		this.loginName = loginName;
	}

	public java.lang.String getEnName() {
		return enName;
	}

	public void setEnName(java.lang.String enName) {
		this.enName = enName;
	}

	public java.lang.String getSex() {
		return sex;
	}

	public void setSex(java.lang.String sex) {
		this.sex = sex;
	}

	public java.lang.String getTelephone() {
		return telephone;
	}

	public void setTelephone(java.lang.String telephone) {
		this.telephone = telephone;
	}

	public java.util.Date getBirthday() {
		return birthday;
	}

	public void setBirthday(java.util.Date birthday) {
		this.birthday = birthday;
	}

	public java.lang.String getTelephoneExt() {
		return telephoneExt;
	}

	public void setTelephoneExt(java.lang.String telephoneExt) {
		this.telephoneExt = telephoneExt;
	}

	public java.lang.String getEmail() {
		return email;
	}

	public void setEmail(java.lang.String email) {
		this.email = email;
	}

	public java.lang.String getMobilePhone() {
		return mobilePhone;
	}

	public void setMobilePhone(java.lang.String mobilePhone) {
		this.mobilePhone = mobilePhone;
	}

	public java.lang.String getMsn() {
		return msn;
	}

	public void setMsn(java.lang.String msn) {
		this.msn = msn;
	}

	public java.lang.String getFax() {
		return fax;
	}

	public void setFax(java.lang.String fax) {
		this.fax = fax;
	}

	public java.lang.String getMsn2() {
		return msn2;
	}

	public void setMsn2(java.lang.String msn2) {
		this.msn2 = msn2;
	}

	public java.lang.String getSkype() {
		return skype;
	}

	public void setSkype(java.lang.String skype) {
		this.skype = skype;
	}

	public java.lang.String getMsn3() {
		return msn3;
	}

	public void setMsn3(java.lang.String msn3) {
		this.msn3 = msn3;
	}

	public java.lang.String getQq() {
		return qq;
	}

	public void setQq(java.lang.String qq) {
		this.qq = qq;
	}

	public java.lang.String getJobDescription() {
		return jobDescription;
	}

	public void setJobDescription(java.lang.String jobDescription) {
		this.jobDescription = jobDescription;
	}

	public Long getSortNumber() {
		return sortNumber;
	}

	public void setSortNumber(long sortNumber) {
		this.sortNumber = sortNumber;
	}

	public java.lang.String getAddress() {
		return address;
	}

	public void setAddress(java.lang.String address) {
		this.address = address;
	}

	public java.lang.String getZip() {
		return zip;
	}

	public void setZip(java.lang.String zip) {
		this.zip = zip;
	}

	public java.lang.String getRemark() {
		return remark;
	}

	public void setRemark(java.lang.String remark) {
		this.remark = remark;
	}

	public java.lang.String getImagePath() {
		return imagePath;
	}

	public void setImagePath(java.lang.String imagePath) {
		this.imagePath = imagePath;
	}

	public java.lang.String getPassword() {
		return password;
	}

	public void setPassword(java.lang.String password) {
		this.password = password;
	}

	public Long getCompanyId() {
		return companyId;
	}

	public void setCompanyId(Long companyId) {
		this.companyId = companyId;
	}

	public Long getDepartmentId() {
		return departmentId;
	}

	public void setDepartmentId(Long departmentId) {
		this.departmentId = departmentId;
	}

	/**
	 * @return the companyName
	 */
	public String getCompanyName() {
		return companyName;
	}

	/**
	 * @param companyName the companyName to set
	 */
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	/**
	 * @return the departName
	 */
	public String getDepartName() {
		return departName;
	}

	/**
	 * @param departName the departName to set
	 */
	public void setDepartName(String departName) {
		this.departName = departName;
	}

	/**
	 * @param sortNumber the sortNumber to set
	 */
	public void setSortNumber(Long sortNumber) {
		this.sortNumber = sortNumber;
	}

	/**
	 * @return the isWork
	 */
	public String getIsWork() {
		return isWork;
	}

	/**
	 * @param isWork the isWork to set
	 */
	public void setIsWork(String isWork) {
		this.isWork = isWork;
	}

	
}