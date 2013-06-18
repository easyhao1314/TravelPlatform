package com.fenghuang.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fenghuang.dao.IMenuPermissionDao;
import com.fenghuang.entiey.MenuPermission;
import com.fenghuang.service.IMenuPermissionService;
import com.fenghuang.util.Pagination;

@Service
public class MenuPermissionServiceImpl implements IMenuPermissionService {

	@Autowired
	private IMenuPermissionDao iMenuPermissionDao;
	
	@Override
	public boolean saveMenuPermission(MenuPermission meunPermission)
			throws Exception {
		return iMenuPermissionDao.saveMenuPermission(meunPermission);
	}

	@Override
	public boolean updateMenuPermission(MenuPermission menuPermission)
			throws Exception {
		return iMenuPermissionDao.updateMenuPermission(menuPermission);
	}

	@Override
	public boolean deleteMenuPermissionById(Long id) throws Exception {
		return iMenuPermissionDao.deleteMenuPermissionById(id);
	}

	@Override
	public Pagination<MenuPermission> getPaginationMenuPermissions(
			int currentPage, int numPerPage, Long id, String mpNo,
			String mpName, String mpDesc, String functionNo) throws Exception {
		return iMenuPermissionDao.getPaginationMenuPermissions(currentPage, numPerPage, id, mpNo, mpName, mpDesc, functionNo);
	}

	@Override
	public MenuPermission getMenuPermissionById(Long id) throws Exception {
		return iMenuPermissionDao.getMenuPermissionById(id);
	}

}
