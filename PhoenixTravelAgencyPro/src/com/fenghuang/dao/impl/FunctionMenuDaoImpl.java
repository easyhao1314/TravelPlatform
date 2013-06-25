/**
 * 
 */
package com.fenghuang.dao.impl;

import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.fenghuang.dao.BaseDao;
import com.fenghuang.dao.IFunctionMenuDao;
import com.fenghuang.entiey.FunctionMenu;
import com.fenghuang.util.Pagination;
import com.google.common.base.Function;

/**
 * @author 鲍国浩
 * 
 * 版本 ： 1.0
 * 
 * 日期 ：2013-6-17
 *
 * 描述 ：
 *
 *
 */
@Repository
public class FunctionMenuDaoImpl extends BaseDao implements IFunctionMenuDao {
	
	@Autowired
	public FunctionMenuDaoImpl(@Qualifier("dataSource")DataSource dataSource){
		super(dataSource);
		
	}
	/* (non-Javadoc)
	 * @see com.fenghuang.dao.IFunctionMenuDao#saveFunctionMenu(com.fenghuang.entiey.FunctionMenu)
	 */
	@Override
	public boolean saveFunctionMenu(FunctionMenu functionMenu) throws Exception {
	    String sql = "insert into functionmenu (menuNo,meunName,menuType,imagePath,parentId,sortNo,menuPath) values(?,?,?,?,?,?,?)";
		int rs = this.update(sql, functionMenu.getMenuNo(),functionMenu.getMeunName(),functionMenu.getMenuType(),functionMenu.getImagePath(),functionMenu.getParentId(),functionMenu.getSortNo(),functionMenu.getMenuPath());
	    return rs >0 ;
	}

	/* (non-Javadoc)
	 * @see com.fenghuang.dao.IFunctionMenuDao#updateFunctionMenu(com.fenghuang.entiey.FunctionMenu)
	 */
	@Override
	public boolean updateFunctionMenu(FunctionMenu functionMenu)
			throws Exception {
	   String sql = "update functionmenu set menuNo=?,meunName=?,menuType=?,imagePath=?,parentId=?,sortNo=?,menuPath=? where id=?";
	   int rs = this.update(sql,functionMenu.getMenuNo(),functionMenu.getMeunName(),functionMenu.getMenuType(),functionMenu.getImagePath(),functionMenu.getParentId(),functionMenu.getSortNo(),functionMenu.getMenuPath(),functionMenu.getId());
		return rs > 0;
	}

	/* (non-Javadoc)
	 * @see com.fenghuang.dao.IFunctionMenuDao#getFunctionMenuById(java.lang.Long)
	 */
	@Override
	public FunctionMenu getFunctionMenuById(Long id) throws Exception {
	  String sql = "select * from functionmenu where id =?";
	  FunctionMenu fm = this.queryForObject(sql, FunctionMenu.class,id);
       
		return fm;
	}

	/* (non-Javadoc)
	 * @see com.fenghuang.dao.IFunctionMenuDao#getPaginationFunctionMenu(int, int, java.lang.Long, java.lang.String, java.lang.String, java.lang.String, java.lang.Long)
	 */
	@Override
	public Pagination<FunctionMenu> getPaginationFunctionMenu(int currentPage,
			int numPerPage, Long id, String menuNo, String menuName,
			String menuPath, Long parentId,String sortNo,String menuType) throws Exception {
		StringBuffer sql = new StringBuffer("SELECT sub.id,sub.menuNo,sub.meunName,sub.menuType,sub.imagePath,sub.parentId,sub.sortNo,sub.menuPath,parent.meunName AS parentName,if(sub.menuType=1,'主菜单','子菜单') as menuTypeName FROM functionmenu  as sub,functionmenu as parent   where sub.parentId = parent.id  and 1=1");
		if(id != null && id != 0){
			sql.append(" and  sub.id ='");
			sql.append(id);
			sql.append("'");
			
		}
		if(menuName != null && !"".equals(menuName)){
			sql.append(" and  sub.meunName like '");
			sql.append(menuName);
			sql.append("%'");
			
		}
		if(menuPath != null && !"".equals(menuPath)){
			sql.append(" and  sub.menuPath like '");
			sql.append(menuPath);
			sql.append("%'");
			
		}
		if(parentId != null && parentId!=0){
			sql.append(" and  parent.id ='");
			sql.append(parentId);
			sql.append("'");
			
		}
		if(sortNo != null && !"".equals(sortNo)){
			sql.append(" and  sub.sortNo ='");
			sql.append(sortNo);
			sql.append("'");
			
		}
		if(menuType != null && !"".equals(menuType)){
			sql.append(" and  sub.menuType ='");
			sql.append(menuType);
			sql.append("'");
			
		}
		
	    Pagination<FunctionMenu>  fms = this.getPagination(currentPage, numPerPage, sql.toString());
		return fms;
	}
	/* 
	 * @see com.fenghuang.dao.IFunctionMenuDao#deleteFunctionMeunById(java.lang.Long)
	 */
	@Override
	public boolean deleteFunctionMeunById(Long id) throws Exception {
		String sql = "delete from functionmenu where id =?";
		int rs = this.update(sql,id);
		
		return rs>0;
	}
	/* 
	 * @see com.fenghuang.dao.IFunctionMenuDao#getFunctionMenuComboboxs()
	 */
	@Override
	public List<Map<String, Object>> getFunctionMenuComboboxs()
			throws Exception {
		String sql ="select id,meunName from functionmenu";
		List<Map<String, Object>> funcs = this.queryForList(sql);
		
		return funcs;
	}

}
