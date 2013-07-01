package com.fenghuang.dao.impl;

import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fenghuang.dao.BaseDao;
import com.fenghuang.dao.IZyGouwuDao;
import com.fenghuang.entiey.Gouwu;
import com.fenghuang.util.Pagination;
@Repository
public class ZyGouwuDaoImpl extends BaseDao implements IZyGouwuDao{
	@Autowired
	public ZyGouwuDaoImpl(DataSource dataSource) {
		super(dataSource);
		// TODO Auto-generated constructor stub
	}

	@Override
	public Pagination<Gouwu> gouwuSelect(int currentPage, int numPerPage)
			throws Exception {
		// TODO Auto-generated method stub
		String sql="select * from gouwu";
		return this.getPagination(currentPage, numPerPage, sql);
	}

	@Override
	public boolean gouwuAdd(Gouwu gw) throws Exception {
		// TODO Auto-generated method stub
		String sql="insert into gouwu(id,lianxiren,name,chuanzhen,chengshiId,dizhi,dianhua,shouji,email,hzjbId,bz) values(?,?,?,?,?,?,?,?,?,?,?)";
		int count=this.update(sql,gw.getId(),gw.getLianxiren(),gw.getName(),gw.getChuanzhen(),gw.getChengshiId(),gw.getDizhi(),
				gw.getDianhua(),gw.getShouji(),gw.getEmail(),gw.getHzjbId(),gw.getBz());
		return count>0;
	}

	@Override
	public boolean gouwuDelete(long id) throws Exception {
		// TODO Auto-generated method stub 
		String sql="delete from gouwu where id=?";
		int count=this.update(sql,id);
		return count>0;
	}

	@Override
	public List<Map<String, Object>> gouwuSelectId(long id) throws Exception {
		// TODO Auto-generated method stub
		String sql="select * from gouwu where id=?";
		List<Map<String,Object>> gwlist=this.queryForList(sql,id);
		return gwlist;
	}

	@Override
	public boolean gouwuUpdate(Gouwu gw) throws Exception {
		// TODO Auto-generated method stubx
		String sql="update gouwu  set lianxiren=?,name=?,chuanzhen=?,chengshiId=?,dizhi=?,dianhua=?,shouji=?,email=?,hzjbId=?,bz=?  where id=?";
		int count=this.update(sql,gw.getLianxiren(),gw.getName(),gw.getChuanzhen(),gw.getChengshiId(),gw.getDizhi(),
				gw.getDianhua(),gw.getShouji(),gw.getEmail(),gw.getHzjbId(),gw.getBz(),gw.getId());
		return count>0;
	}

}
