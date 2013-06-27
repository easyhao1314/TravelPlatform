package com.fenghuang.dao;

import java.util.List;
import java.util.Map;

import com.fenghuang.entiey.Department;
import com.fenghuang.util.Pagination;

/**
 * 
 * @author 鲍国浩
 * 
 */
public interface IDepartmentDao {
    /**
     * 保存部门信息
     * @param department
     * @return
     * @throws Exception
     */
	public boolean saveDepartment(Department department) throws Exception;
    /**
     * 更新部门信息
     * @param department
     * @return
     * @throws Exception
     */
	public boolean updateDepartment(Department department) throws Exception;
	/**
	 * 根据id来查询部门信息
	 * @param department
	 * @return
	 * @throws Exception
	 */
	public Department getDepartmentById(Long id) throws Exception;
    /**
     * 通过分页查询部门信息列表
     * @param currentPage
     * @param numPerPage
     * @param departNo
     * @param departName
     * @return
     * @throws Exception
     */
	public Pagination<Department> getPaginationDepartments(int currentPage,
			int numPerPage, String departNo, String departName)
			throws Exception;
    /**
     * 根据id删除部门信息
     * @param id
     * @return
     * @throws Exception
     */
	public boolean deleteDepartmentById(Long id) throws Exception;
	
	public List<Map<String,Object>>  getDepartmentComboboxs()throws Exception;

}
