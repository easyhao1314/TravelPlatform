package com.fenghuang.dao.impl;

import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fenghuang.dao.BaseDao;
import com.fenghuang.dao.IZyJingdianDao;
import com.fenghuang.entiey.Jingdian;
import com.fenghuang.util.Pagination;
@Repository
public class ZyJingdianDaoImpl extends BaseDao implements IZyJingdianDao{
	@Autowired
	public ZyJingdianDaoImpl(DataSource dataSource) {
		super(dataSource);
		// TODO Auto-generated constructor stub
	}

	@Override
	public Pagination<Jingdian> jingdianSelect(int currentPage, int numPerPage,String name,String chengsiId,String jiage)
			throws Exception {
		// TODO Auto-generated method stub
		StringBuffer sql=new StringBuffer("select * from jingdian where 1=1 ");
		if(!"".equals(name) && name !=null){
			sql.append(" and name like '%");
			sql.append(name);
			sql.append("%'");
		}
		if(!"".equals(chengsiId) && chengsiId !=null){
			sql.append(" and chengsiId ='");
			sql.append(chengsiId);
			sql.append("'");
		}
		if(!"".equals(jiage) && jiage !=null){
			sql.append(" and jiage ='");
			sql.append(jiage);
			sql.append("'");
		}
		return this.getPagination(currentPage, numPerPage, sql.toString());
	}

	@Override
	public boolean jingdianAdd(Jingdian jd) throws Exception {
		// TODO Auto-generated method stub
		String sql="insert into jingdian(name,name2,chengsiId,jiage,bizongId,kftimeqi,kftimezhi,timekb,lianxiren,dianhua,chuanzhen,email,dcmr,dizhi,ywdz,jdms) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		int count=this.update(sql,jd.getName(),jd.getName2(),jd.getChengsiId(),jd.getJiage(),jd.getBizongId(),jd.getKftimeqi(),jd.getKftimezhi(),jd.getTimekb(),jd.getLianxiren(),jd.getDianhua(),
				                  jd.getChuanzhen(),jd.getEmail(),jd.getDcmr(),jd.getDizhi(),jd.getYwdz(),jd.getJdms());
		return count>0;
	}

	@Override
	public boolean jingdianDelete(long id) throws Exception {
		// TODO Auto-generated method stub
		String sql="delete from jingdian where id=?";
		int count=this.update(sql,id);
		return count>0;
	}

	@Override
	public List<Map<String, Object>> jingdianSelectId(long id) throws Exception {
		// TODO Auto-generated method stub
		String sql="select * from jingdian where id=?";
		return this.queryForList(sql,id);
	}

	@Override
	public boolean jingdianUpdate(Jingdian jd) throws Exception {
		// TODO Auto-generated method stub
		String sql="update jingdian set name=?,name2=?,chengsiId=?,jiage=?,bizongId=?,kftimeqi=?,kftimezhi=?,timekb=?,lianxiren=?,dianhua=?,chuanzhen=?,email=?,dcmr=?,dizhi=?,ywdz=?,jdms=?  where id=?";
		int count=this.update(sql,jd.getName(),jd.getName2(),jd.getChengsiId(),jd.getJiage(),jd.getBizongId(),jd.getKftimeqi(),jd.getKftimezhi(),jd.getTimekb(),jd.getLianxiren(),jd.getDianhua(),
                jd.getChuanzhen(),jd.getEmail(),jd.getDcmr(),jd.getDizhi(),jd.getYwdz(),jd.getJdms(),jd.getId());
		return count>0;
	}

	@Override
	public Pagination<Jingdian> jingdianSelectLike(int currentPage,
			int numPerPage, String name, int chengshi) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
