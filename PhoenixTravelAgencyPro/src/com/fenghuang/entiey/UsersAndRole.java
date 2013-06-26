/**
 * 
 */
package com.fenghuang.entiey;

import java.io.Serializable;

/**
 * @author 鲍国浩
 * 
 * 版本 ： 1.0
 * 
 * 日期 ：2013-6-25
 *
 * 描述 :用户和角色的关系表对应的类
 *
 *
 */
public class UsersAndRole implements Serializable{
	/**
	 * 表示列，自动增长
	 */
	private Long id ;
	/**
	 * 用户信息id
	 */
	private Long userId;
	/**
	 * 角色id
	 */
	private Long roleId;
	/**
	 * 权限编号，通过uuid产品，避免暴露id
	 */
	private String roleCode;
	/**
	 * @return the id
	 */
	public Long getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(Long id) {
		this.id = id;
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
	 * @return the roleId
	 */
	public Long getRoleId() {
		return roleId;
	}
	/**
	 * @param roleId the roleId to set
	 */
	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}
	public String getRoleCode() {
		return roleCode;
	}
	public void setRoleCode(String roleCode) {
		this.roleCode = roleCode;
	}
	

}
