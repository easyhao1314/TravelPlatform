/**
 * 
 */
package com.fenghuang.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fenghuang.dao.Idantuan;
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
	
	@Autowired
	public Idantuan idantuan;

	@Override
	public Long submitApproval(String tuanNumber, Map param) throws Exception {
		String submitType = (String) param.get(ShowConstant.SUBMIT_TYPE);
		if (ShowConstant.SUBMIT_DANTUAN_OPERATE.equals(submitType)) {
           //冬青，添加代码的地方
		} else if (ShowConstant.SUBMIT_CAIWU_OPERATE.equals(submitType)) {
          //赵月龙，添加代码的地方
		}
		
		Map map = new HashMap<String,Object>();
		
		
		map.put("userId","999000");
		map.put(ShowConstant.SUBMIT_TYPE, ShowConstant.SUBMIT_DANTUAN_OPERATE);
		
		
		
		
		
		
		
		
		
		return 0l;
	}

}
