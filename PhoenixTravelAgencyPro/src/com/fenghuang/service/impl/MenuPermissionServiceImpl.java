package com.fenghuang.service.impl;

import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fenghuang.dao.IMenuPermissionDao;
import com.fenghuang.dao.IRoleAndMenuPermissionDao;
import com.fenghuang.entiey.MenuPermission;
import com.fenghuang.service.IMenuPermissionService;
import com.fenghuang.util.Pagination;

@Service
public class MenuPermissionServiceImpl implements IMenuPermissionService {

	@Autowired
	private IMenuPermissionDao iMenuPermissionDao;
	@Autowired
	private IRoleAndMenuPermissionDao iRoleAndMenuPermissionDao;
	
	@Override
	public boolean saveMenuPermission(MenuPermission meunPermission)
			throws Exception {
		if(meunPermission.getId() != null && meunPermission.getId() != 0 ){
			return iMenuPermissionDao.updateMenuPermission(meunPermission);
		}else{
			return iMenuPermissionDao.saveMenuPermission(meunPermission);
		}
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

	@Override
	public void updateMenuPermissions(List<MenuPermission> mps)
			throws Exception {
		for (Iterator iterator = mps.iterator(); iterator.hasNext();) {
			MenuPermission menuPermission = (MenuPermission) iterator.next();
			if(menuPermission.getId()!= null &&menuPermission.getId()!=0){
				iMenuPermissionDao.updateMenuPermission(menuPermission);
			}else{
				iMenuPermissionDao.saveMenuPermission(menuPermission);
			}
		}
	}

	@Override
	public void deleteMenuPermissions(List<MenuPermission> mps)
			throws Exception {
		for (Iterator iterator = mps.iterator(); iterator.hasNext();) {
			MenuPermission menuPermission = (MenuPermission) iterator.next();
			if(menuPermission.getId()!= null &&menuPermission.getId()!=0){
				iMenuPermissionDao.deleteMenuPermissionById(menuPermission.getId());
			}
		}
	}

	@Override
	public void saveMenuPerissionChange(
			List<MenuPermission> insertMenuPerssions,
			List<MenuPermission> deleteMenuPerssions, Long roleId)
			throws Exception {
		if(deleteMenuPerssions != null){
			for (Iterator iterator = deleteMenuPerssions.iterator(); iterator
					.hasNext();) {
				MenuPermission menuPermission = (MenuPermission) iterator.next();
				iRoleAndMenuPermissionDao.deleteRoleAndMenuPermission(roleId, menuPermission.getId());	
			}
		}
		if(insertMenuPerssions != null){
			for (Iterator iterator = insertMenuPerssions.iterator(); iterator
					.hasNext();) {
				MenuPermission menuPermission = (MenuPermission) iterator.next();
				iRoleAndMenuPermissionDao.insertRoleAndMenuPermisson(roleId, menuPermission.getId());	
			}
		}
		
		
	}

}
