package com.fenghuang.dao.impl;

import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fenghuang.dao.BaseDao;
import com.fenghuang.dao.IZyCanyinDao;
import com.fenghuang.entiey.Canyin;
import com.fenghuang.util.Pagination;
@Repository
public class ZyCanyinDaoImpl extends BaseDao implements IZyCanyinDao{
	@Autowired
	public ZyCanyinDaoImpl(DataSource dataSource) {
		super(dataSource);
		// TODO Auto-generated constructor stub
	}

	@Override
	public Pagination<Canyin> canyinSelect(int currentPage, int numPerPage,String name,String chengshiId,String hzjbId)
			throws Exception {
		// TODO Auto-generated method stub
		StringBuffer sql=new StringBuffer("select c.id,d.dicName as chengshi,c.name,c.dianhua,c.chuanzhen,c.shouji,d1.dicName as hzjb from canyin as c left join dictionarydesc as d on c.chengshiId=d.dicNo left join dictionarydesc as d1 on c.hzjbId=d1.dicNo where 1=1 ");
		if(name !=null && !"".equals(name)){
			sql.append(" and name like '%");
			sql.append(name);
			sql.append("%'");
		}
		if(chengshiId !=null && !"".equals(chengshiId)){
			sql.append(" and chengshiId = '");
			sql.append(chengshiId);
			sql.append("'");
		}
		if(hzjbId !=null && !"".equals(hzjbId)){
			sql.append(" and hzjbId = '");
			sql.append(hzjbId);
			sql.append("'");
		}
		return this.getPagination(currentPage, numPerPage, sql.toString());
	}

	@Override
	public boolean canyinAdd(Canyin cy) throws Exception {
		// TODO Auto-generated method stub
		String sql="insert into canyin(chengshiId,name,dizhi,lianxiren,dianhua,shouji,chuanzhen,email,fkfsId,hzjbId,cbwu,cbliu,cbqi,cbba,yecf,yenlsm,etcf,etcfsm,cgczs,rnrs,mfzdsm,sfxydw,sffxdw,beizhu) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		int count=this.update(sql,cy.getChengshiId(),cy.getName(),cy.getDizhi(),cy.getLianxiren(),cy.getDianhua(),cy.getShouji(),cy.getChuanzhen(),cy.getEmail(),cy.getFkfsId(),cy.getHzjbId(),cy.getCbwu(),
	              cy.getCbliu(),cy.getCbqi(),cy.getCbba(),cy.getYecf(),cy.getYenlsm(),cy.getEtcf(),cy.getEtcfsm(),cy.getCgczs(),cy.getRnrs(),cy.getMfzdsm(),cy.getSfxydw(),cy.getSffxdw(),cy.getBeizhu());
		return count>0;
	}

	@Override
	public boolean canyinDelete(long id) throws Exception {
		// TODO Auto-generated method stu
		String sql="delete from canyin where id=?";
		int count=this.update(sql,id);
		return count>0;
	}

	@Override
	public List<Map<String, Object>> canyinSelectId(long id) throws Exception {
		// TODO Auto-generated method stub
		String sql="select * from canyin where id=?";
		return this.queryForList(sql,id);
	}

	@Override
	public boolean canyinUpdate(Canyin cy) throws Exception {
		// TODO Auto-generated method stub
		String sql="update canyin set chengshiId=?,name=?,dizhi=?,lianxiren=?,dianhua=?,shouji=?,chuanzhen=?,email=?,fkfsId=?,hzjbId=?,cbwu=?,cbliu=?,cbqi=?,cbba=?,yecf=?,yenlsm=?,etcf=?,etcfsm=?,cgczs=?,rnrs=?,mfzdsm=?,sfxydw=?,sffxdw=?,beizhu=? where id=?";
		int count=this.update(sql,cy.getChengshiId(),cy.getName(),cy.getDizhi(),cy.getLianxiren(),cy.getDianhua(),cy.getShouji(),cy.getChuanzhen(),cy.getEmail(),cy.getFkfsId(),cy.getHzjbId(),cy.getCbwu(),
	              cy.getCbliu(),cy.getCbqi(),cy.getCbba(),cy.getYecf(),cy.getYenlsm(),cy.getEtcf(),cy.getEtcfsm(),cy.getCgczs(),cy.getRnrs(),cy.getMfzdsm(),cy.getSfxydw(),cy.getSffxdw(),cy.getBeizhu(),cy.getId());
		return count>0;
	}

	@Override
	public Pagination<Canyin> canyinSelectLike(int currentPage, int numPerPage,
			String name, int chengshi) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
