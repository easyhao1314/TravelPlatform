package com.fenghuang.dao.impl;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.fenghuang.dao.BaseDao;
import com.fenghuang.dao.IcaiwufukuanDao;
import com.fenghuang.entiey.Account;
import com.fenghuang.entiey.Fukuanfangshi;
import com.fenghuang.util.Pagination;

@Repository
public class CaiwufukuanDaoImpl  extends BaseDao implements IcaiwufukuanDao{
    @Autowired
	public CaiwufukuanDaoImpl(@Qualifier("dataSource")DataSource dataSource) {
		super(dataSource);
		// TODO Auto-generated constructor stub
    }
	
	@Override
	public boolean saveFukuan(Fukuanfangshi fukuanfangshi) throws Exception {
		// TODO Auto-generated method stub
		String sql="insert into Fukuanfangshi (fukuanfangshi,miaoshu) values(?,?)";
		int a=this.update(sql,fukuanfangshi.getFukuanfangshi(),fukuanfangshi.miaoshu);
		return a>0;
	}

	@Override
	public boolean updateFukuan(Fukuanfangshi fukuanfangshi) throws Exception {
		// TODO Auto-generated method stub
		String sql = "update Fukuanfangshi set fukuanfangshi=?,miaoshu=?  where id=?";
		int rs =this.update(sql,fukuanfangshi.getFukuanfangshi(),fukuanfangshi.getMiaoshu(),fukuanfangshi.getId());
		
		return rs >0;
	}

	@Override
	public boolean deleteFukuan(Long id) throws Exception {
		// TODO Auto-generated method stub
        String sql="delete from Fukuanfangshi where id=?";
		
		int rs=this.update(sql,id);
		return rs>0;
	}

	@Override
	public Pagination<Fukuanfangshi> getPaginationweihu(int currentPage,
			int numPerPage, Fukuanfangshi fukuanfangshi) throws Exception {
		// TODO Auto-generated method stub
		StringBuffer sql = new StringBuffer("select * from Fukuanfangshi where 1=1 ");
		
		if(fukuanfangshi.getFukuanfangshi()!=null&&!"".equals(fukuanfangshi.getFukuanfangshi())){
			
			sql.append(" and id='");
			sql.append(fukuanfangshi.getId());
			sql.append("'");
		
	}
		return this.getPagination(currentPage, numPerPage, sql.toString());
	}

}
