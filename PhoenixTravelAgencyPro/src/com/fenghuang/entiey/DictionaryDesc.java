/***********************************************************************
 * Module:  DictionaryDesc.java
 * Author:  baoguohao
 * Purpose: Defines the Class DictionaryDesc
 ***********************************************************************/
package com.fenghuang.entiey;

import java.util.*;

/**
 * 项目字典表
 * 
 * @pdOid a3fcf1f6-a2d7-45e9-b38b-321a8195badd
 */
public class DictionaryDesc {
	/**
	 * 编号
	 * 
	 * @pdOid 6c888ec1-ac62-481f-87a6-0e32b8c117c1
	 */
	public Integer dicNo;
	public Integer getDicNo() {
		return dicNo;
	}

	public void setDicNo(Integer dicNo) {
		this.dicNo = dicNo;
	}

	/**
	 * 名称
	 * 
	 * @pdOid 6c040b0f-4b83-4f0f-8af2-df7b5357b01e
	 */
	public String dicName;
	/**
	 * 帮助说明
	 * 
	 * @pdOid 1e242f6a-e0a7-4da7-ab80-66b5bbc938f8
	 */
	public String dicHelp;
	/**
	 * 显示顺序
	 * 
	 * @pdOid bc4d6b4f-d51a-4845-8830-c924a8ad57da
	 */
	public int dicSortNo;
	/**
	 * 说明
	 * 
	 * @pdOid 7c67d0cf-5f27-41c8-a1ef-fe657ec4e7cb
	 */
	public String dicDesc;
	/**
	 * 自增dicId
	 */
	public Long dicId;

	
	/**
	 * @return the dicName
	 */
	public String getDicName() {
		return dicName;
	}

	/**
	 * @param dicName
	 *            the dicName to set
	 */
	public void setDicName(String dicName) {
		this.dicName = dicName;
	}

	/**
	 * @return the dicHelp
	 */
	public String getDicHelp() {
		return dicHelp;
	}

	/**
	 * @param dicHelp
	 *            the dicHelp to set
	 */
	public void setDicHelp(String dicHelp) {
		this.dicHelp = dicHelp;
	}

	/**
	 * @return the dicSortNo
	 */
	public int getDicSortNo() {
		return dicSortNo;
	}

	/**
	 * @param dicSortNo
	 *            the dicSortNo to set
	 */
	public void setDicSortNo(int dicSortNo) {
		this.dicSortNo = dicSortNo;
	}

	/**
	 * @return the dicDesc
	 */
	public String getDicDesc() {
		return dicDesc;
	}

	/**
	 * @param dicDesc
	 *            the dicDesc to set
	 */
	public void setDicDesc(String dicDesc) {
		this.dicDesc = dicDesc;
	}

	/**
	 * @return the dicType
	 */
	public int getDicType() {
		return dicType;
	}

	/**
	 * @param dicType
	 *            the dicType to set
	 */
	public void setDicType(int dicType) {
		this.dicType = dicType;
	}

	/**
	 * 1：巴士-用车性质字典 2：交通-乘车类型字典3：早餐-餐标字典维护 4：午餐-餐标字典维护 5：晚餐-餐标字典维护 6：导游-服务类型字典
	 * 7：导游-导游类型字典等 可以扩展
	 * 
	 * @pdOid 8e801f3d-1785-4c9d-9341-e7a2bc0886b0
	 */
	public int dicType;

	/**
	 * @return the dicId
	 */
	public Long getDicId() {
		return dicId;
	}

	/**
	 * @param dicId the dicId to set
	 */
	public void setDicId(Long dicId) {
		this.dicId = dicId;
	}

}