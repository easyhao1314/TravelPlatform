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

import com.fenghuang.entiey.PicManage;
import com.fenghuang.service.IPicManageService;
import com.fenghuang.util.Pagination;

/**
 * @author 鲍国浩
 * 
 * 版本 ： 1.0
 * 
 * 日期 ：2013-9-2
 *
 * 描述 ：
 *
 *
 */
@Controller
public class PicManageController {
	@Autowired
	private IPicManageService  iPicManageService;
	
	@RequestMapping("fenghuang/getPicManages.do")
	@ResponseBody
	public Map<String, Object> getPicManages(HttpServletRequest request,
			HttpServletResponse response, Integer page, Integer rows,
			String searchName) {

		try {
			Pagination<PicManage> pics = iPicManageService.getPicManagePagination(page, rows, searchName);
			List<Map<String, Object>> picRows = pics.getResultList();
			Map<String, Object> returnValue = new HashMap<String, Object>();
			returnValue.put("total", pics.getTotalRows());
			returnValue.put("rows", picRows);
			return returnValue;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	

}
