/**
 * 
 */
package com.fenghuang.service;

import java.util.List;
import java.util.Map;

import com.fenghuang.entiey.FunctionMenu;
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
public interface IFunctionMenuService {
	
	public boolean saveFunctionMenu(FunctionMenu functionMenu) throws Exception;
	
	public boolean updateFunctionMenu(FunctionMenu functionMenu) throws Exception;
	
	public FunctionMenu  getFunctionMenuById(Long id) throws Exception;
	
	public Pagination<FunctionMenu>  getPaginationFunctionMenu(int currentPage,
			int numPerPage,Long id,String menuNo,String menuName,String menuPath,Long parentId,String sortNo)throws Exception;
	
	
	public boolean deleteFunctionMeunById(Long id)throws Exception;
	public List<Map<String, Object>> getFunctionMenuComboboxs()
			throws Exception;
}
