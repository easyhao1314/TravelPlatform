package com.fenghuang.dao.impl;

import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fenghuang.dao.BaseDao;
import com.fenghuang.dao.IdingcheDao;
import com.fenghuang.entiey.Dingche;
import com.fenghuang.util.Pagination;
@Repository
public class DingcheDaoImpl extends BaseDao implements IdingcheDao{
	@Autowired
	public DingcheDaoImpl(DataSource dataSource) {
		super(dataSource);
		// TODO Auto-generated constructor stub
	}

	@Override
	public Pagination<Dingche> dingcheSelect(int currentPage, int numPerPage,
			Dingche dc) throws Exception {
		// TODO Auto-generated method stub
		String sql="select che.*,jiaotong.`name` AS gongying from  dingche AS che LEFT JOIN jiaotong ON jiaotong.id=che.gongyingshang";
		
		return this.getPagination(currentPage, numPerPage, sql);
	}

	@Override
	public boolean dingcheAdd(Dingche dc) throws Exception {
		// TODO Auto-generated method stub
		String sql="insert into  dingche(cheName,chexinxi,chepaihao,siji,sidao,zuoweishu,jiage,gongyingshang) VALUES(?,?,?,?,?,?,?,?)";
		int count=this.update(sql,dc.getCheName(),dc.getChexinxi(),dc.getChepaihao(),dc.getSiji(),dc.getSidao(),dc.getZuoweishu(),dc.getJiage(),dc.getGongyingshang());
		return count>0;
	}

	@Override
	public boolean dingcheDelete(long id) throws Exception {
		// TODO Auto-generated method stub
		String sql="delete dingche where id=?";
		int count=this.update(sql,id);
		return count>0;
	}

	@Override
	public List<Map<String, Object>> dingcheSelectId(long id) throws Exception {
		// TODO Auto-generated method stub
		String sql="select * from dingche where id=?";
		return this.queryForList(sql,id);
	}

	@Override
	public boolean dingcheUpdate(Dingche dy) throws Exception {
		// TODO Auto-generated method stub
		String sql="update dingche set tuanNo=?,cheName=?,cheXinxi=?,chePaihao=?,siji=?,sidao=?,tianshu=?,zuoweishu=?,zongjiage=?  where id=?";
		int count=this.update(sql);
		return count>0;
	}

}
