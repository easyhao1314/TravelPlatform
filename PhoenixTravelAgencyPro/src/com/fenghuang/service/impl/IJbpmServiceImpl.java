/**
 * 
 */
package com.fenghuang.service.impl;

import java.util.Map;

import org.springframework.stereotype.Service;

import com.fenghuang.service.IJbpmService;
import com.fenghuang.util.ShowConstant;

/**
 * @author 鲍国浩
 * 
 *         版本 ： 1.0
 * 
 *         日期 ：2013-8-25
 * 
 *         描述 ：
 * 
 * 
 */
@Service
public class IJbpmServiceImpl implements IJbpmService {

	@Override
	public Long submitApproval(String tuanNumber, Map param) throws Exception {
		String submitType = (String) param.get(ShowConstant.SUBMIT_TYPE);
		if (ShowConstant.SUBMIT_DANTUAN_OPERATE.equals(submitType)) {

		} else if (ShowConstant.SUBMIT_CAIWU_OPERATE.equals(submitType)) {

		}
		return 0l;
	}

}
