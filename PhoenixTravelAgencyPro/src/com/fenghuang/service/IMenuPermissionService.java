package com.fenghuang.service;

import java.util.List;

import com.fenghuang.entiey.MenuPermission;
import com.fenghuang.util.Pagination;

public interface IMenuPermissionService {
	public boolean saveMenuPermission(MenuPermission meunPermission)throws Exception;
	
	public boolean updateMenuPermission(MenuPermission menuPermission) throws Exception;
	
	public boolean deleteMenuPermissionById(Long id) throws Exception;
	
	
	public Pagination<MenuPermission> getPaginationMenuPermissions(int currentPage,
			int numPerPage,Long id,String mpNo,String mpName,String mpDesc,String functionNo)throws Exception;
	
	public MenuPermission  getMenuPermissionById(Long id) throws Exception;
	
	
	public void updateMenuPermissions(List<MenuPermission> mps)throws Exception;
	
	public void deleteMenuPermissions(List<MenuPermission> mps)throws Exception;
}
