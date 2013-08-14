/***********************************************************************
 * Module:  PersonalEvent.java
 * Author:  baoguohao
 * Purpose: Defines the Class PersonalEvent
 ***********************************************************************/
package com.fenghuang.entiey;

import java.util.*;

/**
 * 个人事件表
 * 
 * @pdOid 63c872d6-2bba-4898-9273-f50f6ec9c3a1
 */
public class PersonalEvent {
	/**
	 * 主键，自动增长
	 * 
	 * @pdOid 4ec7fd52-f090-44fb-ae17-d4e05c7f1749
	 */
	public long id;
	/** @pdOid 0434fffe-c838-4fe5-999e-f3a4ca2f2d6a */
	public String eventDesc;
	/**
	 * 操作时间
	 * 
	 * @pdOid 832ce55c-d42a-40ae-aa37-19f4dcd3096c
	 */
	public Date eventDate;
	/** 主要是操作的动作，比如：登陆操作，修改操作，删除操作等等 */
	public String eventType;
    public Long userId;
    //作为操作人的显示字段
    public String loginName;
	/**
	 * @return the id
	 */
	public long getId() {
		return id;
	}

	/**
	 * @param id
	 *            the id to set
	 */
	public void setId(long id) {
		this.id = id;
	}

	/**
	 * @return the eventDesc
	 */
	public String getEventDesc() {
		return eventDesc;
	}

	/**
	 * @param eventDesc
	 *            the eventDesc to set
	 */
	public void setEventDesc(String eventDesc) {
		this.eventDesc = eventDesc;
	}

	/**
	 * @return the eventDate
	 */
	public Date getEventDate() {
		return eventDate;
	}

	/**
	 * @param eventDate
	 *            the eventDate to set
	 */
	public void setEventDate(Date eventDate) {
		this.eventDate = eventDate;
	}

	/**
	 * @return the eventType
	 */
	public String getEventType() {
		return eventType;
	}

	/**
	 * @param eventType
	 *            the eventType to set
	 */
	public void setEventType(String eventType) {
		this.eventType = eventType;
	}

	/**
	 * @return the userId
	 */
	public Long getUserId() {
		return userId;
	}

	/**
	 * @param userId the userId to set
	 */
	public void setUserId(Long userId) {
		this.userId = userId;
	}

	/**
	 * @return the loginName
	 */
	public String getLoginName() {
		return loginName;
	}

	/**
	 * @param loginName the loginName to set
	 */
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
	
}