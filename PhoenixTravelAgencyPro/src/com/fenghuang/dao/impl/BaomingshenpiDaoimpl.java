package com.fenghuang.dao.impl;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;


import com.fenghuang.dao.BaseDao;
import com.fenghuang.dao.IBaomingshenpiDao;
import com.fenghuang.entiey.Baomingshenpi;
import com.fenghuang.util.Pagination;
@Repository
public class BaomingshenpiDaoimpl extends BaseDao implements IBaomingshenpiDao {
	@Autowired
	public BaomingshenpiDaoimpl(@Qualifier("dataSource")DataSource dataSource) {
		super(dataSource);
		// TODO Auto-generated constructor stub
	}

	@Override
	public Pagination<Baomingshenpi> baominginfo(int page,int rows,Baomingshenpi b,String tuanNo,Integer type)
			throws Exception {
		// TODO Auto-generated method stub
		String sql="select bmid,kehuid,baomingsp,baomingsl,yajinqueren,chupiaoqueren,chutuanqueren,beizhu,kehuname,b.sex,zhengjianhao,b.tuituanshenpi,b.zhuantuanshenpi from baomingshenpi as b INNER JOIN customerinfo as c on b.kehuid=c.id WHERE 1=1 ";
		StringBuffer sb = new StringBuffer(sql);
		if(tuanNo!=null && !"".equals(tuanNo)){
			sb.append(" AND c.tuanNo='"+tuanNo+"'");
		}
		if(type!=0){
			sb.append(" AND c.type='"+type+"'");
		}
		return this.getPagination(page, rows, sb.toString());
	}

	@Override
	public boolean updatebaoming(Baomingshenpi b) throws Exception {
		// TODO Auto-generated method stub
		String sql = "update Baomingshenpi SET sex=sex+1-1";
		StringBuffer sb = new StringBuffer(sql);
		List l = new ArrayList();
		if(b.getTuituanshenpi()!=0){
			sb.append(",tuituanshenpi=?");
			l.add(b.getTuituanshenpi());
		}
		if(b.getZhuantuanshenpi()!=0){
			sb.append(",zhuantuanshenpi=?");
			l.add(b.getZhuantuanshenpi());
		}
		if(b.getBaomingsp()!=0){
			sb.append(",baomingsp=?");
			l.add(b.getBaomingsp());
		}
		sb.append(" where bmid=?");
		l.add(b.getBmid());
		
		
		int num = this.update(sb.toString(),l.toArray());
		return num>0;
	}

	@Override
	public boolean addbaoming(Baomingshenpi b) throws Exception {
		// TODO Auto-generated method stub
		String sql = "insert into baomingshenpi(kehuid,baomingsp,baomingsl,yajinqueren,chutuanqueren,beizhu,kehuname,sex,zhengjianhao,tuituanshenpi,zhuantuanshenpi) values(?,?,?,?,?,?,?,?,?,?,?)";
		int num = this.update(sql,b.getKehuid(),b.getBaomingsp(),b.getBaomingsl(),b.getYajinqueren(),b.getChutuanqueren(),b.getBeizhu(),b.getKehuname(),b.getSex(),b.getZhengjianhao(),b.getTuituanshenpi(),b.getZhuantuanshenpi());
		return num>0;
	}

	@Override
	public boolean deletebaoming(Baomingshenpi b) throws Exception {
		// TODO Auto-generated method stub
		String sql="delete from baomingshenpi where 1=1 kehuid=?";
		int num = this.update(sql,b.getKehuid());
		return num>0;
	}

}
