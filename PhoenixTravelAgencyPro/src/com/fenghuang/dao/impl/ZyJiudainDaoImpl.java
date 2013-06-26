package com.fenghuang.dao.impl;

import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.fenghuang.dao.BaseDao;
import com.fenghuang.dao.IZyJiudian;
import com.fenghuang.entiey.Jiudian;
import com.fenghuang.util.Pagination;

@Repository
public class ZyJiudainDaoImpl extends BaseDao implements IZyJiudian{
	@Autowired
	public ZyJiudainDaoImpl(@Qualifier("dataSource")DataSource dataSource) {
		super(dataSource);
		// TODO Auto-generated constructor stub
	}

	@Override
	public Pagination<Jiudian> jiudianSelect(int currentPage, int numPerPage)
			throws Exception {
		// 查询
		String sql="select * from jiudian";
		return this.getPagination(currentPage, numPerPage, sql);
	}

	@Override
	public int jiudianAdd(Jiudian jd) {
		// 添加
		return 0;
	}

	@Override
	public boolean jiudianDelete(int id) {
		// 删除
		return false;
	}

	@Override
	public List<Map<String, Object>> jiudianSelectId(int id) {
		// 按id查询
		return null;
	}

	@Override
	public boolean jiudianUpdate(Jiudian jd) {
		// 修改
		return false;
	}

	@Override
	public Pagination<Jiudian> jiudainSelectLike(int currentPage, int numPerPage)
			throws Exception {
		// 模糊查询
		return null;
	}

}
