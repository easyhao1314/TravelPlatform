/**
 * 
 */
package com.fenghuang.dao;

import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;

import com.fenghuang.util.Pagination;

/**
 * @author 鲍国浩
 * 
 * 版本 ： 1.0
 * 
 * 日期 ：2013-5-27
 *
 * 描述 ： 最基层的Dao 可以实现
 * @param <T>
 *
 *
 */
public class BaseDao extends JdbcTemplate {
	
	/**
	 * 构造函数，在dao中操作重写，并调用super
	 * @param dataSource
	 */
	public BaseDao(DataSource dataSource){
		super(dataSource);
	}
	
	/**
	 * 获取分页对象。
	 * 按照sql的查询语句，将结果集份分页。
	 * @param currentPage   当前页数
	 * @param numPerPage    每页显示多少条数据
	 * @param sql   要执行的sql。 这里sql字段必须和在页面中的dataGrid的 field一样。
	 * @return
	 */
	public <T> Pagination<T>  getPagination(int currentPage,int numPerPage,String sql){
		Pagination<T>  page = new Pagination<T>();
		page.setNumPerPage(numPerPage);
		page.setCurrentPage(currentPage);
		String totalSql = " select count(*) from ("+sql+") totalTable";
		int totalCount = this.queryForInt(totalSql);
		page.setTotalRows(totalCount);
		page.setTotalPages();
		page.setStartIndex();
		
		String querySql = " select * from ("+sql+") queryTable limit "+page.getStartIndex()+","+page.getNumPerPage();
		List<Map<String, Object>>  list =this.queryForList(querySql);
		page.setResultList(list);
		return page;
		
	}
     
}
