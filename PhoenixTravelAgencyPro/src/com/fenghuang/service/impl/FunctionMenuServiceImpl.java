/**
 * 
 */
package com.fenghuang.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.fenghuang.dao.IFunctionMenuDao;
import com.fenghuang.entiey.FunctionMenu;
import com.fenghuang.service.IFunctionMenuService;
import com.fenghuang.util.Pagination;

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

@Service
public class FunctionMenuServiceImpl implements IFunctionMenuService {
	@Autowired
	private IFunctionMenuDao iFunctionMenuDao;
	
	
	/* (non-Javadoc)
	 * @see com.fenghuang.service.IFunctionMenuService#saveFunctionMenu(com.fenghuang.entiey.FunctionMenu)
	 */
	@Override
	public boolean saveFunctionMenu(FunctionMenu functionMenu) throws Exception {
		return iFunctionMenuDao.saveFunctionMenu(functionMenu);
	}

	/* (non-Javadoc)
	 * @see com.fenghuang.service.IFunctionMenuService#updateFunctionMenu(com.fenghuang.entiey.FunctionMenu)
	 */
	@Override
	public boolean updateFunctionMenu(FunctionMenu functionMenu)
			throws Exception {
		return iFunctionMenuDao.updateFunctionMenu(functionMenu);
	}

	/* (non-Javadoc)
	 * @see com.fenghuang.service.IFunctionMenuService#getFunctionMenuById(java.lang.Long)
	 */
	@Override
	public FunctionMenu getFunctionMenuById(Long id) throws Exception {
		return iFunctionMenuDao.getFunctionMenuById(id);
	}

	/* (non-Javadoc)
	 * @see com.fenghuang.service.IFunctionMenuService#getPaginationFunctionMenu(int, int, java.lang.Long, java.lang.String, java.lang.String, java.lang.String, java.lang.Long)
	 */
	@Override
	public Pagination<FunctionMenu> getPaginationFunctionMenu(int currentPage,
			int numPerPage, Long id, String menuNo, String menuName,
			String menuPath, Long parentId,String sortNo,String menuType) throws Exception {
		return iFunctionMenuDao.getPaginationFunctionMenu(currentPage, numPerPage, id, menuNo, menuName, menuPath, parentId,sortNo,menuType);
	}

	/* 
	 * @see com.fenghuang.service.IFunctionMenuService#deleteFunctionMeunById(java.lang.Long)
	 */
	@Override
	public boolean deleteFunctionMeunById(Long id) throws Exception {
		return iFunctionMenuDao.deleteFunctionMeunById(id);
	}

	/* 
	 * @see com.fenghuang.service.IFunctionMenuService#getFunctionMenuComboboxs()
	 */
	@Override
	public List<Map<String, Object>> getFunctionMenuComboboxs()
			throws Exception {
		return iFunctionMenuDao.getFunctionMenuComboboxs();
	}

}
