package com.fenghuang.service.impl;

import java.util.List;
import java.util.Map;

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
	public Pagination<Jiudian> jiudianSelect(int currentPage, int numPerPage)
			throws Exception {
		// 查询
		return zyjd.jiudianSelect(currentPage, numPerPage);
	}


	@Override
	public int jiudianAdd(Jiudian jd) {
		// 添加
		return zyjd.jiudianAdd(jd);
	}
	@Override
	public boolean jiudianDelete(long id) {
		// 删除
		return zyjd.jiudianDelete(id);
	}

	@Override
	public List<Map<String, Object>> jiudianSelectId(long id) {
		// 按id查询
				return zyjd.jiudianSelectId(id);
			
	}

	@Override
	public boolean jiudianUpdate(Jiudian jd) {
		// 修改
		return zyjd.jiudianUpdate(jd);
	}

	@Override
	public Pagination<Jiudian> jiudianSelectLike(int currentPage,
			int numPerpage, String name, String chengshi,String weihuren) throws Exception {
		// 模糊查询
				return zyjd.jiudianSelectLike(currentPage, numPerpage, name, chengshi,weihuren);
	}


}
