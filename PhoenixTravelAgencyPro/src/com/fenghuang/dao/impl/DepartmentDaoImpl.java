package com.fenghuang.dao.impl;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.fenghuang.dao.BaseDao;
import com.fenghuang.dao.IDepartmentDao;
import com.fenghuang.entiey.Department;
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
@Repository
public class DepartmentDaoImpl extends BaseDao implements IDepartmentDao {

	@Autowired
	public DepartmentDaoImpl(@Qualifier("dataSource")DataSource dataSource) {
		super(dataSource);
		
	}

	@Override
	public boolean saveDepartment(Department department) throws Exception {
		String sql = "insert into department (departNo,departName,sortNo) values(?,?,?)";
		
		int rs = this.update(sql, department.getDepartNo(),department.getDepartName(),department.getSortNo());
		return rs >0;
	}

	@Override
	public boolean updateDepartment(Department department) throws Exception {
		String sql = "update department set departNo=?,departName=?,sortNo=? where id=?";
		int rs = this.update(sql, department.getDepartNo(),department.getDepartName(),department.getSortNo(),department.getId());
		return rs>0;
	}

	@Override
	public Department getDepartmentById(Long id) throws Exception {
		String sql = "SELECT department.id,department.departNo,department.departName,department.sortNo FROM department where department.id = ?";
		Department dt = this.queryForObject(sql, Department.class, id);
		return dt;
	}

	@Override
	public Pagination<Department> getPaginationDepartments(int currentPage,
			int numPerPage, String departNo, String departName)
			throws Exception {
		StringBuffer sql = new StringBuffer("SELECT department.id,department.departNo,department.departName,department.sortNo FROM department where 1=1");
		if(departNo != null && !"".equals(departNo)){
			sql.append(" and  department.departNo like '");
			sql.append(departNo);
			sql.append("%'");
		}
		
		if(departName != null && !"".equals(departName)){
			sql.append(" and  department.departName like '");
			sql.append(departName);
			sql.append("%'");
		}
		
		Pagination<Department> pdt = this.getPagination(currentPage, numPerPage, sql.toString());
		return pdt;
	}

	@Override
	public boolean deleteDepartmentById(Long id) throws Exception {
		String sql = "delete from department where id=?";
		int rs = this.update(sql, id);
		return rs >0;
	}

}
