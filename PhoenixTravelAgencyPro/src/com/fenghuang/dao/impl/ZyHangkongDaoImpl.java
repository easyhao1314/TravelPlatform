package com.fenghuang.dao.impl;

import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fenghuang.dao.BaseDao;
import com.fenghuang.dao.IZyHangkongDao;
import com.fenghuang.entiey.Hangkong;
import com.fenghuang.util.Pagination;
@Repository
public class ZyHangkongDaoImpl extends BaseDao implements IZyHangkongDao{
	@Autowired
	public ZyHangkongDaoImpl(DataSource dataSource) {
		super(dataSource);
		// TODO Auto-generated constructor stub
	}

	@Override
	public boolean hangkongAdd(Hangkong hk) throws Exception {
		// TODO 增
		String sql="insert into hangkong (daima,name,shui,bizongId) values (?,?,?,?)";
		int count=this.update(sql,hk.getDaima(),hk.getName(),hk.getShui(),hk.getBizongId());
		return count>0;
	}

	@Override
	public boolean hangkongDelete(long id) throws Exception {
		// TODO删
		String sql="delete from hangkong where id=?";
		int count=this.update(sql,id);
		return count>0;
	}

	@Override
	public boolean hangkongUpdate(Hangkong hk) throws Exception {
		// TODO Auto-generated method stub
		String sql="update hangkong set daima=?,name=?,shui=?,bizongId=? where id=?";
		int count=this.update(sql,hk.getDaima(),hk.getName(),hk.getShui(),hk.getBizongId(),hk.getId());
		return count>0;
	}

	@Override
	public List<Map<String, Object>> hangkongSelectId(long id) throws Exception {
		// TODO 查Id
		String sql="select * from hangkong where id=?";
		List<Map<String,Object>> hkSelectId=this.queryForList(sql,id);
		return hkSelectId;
	}

	@Override
	public Pagination<Hangkong> hangkongSelect(int currentPage, int numPerPage)
			throws Exception {
		// TODO 查询全部
		String sql="select daima,name,shui,dicName from hangkong as h,dictionarydesc as d where h.bizongId=d.dicNo";
		Pagination<Hangkong> hkSelect=this.getPagination(currentPage, numPerPage, sql);
		return hkSelect;
	}

	@Override
	public Pagination<Hangkong> hangkongSelectLike(int currentPage,
			int numPerPage, String daima, String name) throws Exception {
		// TODO 模糊查询
		StringBuffer sql=new StringBuffer("select * from hangkong where 1=1 ");
		if(daima!=null && !"".equals(daima)){
			sql.append(" and daima like '%");
			sql.append(daima);
			sql.append("%'");
		}
		if(name!=null && !"".equals(name)){
			sql.append(" and name like '%");
			sql.append(name);
			sql.append("%'");
		}
		
		return this.getPagination(currentPage, numPerPage, sql.toString());
	}

}
