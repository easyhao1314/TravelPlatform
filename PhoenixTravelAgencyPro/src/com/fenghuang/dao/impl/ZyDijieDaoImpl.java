package com.fenghuang.dao.impl;

import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fenghuang.dao.BaseDao;
import com.fenghuang.dao.IZyDijieDao;
import com.fenghuang.entiey.Dijie;
import com.fenghuang.util.Pagination;
@Repository
public class ZyDijieDaoImpl extends BaseDao implements IZyDijieDao{
	@Autowired
	public ZyDijieDaoImpl(DataSource dataSource) {
		super(dataSource);
		// TODO Auto-generated constructor stub
	}

	@Override
	public Pagination<Dijie> dijieSelect(int currentPage, int numPerPage,String name,String chengshiId,String lianxiren,String hzjbId)
			throws Exception {
		// TODO Auto-generated method stub
		StringBuffer sql=new StringBuffer("select d.id,d.name,d.lianxiren,d.dianhua,d.chuanzhen,d.shouji,d.bz,dd.dicName as chengshi,dd1.dicName as hzjb from dijie as d left join dictionarydesc as dd  on d.chengshiId=dd.dicNo left join dictionarydesc as dd1 on d.hzjbId=dd1.dicNo where 1=1 ");
		if(!"".equals(name) && name != null){
			sql.append(" and name like '%");
			sql.append(name);
			sql.append("%'");
		}
		if(!"".equals(chengshiId) && chengshiId != null){
			sql.append(" and chengshiId = '");
			sql.append(chengshiId);
			sql.append("'");
		}
		if(!"".equals(lianxiren) && lianxiren != null){
			sql.append(" and lianxiren like '%");
			sql.append(lianxiren);
			sql.append("%'");
		}
		if(!"".equals(hzjbId) && hzjbId != null){
			sql.append(" and hzjbId = '");
			sql.append(hzjbId);
			sql.append("'");
		}
		return this.getPagination(currentPage, numPerPage, sql.toString());
	}

	@Override
	public boolean dijieAdd(Dijie dj) throws Exception {
		// TODO Auto-generated method stub
		String sql="insert into dijie(name,ywname,chengshiId,dizhi,hzjbId,lianxiren,dianhua,shouji,chuanzhen,email,skype,msn,yahoo,wangzhi,kaihu,dlrzh,yhdz,skrzh,skrxm,skrdz,ywqyId,djsms,xjb,youshi,bz) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		int count=this.update(sql,dj.getName(),dj.getYwname(),dj.getChengshiId(),dj.getDizhi(),dj.getHzjbId(),dj.getLianxiren(),dj.getDianhua(),dj.getShouji(),dj.getChuanzhen(),dj.getEmail(),dj.getSkype(),
				                dj.getMsn(),dj.getYahoo(),dj.getWangzhi(),dj.getKaihu(),dj.getDlrzh(),dj.getYhdz(),dj.getSkrzh(),dj.getSkrxm(),dj.getSkrdz(),dj.getYwqyId(),dj.getDjsms(),dj.getXjb(),dj.getYoushi(),dj.getBz());
		return count>0;
	}
	@Override
	public boolean dijieDelete(long id) throws Exception {
		// TODO Auto-generated method stub
		String sql=" delete from dijie where id=?";
		int count=this.update(sql,id);
		return count>0;
	}

	@Override
	public List<Map<String, Object>> dijieSelectId(long id) throws Exception {
		// TODO Auto-generated method stub
		String sql="select * from dijie where id=?";
		return this.queryForList(sql,id);
	}

	@Override
	public boolean dijieUpdate(Dijie dj) throws Exception {
		// TODO Auto-generated method stub
		String sql="update dijie set name=?,ywname=?,chengshiId=?,dizhi=?,hzjbId=?,lianxiren=?,dianhua=?,shouji=?,chuanzhen=?,email=?,skype=?,msn=?,yahoo=?,wangzhi=?,kaihu=?,dlrzh=?,yhdz=?,skrzh=?,skrxm=?,skrdz=?,ywqyId=?,djsms=?,xjb=?,youshi=?,bz=? where id=?";
		int count=this.update(sql,dj.getName(),dj.getYwname(),dj.getChengshiId(),dj.getDizhi(),dj.getHzjbId(),dj.getLianxiren(),dj.getDianhua(),dj.getShouji(),dj.getChuanzhen(),dj.getEmail(),dj.getSkype(),
                dj.getMsn(),dj.getYahoo(),dj.getWangzhi(),dj.getKaihu(),dj.getDlrzh(),dj.getYhdz(),dj.getSkrzh(),dj.getSkrxm(),dj.getSkrdz(),dj.getYwqyId(),dj.getDjsms(),dj.getXjb(),dj.getYoushi(),dj.getBz(),dj.getId());
		return count>0;
	}

	@Override
	public Pagination<Dijie> dijieSelectLike(int currentPage, int numPerPage,
			String name, int chengshi) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
