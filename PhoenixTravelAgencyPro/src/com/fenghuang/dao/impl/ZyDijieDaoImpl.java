package com.fenghuang.dao.impl;

import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fenghuang.dao.BaseDao;
import com.fenghuang.dao.IZyDijieDao;
import com.fenghuang.entiey.Dijie;
import com.fenghuang.util.Pagination;
@Repository
public class ZyDijieDaoImpl extends BaseDao implements IZyDijieDao{
	@Autowired
	public ZyDijieDaoImpl(DataSource dataSource) {
		super(dataSource);
		// TODO Auto-generated constructor stub
	}

	@Override
	public Pagination<Dijie> dijieSelect(int currentPage, int numPerPage)
			throws Exception {
		// TODO Auto-generated method stub
		String sql="select * from dijie";
		return null;
	}

	@Override
	public boolean dijieAdd(Dijie dj) throws Exception {
		// TODO Auto-generated method stub
		String sql="insert into dijie() values()";
		int count=this.update(sql);
		return count>0;
	}

	@Override
	public boolean dijieDelete(long id) throws Exception {
		// TODO Auto-generated method stub
		String sql=" delete from dijie where id=?";
		int count=this.update(sql,id);
		return count>0;
	}

	@Override
	public List<Map<String, Object>> dijieSelectId(long id) throws Exception {
		// TODO Auto-generated method stub
		String sql="select * from dijie where id=?";
		return this.queryForList(sql,id);
	}

	@Override
	public boolean jingdianUpdate(Dijie dj) throws Exception {
		// TODO Auto-generated method stub
		String sql="update dijie set  where id=?";
		int count=this.update(sql);
		return count>0;
	}

	@Override
	public Pagination<Dijie> dijieSelectLike(int currentPage, int numPerPage,
			String name, int chengshi) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
