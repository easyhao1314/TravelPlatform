/**
 * 
 */
package com.fenghuang.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fenghuang.dao.ICurrencyDao;
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
@Service
public class CurrencyServiceImpl implements ICurrencyService {

	@Autowired
	private ICurrencyDao iCurrencyDao;
	
	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.fenghuang.service.ICurrencyService#insertCurrency(com.fenghuang.entiey
	 * .Currency)
	 */
	@Override
	public boolean insertCurrency(Currency currency) throws Exception {
		return iCurrencyDao.insertCurrency(currency);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.fenghuang.service.ICurrencyService#updateCurrency(com.fenghuang.entiey
	 * .Currency)
	 */
	@Override
	public boolean updateCurrency(Currency currency) throws Exception {
		return iCurrencyDao.updateCurrency(currency);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.fenghuang.service.ICurrencyService#getCurrencyPaginations(int,
	 * int, java.lang.String, java.lang.String)
	 */
	@Override
	public Pagination<Currency> getCurrencyPaginations(int currentPage,
			int numPerPage, String currencyName, String currencyShort)
			throws Exception {
		return iCurrencyDao.getCurrencyPaginations(currentPage, numPerPage, currencyName, currencyShort);
	}

}
