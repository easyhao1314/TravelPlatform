/**
 * 
 */
package com.fenghuang.dao.impl;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.fenghuang.dao.BaseDao;
import com.fenghuang.dao.IPersonalEventDao;
import com.fenghuang.entiey.PersonalEvent;
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
@Repository
public class PersonalEventDaoImpl extends BaseDao implements IPersonalEventDao {

	/**
	 * @param dataSource
	 */
	@Autowired
	public PersonalEventDaoImpl(@Qualifier("dataSource")DataSource dataSource) {
		super(dataSource);
		
	}

	@Override
	public boolean insertPersonalEvent(PersonalEvent personalEvent)
			throws Exception {
		String sql = "insert into personalevent (eventDesc,userid,eventDate,eventType) values (?,?,?,?)";
		int rows = this.update(sql, personalEvent.getEventDesc(),personalEvent.getUserId(),personalEvent.getEventDate(),personalEvent.getEventType());
		return false;
	}

	@Override
	public Pagination<PersonalEvent> getPersonalEventPagination(Integer pages,
			Integer rows, Long userId) throws Exception {
		StringBuffer sb = new StringBuffer("SELECT personalevent.id,personalevent.eventDesc,personalevent.userid,date_format( personalevent.eventDate,'%Y-%m-%d %H:%i:%s') as eventDate,personalevent.eventType,users.loginName FROM personalevent ,users WHERE personalevent.userid =  users.id");
		if(userId != null && userId != 0l){
			sb.append(" and users.id='");
			sb.append(userId);
			sb.append("'");
		}
		
		Pagination<PersonalEvent> pePaginas = this.getPagination(pages, rows,sb.toString());
		return pePaginas;
	}

}
