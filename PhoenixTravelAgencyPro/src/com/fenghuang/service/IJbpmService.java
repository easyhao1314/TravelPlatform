/**
 * 
 */
package com.fenghuang.service;

import java.util.Map;

/**
 * @author 鲍国浩
 * 
 * 版本 ： 1.0
 * 
 * 日期 ：2013-8-25
 *
 * 描述 ：主要是处理用户审批流的操作
 *
 *
 */
public interface IJbpmService {
	/**
	 *  审批操作。
	 * @param tuanNumber 团号
	 * @param param   参数包括用户id和其他的参数
	 * {"userId":value,submittype:value}
	 * @return
	 * @throws Exception
	 */
	public Long  submitApproval(String tuanNumber,Map param) throws Exception;
	
	
}
