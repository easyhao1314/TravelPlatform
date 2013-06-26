package com.fenghuang.service.impl;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.fenghuang.dao.BaseDao;
import com.fenghuang.dao.IZyJiudian;
import com.fenghuang.dao.Idantuan;
import com.fenghuang.entiey.Jiudian;
import com.fenghuang.service.IZyJiudainService;
import com.fenghuang.util.Pagination;
@Service
public class ZyJiudianServiceImpl  implements IZyJiudainService{

	@Autowired
	public IZyJiudian zyjd;

	@Override
	public Pagination<Jiudian> jiudainSelect(int currentPage, int numPerPage)
			throws Exception {
		// 查询
		return zyjd.jiudianSelect(currentPage, numPerPage);
	}

	@Override
	public Pagination<Jiudian> jiudainSelectLike(int currentPage, int numPerpage)
			throws Exception {
		// 模糊查询
		return null;
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
	public Jiudian jiudianSelectId(int id) {
		// 按id查询
		return null;
	}

	@Override
	public boolean jiudianUpdate(Jiudian jd) {
		// 修改
		return false;
	}

}
