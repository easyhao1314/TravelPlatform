package com.fenghuang.dao.impl;

import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.fenghuang.dao.BaseDao;
import com.fenghuang.dao.IZyDaoyouDao;
import com.fenghuang.entiey.Daoyou;
import com.fenghuang.util.Pagination;
@Repository
public class ZyDaoyouDaoImpl extends BaseDao implements IZyDaoyouDao{
	@Autowired
	public ZyDaoyouDaoImpl(@Qualifier("dataSource")DataSource dataSource) {
		super(dataSource);
		// TODO Auto-generated constructor stub
	}

	@Override
	public Pagination<Daoyou> daoyouSelect(int currentPage, int numPerPage,String name,String guojiaId,String chengshiId)
			throws Exception {
		// TODO Auto-generated method stub
		StringBuffer sql=new StringBuffer("select * from daoyou where 1=1");
		if(name !=null && !"".equals(name)){
			sql.append(" and name like '%");
			sql.append(name);
			sql.append("%'");
		}
		if(guojiaId !=null && !"".equals(guojiaId)){
			sql.append(" and guojiaId ='");
			sql.append(guojiaId);
			sql.append("'");
		}
		if(chengshiId !=null && !"".equals(chengshiId)){
			sql.append(" and chengshiId ='");
			sql.append(chengshiId);
			sql.append("'");
		}
		return this.getPagination(currentPage, numPerPage, sql.toString());
	}

	@Override
	public boolean daoyouAdd(Daoyou dy) throws Exception {
		// TODO Auto-generated method stub
		String sql="insert into daoyou(guojiaId,name,name2,name3,zjlx,zjhm,chengshiId,dinhua,lxfs1,lxfs2,lxfs3,email,shouji,fax,dyfy,hzjbId,bz) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		int count=this.update(sql,dy.getGuojiaId(),dy.getName(),dy.getName2(),dy.getName3(),dy.getZjlx(),dy.getZjhm(),dy.getChengshiId(),dy.getDinhua(), dy.getLxfs1(),dy.getLxfs2(),dy.getLxfs3(),
				              dy.getEmail(),dy.getShouji(),dy.getFax(),dy.getDyfy(),dy.getHzjbId(),dy.getBz());
		return count>0;
	}

	@Override
	public boolean daoyouDelete(long id) throws Exception {
		// TODO Auto-generated method stub
		String sql="delete from daoyou where id=?";
		int count=this.update(sql,id);
		return count>0;
	}

	@Override
	public List<Map<String, Object>> daoyouSelectId(long id) throws Exception {
		// TODO Auto-generated method stub
		String sql="select * from daoyou  where id=?";
		return this.queryForList(sql,id);
	}

	@Override
	public boolean daoyouUpdate(Daoyou dy) throws Exception {
		// TODO Auto-generated method stub
		String sql="update daoyou set guojiaId=?,name=?,name2=?,name3=?,zjlx=?,zjhm=?,chengshiId=?,dinhua=?,lxfs1=?,lxfs2=?,lxfs3=?,email=?,shouji=?,fax=?,dyfy=?,hzjbId=?,bz=? where id=?";
		int count=this.update(sql,dy.getGuojiaId(),dy.getName(),dy.getName2(),dy.getName3(),dy.getZjlx(),dy.getZjhm(),dy.getChengshiId(),dy.getDinhua(), dy.getLxfs1(),dy.getLxfs2(),dy.getLxfs3(),
	              dy.getEmail(),dy.getShouji(),dy.getFax(),dy.getDyfy(),dy.getHzjbId(),dy.getBz(),dy.getId());
		return count>0;
	}

	@Override
	public Pagination<Daoyou> daoyouSelectLike(int currentPage, int numPerPage,
			String name, int chengshi) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
