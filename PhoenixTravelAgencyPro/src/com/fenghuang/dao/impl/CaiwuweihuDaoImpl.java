package com.fenghuang.dao.impl;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fenghuang.dao.BaseDao;
import com.fenghuang.dao.IcaiwudaleiweihuDao;
import com.fenghuang.entiey.Weihu;
import com.fenghuang.util.Pagination;
@Repository
public class CaiwuweihuDaoImpl  extends BaseDao implements IcaiwudaleiweihuDao {
	@Autowired
	public CaiwuweihuDaoImpl(DataSource dataSource) {
		super(dataSource);
		// TODO Auto-generated constructor stub
	}

	@Override
	public boolean saveweihu(Weihu weihu) throws Exception {
		// TODO Auto-generated method stub
		String sql="insert into weihu (bianhao,xingzhi,shouzhi,shuoming,liucheng,fulei) values(?,?,?,?,?,?)";
		int a=this.update(sql,weihu.getBianhao(),weihu.getXingzhi(),weihu.getShouzhi(),weihu.getShuoming(),weihu.getLiucheng(),weihu.getFulei());
		return a>0;
	}

	@Override
	public boolean updateweihu(Weihu weihu) throws Exception {
		// TODO Auto-generated method stub
		String sql = "update Weihu set xingzhi=?,shouzhi=?,shuoming=?,liucheng=?,fulei=? where id=?";
		int rs =this.update(sql,weihu.getXingzhi(),weihu.getShouzhi(),weihu.getShuoming(),weihu.getLiucheng(),weihu.getFulei(),weihu.getId());
		
		return rs >0;
		
	}

	@Override
	public boolean deleteweihu(Long id) throws Exception {
		// TODO Auto-generated method stub
		String sql="delete from Weihu where id=?";
		
		int rs=this.update(sql,id);
		return rs>0;
	}

	@Override
	public Pagination<Weihu> getPaginationweihu(
			int currentPage, int numPerPage, Weihu weihu) throws Exception {
		// TODO Auto-generated method stub
	   StringBuffer sql = new StringBuffer("select * from Weihu where 1=1 ");
	   if(weihu.getId()!=0 && !"".equals(weihu.getId())){
			sql.append(" and id='");
			sql.append(weihu.getId());
			sql.append("'");
		
	}
		if(weihu.getBianhao()!=null&&!"".equals(weihu.getBianhao())){
			
				sql.append(" and bianhao='");
				sql.append(weihu.getBianhao());
				sql.append("'");
			
		}
		if(weihu.getXingzhi()!=null&&!"".equals(weihu.getXingzhi())){
			
			sql.append(" and xingzhi='");
			sql.append(weihu.getXingzhi());
			sql.append("'");
		
	}
		return this.getPagination(currentPage, numPerPage, sql.toString());
	}
	
	
}
