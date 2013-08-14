/**
 * 
 */
package com.fenghuang.web.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
@Controller
public class PersonalEventController {
	@Autowired
	private IPersonalEventService iPersonalEventService;
	
	
	@RequestMapping("fenghuang/getPersonalEvents.do")
	@ResponseBody
	public Map<String, Object> getPersonalEvents(HttpServletRequest request,
			HttpServletResponse response, Integer page, Integer rows,
			String userId){
		Long  longUserId = null;
		if(userId!=null && !"".equals(userId)){
			longUserId = Long.valueOf(userId);
		}
		try {
			Pagination<PersonalEvent> pes = iPersonalEventService.getPersonalEventPagination(page, rows, longUserId);
			List<Map<String, Object>> pesRows = pes.getResultList();
			Map<String, Object> returnValue = new HashMap<String, Object>();
			returnValue.put("total", pes.getTotalRows());
			returnValue.put("rows", pesRows);
			return returnValue;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
