package com.fenghuang.dao.impl;

import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fenghuang.dao.BaseDao;
import com.fenghuang.dao.IZyYaoqingDao;
import com.fenghuang.entiey.Yaoqinghan;
import com.fenghuang.util.Pagination;
@Repository
public class ZyYaoqingDaoImpl extends BaseDao implements IZyYaoqingDao{
	@Autowired
	public ZyYaoqingDaoImpl(DataSource dataSource) {
		super(dataSource);
		// TODO Auto-generated constructor stub
	}

	@Override
	public Pagination<Yaoqinghan> yaoqingSelect(int currentPage, int numPerPage,String guoduid,String miaoshu)
			throws Exception {
		// TODO Auto-generated method stub
		StringBuffer sql=new StringBuffer("select y.id,y.chengben,d.dicName as bizhong,d1.dicName as guodu,d2.dicName as shifou,y.miaoshu from yaoqinghan as y,dictionarydesc as d,dictionarydesc as d1,dictionarydesc as d2 where y.bizhongId = d.dicNo and y.guoduid=d1.dicNo and y.shiyongid=d2.dicNo and 1=1");
		if(guoduid != null && !"".equals(guoduid)){
			sql.append(" and guoduid ='");
			sql.append(guoduid);
			sql.append("'");
		}
		if(miaoshu != null && !"".equals(miaoshu)){
			sql.append(" and miaoshu like '%");
			sql.append(miaoshu);
			sql.append("%'");
		}
		return this.getPagination(currentPage, numPerPage, sql.toString());
	}

	@Override
	public boolean yaoqingAdd(Yaoqinghan yq) throws Exception {
		// TODO Auto-generated method stubr
		String sql="insert into yaoqinghan (guoduid,miaoshu,chengben,bizhongId,shiyongid) values (?,?,?,?,?)"; 
		int count=this.update(sql,yq.getGuoduid(),yq.getMiaoshu(),yq.getChengben(),yq.getBizhongId(),yq.getShiyongid());
		return count>0;
	}

	@Override
	public boolean yaoqingDelete(long id) throws Exception {
		// TODO Auto-generated method stub
		String sql="delete from yaoqinghan where id=?";
		int count=this.update(sql,id);
		return count>0;
	}

	@Override
	public List<Map<String, Object>> yaoqingSelectId(long id) throws Exception {
		// TODO Auto-generated method stub
		String sql="select * from yaoqinghan where id=?";
		return this.queryForList(sql,id);
	}

	@Override
	public boolean yaoqingUpdate(Yaoqinghan yq) throws Exception {
		// TODO Auto-generated method stub
		String sql="update yaoqinghan set guoduid=?,miaoshu=?,chengben=?,bizhongId=?,shiyongid=? where id=?";
		int count=this.update(sql,yq.getGuoduid(),yq.getMiaoshu(),yq.getChengben(),yq.getBizhongId(),yq.getShiyongid(),yq.getId());
		return count>0;
	}

}
