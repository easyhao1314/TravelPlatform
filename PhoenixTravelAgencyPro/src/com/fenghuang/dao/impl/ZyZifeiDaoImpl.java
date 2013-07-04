package com.fenghuang.dao.impl;

import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fenghuang.dao.BaseDao;
import com.fenghuang.dao.IZyZifeiDao;
import com.fenghuang.entiey.Zifei;
import com.fenghuang.util.Pagination;
@Repository
public class ZyZifeiDaoImpl extends BaseDao implements IZyZifeiDao{
	@Autowired
	public ZyZifeiDaoImpl(DataSource dataSource) {
		super(dataSource);
		// TODO Auto-generated constructor stub
	}

	@Override
	public Pagination<Zifei> zifeiSelect(int currentPage, int numPerPage,String name,String chengshiId,String miaoshu)
			throws Exception {
		// TODO Auto-generated method stub
		StringBuffer sql=new StringBuffer("select * from zifei where 1=1");
		if(!"".equals(name) && name != null){
			sql.append(" and name like '%");
			sql.append(name);
			sql.append("%'");
		}
		if(!"".equals(chengshiId) && chengshiId != null){
			sql.append(" and chengshiId ='");
			sql.append(chengshiId);
			sql.append("'");
		}
		if(!"".equals(miaoshu) && miaoshu != null){
			sql.append(" and miaoshu like '%");
			sql.append(miaoshu);
			sql.append("%'");
		}
		return this.getPagination(currentPage, numPerPage, sql.toString());
	}

	@Override
	public boolean zifeiAdd(Zifei zf) throws Exception {
		// TODO Auto-generated method stub
		String sql="insert into zifei(id,name,feiyong,bizhongId,chengshiId,kftimeqi,kftimezhi,timekb,djaptime,miaoshu) values (?,?,?,?,?,?,?,?,?,?)";
		int count=this.update(sql,zf.getId(),zf.getName(),zf.getFeiyong(),zf.getBizhongId(),zf.getChengshiId(),zf.getKftimeqi(),zf.getKftimezhi(),zf.getTimekb(),zf.getDjaptime(),zf.getMiaoshu());
		return count>0;
	}

	@Override
	public boolean zifeiDelete(long id) throws Exception {
		// TODO Auto-generated method stub
		String sql="delete from zifei where id=?";
		int count=this.update(sql,id);
		return count>0;
	}

	@Override
	public List<Map<String, Object>> zifeiSelectId(long id) throws Exception {
		// TODO Auto-generated method stub
		String sql="select * from zifei where id=?";
		return this.queryForList(sql,id);
	}

	@Override
	public boolean zifeiUpdate(Zifei zf) throws Exception {
		// TODO Auto-generated method stub
		String sql="update zifei set name=?,feiyong=?,bizhongId=?,chengshiId=?,kftimeqi=?,kftimezhi=?,timekb=?,djaptime=?,miaoshu=? where id=?";
		int count=this.update(sql,zf.getName(),zf.getFeiyong(),zf.getBizhongId(),zf.getChengshiId(),zf.getKftimeqi(),zf.getKftimezhi(),zf.getTimekb(),zf.getDjaptime(),zf.getMiaoshu(),zf.getId());
		return count>0;
	}

}
