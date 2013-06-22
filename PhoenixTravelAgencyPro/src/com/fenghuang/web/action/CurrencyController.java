/**
 * 
 */
package com.fenghuang.web.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fenghuang.entiey.Currency;
import com.fenghuang.service.ICurrencyService;
import com.fenghuang.util.Pagination;

/**
 * @author 鲍国浩
 * 
 *         版本 ： 1.0
 * 
 *         日期 ：2013-6-8
 * 
 *         描述 ：
 * 
 * 
 */
@Controller
public class CurrencyController {

	@Autowired
	private ICurrencyService iCurrencyService;

	@RequestMapping("fenghuang/currencylist.do")
	@ResponseBody
	public Map<String, Object> getCurrencyList(HttpServletRequest request,
			HttpServletResponse response,HttpSession session, String currencyName,
			String currencyShort, Integer page, Integer rows) {

		try {
			Pagination<Currency> currencyPagings = iCurrencyService
					.getCurrencyPaginations(page, rows, currencyName,
							currencyShort);
			List<Map<String, Object>> currencyRows = currencyPagings
					.getResultList();
			Map<String, Object> returnValue = new HashMap<String, Object>();
			returnValue.put("total", currencyPagings.getTotalRows());
			returnValue.put("rows", currencyRows);
			return returnValue;
		} catch (Exception e) {

			e.printStackTrace();
		}
		return null;
	}

	public Map<String, Object> updateCurrency(HttpServletRequest request,
			HttpServletResponse response, String updateRows) {
		
		
		
		return null;

	}

}
