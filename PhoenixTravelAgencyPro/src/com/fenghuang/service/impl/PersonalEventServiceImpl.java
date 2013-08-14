/**
 * 
 */
package com.fenghuang.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fenghuang.dao.IPersonalEventDao;
import com.fenghuang.entiey.PersonalEvent;
import com.fenghuang.service.IPersonalEventService;
import com.fenghuang.util.Pagination;

/**
 * @author 鲍国浩
 * 
 * 版本 ： 1.0
 * 
 * 日期 ：2013-8-14
 *
 * 描述 ：
 *
 *
 */
@Service
public class PersonalEventServiceImpl implements IPersonalEventService {

	@Autowired
	private IPersonalEventDao iPersonalEventDao;
	@Override
	public boolean insertPersonalEvent(PersonalEvent personalEvent)
			throws Exception {
		return iPersonalEventDao.insertPersonalEvent(personalEvent);
	}

	@Override
	public Pagination<PersonalEvent> getPersonalEventPagination(Integer pages,
			Integer rows, Long userId) throws Exception {
		return iPersonalEventDao.getPersonalEventPagination(pages, rows, userId);
	}

}
