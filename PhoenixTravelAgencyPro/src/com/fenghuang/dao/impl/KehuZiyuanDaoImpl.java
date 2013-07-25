package com.fenghuang.dao.impl;

import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fenghuang.dao.BaseDao;
import com.fenghuang.dao.IKehuziyuanDao;
import com.fenghuang.entiey.KuhuZiyuan;
import com.fenghuang.util.Pagination;
@Repository
public class KehuZiyuanDaoImpl extends BaseDao implements IKehuziyuanDao{
	@Autowired
	public KehuZiyuanDaoImpl(DataSource dataSource) {
		super(dataSource);
		// TODO Auto-generated constructor stub
	}

	@Override
	public Pagination<KuhuZiyuan> kehuSelect(int currentPage, int numPerPage,
			String name, String shuoming, String tishi,String type) throws Exception {
		// TODO 
		StringBuffer sql=new StringBuffer("select * from kehuziyuan where 1=1");
		if(type !=null &&!"".equals(type)){
			sql.append(" and type = '");
			sql.append(type);
			sql.append("'");
		}
		if(name !=null &&!"".equals(name)){
			sql.append(" and name like '%");
			sql.append(name);
			sql.append("%'");
		}
		if(tishi !=null &&!"".equals(tishi)){
			sql.append(" and tishi like '%");
			sql.append(tishi);
			sql.append("%'");
		} 
		if(tishi !=null &&!"".equals(tishi)){
			sql.append(" and tishi like '%");
			sql.append(tishi);
			sql.append("%'");
		}
		return this.getPagination(currentPage, numPerPage, sql.toString());
	}

	@Override
	public boolean kehuAdd(KuhuZiyuan khzy) throws Exception {
		// TODO Auto-generated method stub
		String sql="insert into kehuziyuan(name,shuoming,tishi,type) values(?,?,?,?)";
		int count=this.update(sql,khzy.getName(),khzy.getShuoming(),khzy.getTishi(),khzy.getType());
		return count>0;
	}

	@Override
	public boolean kehuDelete(long id) throws Exception {
		// TODO Auto-generated method stub
		String sql="delete from kuhuZiyuan where id=?";
		int count=this.update(sql,id);
		return count>0;
	}

	@Override
	public List<Map<String, Object>> kehuSelectId(long id) throws Exception {
		// TODO Auto-generated method stub
		String sql="select * from kehuZiyuan where id=?";
		return this.queryForList(sql,id);
	}

	@Override
	public boolean kehuUpdate(KuhuZiyuan khzy) throws Exception {
		// TODO Auto-generated method stub
		String sql="update kehuZiyuan set name=?,shuoming=?,tishi=? where id=?";
		int count=this.update(sql,khzy.getName(),khzy.getShuoming(),khzy.getTishi(),khzy.getId());
		return count>0;
	}

}
