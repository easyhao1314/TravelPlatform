/**
 * 
 */
package com.fenghuang.dao;

import com.fenghuang.entiey.Currency;
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
public interface ICurrencyDao {

	/**
	 * 保存币种的单条记录
	 * 
	 * @param currency
	 * @return
	 * @throws Exception
	 */
	public boolean insertCurrency(Currency currency) throws Exception;

	/**
	 * 更新币种记录，一定要有id。不然就会保存
	 * 
	 * @param currency
	 * @return
	 * @throws Exception
	 */
	public boolean updateCurrency(Currency currency) throws Exception;

	/**
	 * 根据当前页数和每页显示多少条数据来，得到
	 * 
	 * @param currentPage
	 * @param numPerPage
	 * @param currencyName
	 * @param currencyShort
	 * @return
	 * @throws Exception
	 */
	public Pagination<Currency> getCurrencyPaginations(int currentPage,
			int numPerPage, String currencyName, String currencyShort)
			throws Exception;
	

}
