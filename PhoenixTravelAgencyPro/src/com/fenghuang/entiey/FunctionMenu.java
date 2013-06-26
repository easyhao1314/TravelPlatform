/***********************************************************************
 * Module:  FunctionMenu.java
 * Author:  baoguohao
 * Purpose: Defines the Class FunctionMenu
 ***********************************************************************/
package com.fenghuang.entiey;

import java.util.*;

/**
 * 功能菜单
 * 
 * @pdOid ae92e18f-35a5-464d-974f-c1ec9e35880c
 */
public class FunctionMenu {
	/**
	 * 主键，自动增长列
	 * 
	 * @pdOid 4e5b7c9b-9f9f-44b1-b1bf-9ace8e65b0e3
	 */
	public long id;
	/**
	 * 菜单编码
	 * 
	 * @pdOid 01029f9e-b37c-4432-b3b3-daab43ce9ee5
	 */
	public String menuNo;
	/**
	 * 菜单名字
	 * 
	 * @pdOid fa5cfe9d-4dfe-455b-856e-028efe5291cc
	 */
	public String meunName;
	/**
	 * 菜单类型  1：主菜单，2：子菜单
	 * 
	 * @pdOid 40ef5836-4608-425e-a623-3abe114e87e0
	 */
	public long menuType;
	/**
	 * 对应图标的的路径
	 * 
	 * @pdOid 5ce4ace0-47af-4cee-b215-e9677091e10a
	 */
	public String imagePath;
	/**
	 * 排序号
	 * 
	 * @pdOid cac355a5-5811-46d4-9746-40309bb69902
	 */
	public long sortNo;
	/**
	 * 菜单路径
	 * 
	 * @pdOid d56c3e06-2c73-4be4-87f4-6027408b2dcd
	 */
	public String menuPath;

	public Long parentId;

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
	 * @return the menuNo
	 */
	public String getMenuNo() {
		return menuNo;
	}

	/**
	 * @param menuNo
	 *            the menuNo to set
	 */
	public void setMenuNo(String menuNo) {
		this.menuNo = menuNo;
	}

	/**
	 * @return the meunName
	 */
	public String getMeunName() {
		return meunName;
	}

	/**
	 * @param meunName
	 *            the meunName to set
	 */
	public void setMeunName(String meunName) {
		this.meunName = meunName;
	}

	/**
	 * @return the menuType
	 */
	public long getMenuType() {
		return menuType;
	}

	/**
	 * @param menuType
	 *            the menuType to set
	 */
	public void setMenuType(long menuType) {
		this.menuType = menuType;
	}

	/**
	 * @return the imagePath
	 */
	public String getImagePath() {
		return imagePath;
	}

	/**
	 * @param imagePath
	 *            the imagePath to set
	 */
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	/**
	 * @return the sortNo
	 */
	public long getSortNo() {
		return sortNo;
	}

	/**
	 * @param sortNo
	 *            the sortNo to set
	 */
	public void setSortNo(long sortNo) {
		this.sortNo = sortNo;
	}

	/**
	 * @return the menuPath
	 */
	public String getMenuPath() {
		return menuPath;
	}

	/**
	 * @param menuPath
	 *            the menuPath to set
	 */
	public void setMenuPath(String menuPath) {
		this.menuPath = menuPath;
	}

	/**
	 * @return the parentId
	 */
	public Long getParentId() {
		return parentId;
	}

	/**
	 * @param parentId
	 *            the parentId to set
	 */
	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (int) (id ^ (id >>> 32));
		result = prime * result
				+ ((imagePath == null) ? 0 : imagePath.hashCode());
		result = prime * result + ((menuNo == null) ? 0 : menuNo.hashCode());
		result = prime * result
				+ ((menuPath == null) ? 0 : menuPath.hashCode());
		result = prime * result + (int) (menuType ^ (menuType >>> 32));
		result = prime * result
				+ ((meunName == null) ? 0 : meunName.hashCode());
		result = prime * result
				+ ((parentId == null) ? 0 : parentId.hashCode());
		result = prime * result + (int) (sortNo ^ (sortNo >>> 32));
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		FunctionMenu other = (FunctionMenu) obj;
		if (id != other.id)
			return false;
		if (imagePath == null) {
			if (other.imagePath != null)
				return false;
		} else if (!imagePath.equals(other.imagePath))
			return false;
		if (menuNo == null) {
			if (other.menuNo != null)
				return false;
		} else if (!menuNo.equals(other.menuNo))
			return false;
		if (menuPath == null) {
			if (other.menuPath != null)
				return false;
		} else if (!menuPath.equals(other.menuPath))
			return false;
		if (menuType != other.menuType)
			return false;
		if (meunName == null) {
			if (other.meunName != null)
				return false;
		} else if (!meunName.equals(other.meunName))
			return false;
		if (parentId == null) {
			if (other.parentId != null)
				return false;
		} else if (!parentId.equals(other.parentId))
			return false;
		if (sortNo != other.sortNo)
			return false;
		return true;
	}

}