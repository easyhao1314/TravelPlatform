/**
 * 
 */
package com.fenghuang.service;

import com.fenghuang.entiey.PersonalEvent;
import com.fenghuang.util.Pagination;

/**
 * @author 鲍国浩
 * 
 *         版本 ： 1.0
 * 
 *         日期 ：2013-8-14
 * 
 *         描述 ：
 *    
 * 
 */
public interface IPersonalEventService {
	
	public boolean insertPersonalEvent(PersonalEvent personalEvent)
			throws Exception;

	public Pagination<PersonalEvent> getPersonalEventPagination(Integer pages,
			Integer rows, Long userId) throws Exception;
}
