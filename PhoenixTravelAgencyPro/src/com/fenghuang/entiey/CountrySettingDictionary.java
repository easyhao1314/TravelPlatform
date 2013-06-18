/***********************************************************************
 * Module:  CountrySettingDictionary.java
 * Author:  baoguohao
 * Purpose: Defines the Class CountrySettingDictionary
 ***********************************************************************/
package com.fenghuang.entiey;


/**
 * 旅游国家设置
 * 
 * @pdOid fc6d570e-cdc8-4449-94dd-3e1a27c34bad
 */
public class CountrySettingDictionary {
	/**
	 * 编号
	 * 
	 * @pdOid 2a0ef89a-6f38-4d20-985b-cef7e053f7d4
	 */
	public String csdNo;
	/**
	 * 州id  外键不要了 可以从dictionarydesc表中类获得
	 */
	public String stateId;
	/**
	 * 地区id 外键不要了 可以从dictionarydesc表中类获得
	 */
	public String areaId;
	/**
	 * 名称
	 * 
	 * @pdOid 688e3569-088d-4021-be60-bc558bb22825
	 */
	public String csdName;
	/**
	 * 英文名称
	 * 
	 * @pdOid e66c7f58-db82-4399-b2b4-5237ae117a7d
	 */
	public String csdEnName;
	/**
	 * 币种
	 * 
	 * @pdOid 43c49c89-b8fb-4b4b-990c-62d4604b23f5
	 */
	public String csdCurrency;
	
	/**
	 * 5人以下签证费
	 */
	public Float  minVisaFees; 
	/**
	 * 5人以上签证费
	 */
	public Float  maxVisFees;
	/**
	 * 邀请函费用
	 */
	private Float invitationCosts;
	/**
	 * 任务费用
	 */
	private Float taskCosts;
	
	
	/**
	 * @return the csdNo
	 */
	public String getCsdNo() {
		return csdNo;
	}

	/**
	 * @param csdNo
	 *            the csdNo to set
	 */
	public void setCsdNo(String csdNo) {
		this.csdNo = csdNo;
	}

	/**
	 * @return the csdName
	 */
	public String getCsdName() {
		return csdName;
	}

	/**
	 * @param csdName
	 *            the csdName to set
	 */
	public void setCsdName(String csdName) {
		this.csdName = csdName;
	}

	/**
	 * @return the csdEnName
	 */
	public String getCsdEnName() {
		return csdEnName;
	}

	/**
	 * @param csdEnName
	 *            the csdEnName to set
	 */
	public void setCsdEnName(String csdEnName) {
		this.csdEnName = csdEnName;
	}

	/**
	 * @return the csdCurrency
	 */
	public String getCsdCurrency() {
		return csdCurrency;
	}

	/**
	 * @param csdCurrency
	 *            the csdCurrency to set
	 */
	public void setCsdCurrency(String csdCurrency) {
		this.csdCurrency = csdCurrency;
	}




	public String getStateId() {
		return stateId;
	}

	public void setStateId(String stateId) {
		this.stateId = stateId;
	}

	public String getAreaId() {
		return areaId;
	}

	public void setAreaId(String areaId) {
		this.areaId = areaId;
	}

	public Float getMinVisaFees() {
		return minVisaFees;
	}

	public void setMinVisaFees(Float minVisaFees) {
		this.minVisaFees = minVisaFees;
	}

	public Float getMaxVisFees() {
		return maxVisFees;
	}

	public void setMaxVisFees(Float maxVisFees) {
		this.maxVisFees = maxVisFees;
	}

	public Float getInvitationCosts() {
		return invitationCosts;
	}

	public void setInvitationCosts(Float invitationCosts) {
		this.invitationCosts = invitationCosts;
	}

	public Float getTaskCosts() {
		return taskCosts;
	}

	public void setTaskCosts(Float taskCosts) {
		this.taskCosts = taskCosts;
	}


	


}