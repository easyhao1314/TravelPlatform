/**
 * 
 */
package com.fenghuang.dao;

import com.fenghuang.entiey.PersonalEvent;
import com.fenghuang.util.Pagination;

/**
 * @author 鲍国浩
 * 
 * 版本 ： 1.0
 * 
 * 日期 ：2013-8-14
 *
 * 描述 ：操作个人事件dao。  就是对用户的主要操作，做一些记录而已
 *
 *
 */
public interface IPersonalEventDao {
	
	public boolean  insertPersonalEvent(PersonalEvent personalEvent) throws Exception;
	
	public Pagination<PersonalEvent> getPersonalEventPagination(Integer pages,Integer rows,Long userId)throws Exception;
	
	
	

}
