package com.fenghuang.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fenghuang.dao.IDepartmentDao;
import com.fenghuang.entiey.Department;
import com.fenghuang.service.IDepartmentService;
import com.fenghuang.util.Pagination;
/**
 * 
 * @author 鲍国浩
 *
 *  日期    @2013-6-18
 *  
 *  描述：
 *
 *
 *
 */
@Service
public class DepartmentServiceImpl implements IDepartmentService {
	
	@Autowired
	private IDepartmentDao iDepartmentDao;
	
	
	@Override
	public boolean saveDepartment(Department department) throws Exception {
		return iDepartmentDao.saveDepartment(department);
	}

	@Override
	public boolean updateDepartment(Department department) throws Exception {
		return iDepartmentDao.updateDepartment(department);
	}

	@Override
	public Department getDepartmentById(Long id) throws Exception {
		return iDepartmentDao.getDepartmentById(id);
	}

	@Override
	public Pagination<Department> getPaginationDepartments(int currentPage,
			int numPerPage, String departNo, String departName)
			throws Exception {
		return iDepartmentDao.getPaginationDepartments(currentPage, numPerPage, departNo, departName);
	}

	@Override
	public boolean deleteDepartmentById(Long id) throws Exception {
		return iDepartmentDao.deleteDepartmentById(id);
	}

}
