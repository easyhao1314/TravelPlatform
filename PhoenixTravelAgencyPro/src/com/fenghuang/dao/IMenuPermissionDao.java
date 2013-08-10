package com.fenghuang.dao;

import java.util.List;

import com.fenghuang.entiey.MenuPermission;
import com.fenghuang.util.Pagination;

/**
 * 
 * @author 鲍国浩
 * 
 *         日期 @2013-6-18
 * 
 *         描述：
 * 
 * 
 * 
 */
public interface IMenuPermissionDao {
   
	public boolean saveMenuPermission(MenuPermission meunPermission)throws Exception;
	
	public boolean updateMenuPermission(MenuPermission menuPermission) throws Exception;
	
	public boolean deleteMenuPermissionById(Long id) throws Exception;
	
	
	public Pagination<MenuPermission> getPaginationMenuPermissions(int currentPage,
			int numPerPage,Long id,String mpNo,String mpName,String mpDesc,String functionNo)throws Exception;
	
	public MenuPermission  getMenuPermissionById(Long id) throws Exception;

	
	
}
