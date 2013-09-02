/**
 * 
 */
package com.fenghuang.dao.impl;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.fenghuang.dao.BaseDao;
import com.fenghuang.dao.IPicManageDao;
import com.fenghuang.entiey.PicManage;
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
@Repository
public class PicManageDaoImpl extends BaseDao implements IPicManageDao {

	/**
	 * @param dataSource
	 */
	@Autowired
	public PicManageDaoImpl(@Qualifier("dataSource")DataSource dataSource) {
		super(dataSource);
		
	}

	@Override
	public boolean insertPicManageDao(PicManage picManage) {
		String sql = "insert into picmanage (name,url,searchName) values(?,?,?)";
		int rs = this.update(sql,picManage.getName(),picManage.getUrl(),picManage.getSearchName());
		return rs >0 ;
	}

	@Override
	public Pagination<PicManage> getPicManagePagination(int currentPage,
			int numPerPage, String searchName) {
		StringBuffer sql = new StringBuffer("SELECT picmanage.id,picmanage.name,picmanage.url,picmanage.searchName from  picmanage where 1=1");
		
		if(searchName != null && !"".equals(searchName)){
			sql.append(" and picmanage.searchName  like '%");
			sql.append(searchName);
			sql.append("%'");
			
		}
		Pagination<PicManage>  pics = this.getPagination(currentPage, numPerPage, sql.toString());
		
		return pics;
	}

}
