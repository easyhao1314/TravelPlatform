/**
 * 
 */
package com.fenghuang.dao.impl;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.fenghuang.dao.BaseDao;
import com.fenghuang.dao.ICurrencyDao;
import com.fenghuang.entiey.Currency;
import com.fenghuang.util.Pagination;

/**
 * @author 鲍国浩
 * 
 * 版本 ： 1.0
 * 
 * 日期 ：2013-6-8
 *
 * 描述 ：
 *
 *
 */
@Repository
public class CurrencyDaoImpl extends BaseDao implements ICurrencyDao {
	
	@Autowired
	public CurrencyDaoImpl(@Qualifier("dataSource")DataSource dataSource){
		super(dataSource);
	}

	/* (non-Javadoc)
	 * @see com.fenghuang.dao.ICurrencyDao#insertCurrency(com.fenghuang.entiey.Currency)
	 */
	@Override
	public boolean insertCurrency(Currency currency) throws Exception {
		String sql ="insert into currency (currencyName,currencyShort,symbol,currDesc,isUes) values(?,?,?,?,?)";
		int rs =this.update(sql, currency.getCurrencyName(),currency.getCurrencyShort(),currency.getSymbol(),currency.getCurrDesc(),currency.getIsUes());
		return rs>0;
	}

	/* (non-Javadoc)
	 * @see com.fenghuang.dao.ICurrencyDao#updateCurrency(com.fenghuang.entiey.Currency)
	 */
	@Override
	public boolean updateCurrency(Currency currency) throws Exception {
		String sql = "update currency set currencyName=?,currencyShort=?,symbol=?,currDesc=?,isUes=? where id=?";
		int rs =this.update(sql, currency.getCurrencyName(),currency.getCurrencyShort(),currency.getSymbol(),currency.getCurrDesc(),currency.getIsUes(),currency.getId());
		
		return rs >0;
	}

	/* (non-Javadoc)
	 * @see com.fenghuang.dao.ICurrencyDao#getCurrencyPaginations(int, int, java.lang.String, java.lang.String)
	 */
	@Override
	public Pagination<Currency> getCurrencyPaginations(int currentPage,
			int numPerPage, String currencyName, String currencyShort)
			throws Exception {
		StringBuffer sql = new StringBuffer();
		sql.append("select * from currency where 1=1 ");
		
		if(currencyName!=null&&!"".equals(currencyName)){
			
			sql.append(" and currencyName like '");
			sql.append(currencyName);
			sql.append("%'");
		}
		
		if(currencyShort != null && !"".equals(currencyShort)){
			sql.append(" and currencyShort like '");
			sql.append(currencyShort);
			sql.append("%'");
		}
		Pagination<Currency> pages= this.getPagination(currentPage, numPerPage, sql.toString());
		return pages;

	}

}
