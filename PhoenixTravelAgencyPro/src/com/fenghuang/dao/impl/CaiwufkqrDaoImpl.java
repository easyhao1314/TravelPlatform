package com.fenghuang.dao.impl;


import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fenghuang.dao.BaseDao;
import com.fenghuang.dao.IcaiwufkqrDao;

import com.fenghuang.entiey.Tuanbiao;
import com.fenghuang.util.Pagination;

@Repository
public class CaiwufkqrDaoImpl extends BaseDao implements IcaiwufkqrDao {
	@Autowired
	public CaiwufkqrDaoImpl(DataSource dataSource) {
		super(dataSource);
		// TODO Auto-generated constructor stub
	}

	@Override
	public boolean savefkqr(Tuanbiao tuanbiao) throws Exception {
		// TODO Auto-generated method stub                                                                                                                                
		String sql="insert into tuanbiao (team,kxsm,zhanghaoid,khmc,yushoutime,yingshou,huilvid,beizhu,ysyfid) values(?,?,?,?,?,?,?,?,?)";
		int a=this.update(sql,tuanbiao.getTeam(),tuanbiao.getKxsm(),tuanbiao.getZhanghaoid(),tuanbiao.getKhmc(),tuanbiao.getYushoutime(),tuanbiao.getYingshou(),tuanbiao.getHuilvID(),tuanbiao.getBeizhu(),tuanbiao.getYsyfID());
		return false;
	}

	@Override
	public boolean updatefkqr(Tuanbiao tuanbiao) throws Exception {
		// TODO Auto-generated method stub
		String sql=null;
		int rs=0;
		if(tuanbiao.getCaiwuid()!=0&&!"".equals(tuanbiao.getCaiwuid())){
		 sql = "update tuanbiao set caiwuid=?  where id=?";
		 rs=this.update(sql,tuanbiao.getCaiwuid(),tuanbiao.getId());
		
		}
		if(tuanbiao.getShanchu()!=0&&!"".equals(tuanbiao.getShanchu())){
			 sql = "update tuanbiao set shanchu=?  where id=?";
			 rs=this.update(sql,tuanbiao.getShanchu(),tuanbiao.getId());
	    }
		if(tuanbiao.getYingshou()!=0&&!"".equals(tuanbiao.getYingshou())){
			sql = "update tuanbiao set yingshou=?,yishou=?  where id=?";
			 rs=this.update(sql,tuanbiao.getYingshou(),tuanbiao.getYishou(),tuanbiao.getId());
			 
		}
		
		return rs>0;
	}

	@Override
	public boolean deletefkqr(Long id) throws Exception {
		// TODO Auto-generated method stub
		String sql="delete from tuanbiao where id=?";
		int rs=this.update(sql,id);
		return rs>0;
	}

	@Override
	public Pagination<Tuanbiao> getPaginationfkqr(int currentPage,
			int numPerPage, Tuanbiao tuanbiao) throws Exception {
		// TODO Auto-generated method stub
		StringBuffer sql=new StringBuffer("SELECT t.id,t.payment,t.team,t.suppliers,t.caozuo,t.xiaoshou,t.caiwuid,t.zhanghaoid,t.shenfenid,t.chutuantime,t.huituantime,t.yingshou,t.yishou,t.yifu,t.tuikuan,t.fanyong,t.yujilirun,t.shijilirun,t.danhao,t.fukuantime,t.yushoutime,t.huilvID,t.ykfp,t.fpxk,t.fuzeren,t.zhuangtai,t.ysyfID,t.khmc,t.kxsm,t.renshu,t.ddje,t.fankuan,t.yajin,t.cgje,t.cglr,t.zhichu,t.maoli,t.maolilv,t.beizhu,t.yfk,t.baojia,t.chengben,t.shanchu,t.tuanduimc,f.status,f.review,f.confirmed,f.cashier,b.bizhong,b.riqi,b.xianjinhuilv,b.gongshou,b.zhonghang,b.zuidihuilv,b.huilv,b.jianxie,b.jianxiemingchen,b.danwei,s.name,x.name as fname FROM tuanbiao AS t INNER JOIN finance AS f on t.caiwuid=f.id INNER JOIN bizhonghuilv AS b on t.huilvID=b.id INNER JOIN shoukuanxiang as s on t.kxsm=s.id INNER JOIN fukuanxiang as x on t.kxsm=x.id  where t.shanchu=1 ");
      if(tuanbiao.getId()!=0 && !"".equals(tuanbiao.getId())){
			sql.append(" and t.id='");
			sql.append(tuanbiao.getId());
			sql.append("'");
		
	   }
       if(tuanbiao.getCaiwuid()!=0 && !"".equals(tuanbiao.getCaiwuid())){
			sql.append(" and t.caiwuid='");
			sql.append(tuanbiao.getCaiwuid());
			sql.append("'");
		
	}
       if(tuanbiao.getTeam()!=null&&!"".equals(tuanbiao.getTeam())){
    	   
    	   sql.append(" and t.team like '");
			sql.append(tuanbiao.getTeam());
			sql.append("%'");
    	   
       }
       if(tuanbiao.getCaozuo()!=null&&!"".equals(tuanbiao.getCaozuo())){
    	   
    	    sql.append(" and t.caozuo like '");
			sql.append(tuanbiao.getCaozuo());
			sql.append("%'");
    	   
       }
       if(tuanbiao.getYsyfID()!=0&&!"".equals(tuanbiao.getYsyfID())){
    		sql.append(" and t.ysyfid='");
			sql.append(tuanbiao.getYsyfID());
			sql.append("'");
       }
       if(tuanbiao.getKhmc()!=null&&!"".equals(tuanbiao.getKhmc())){
   		    sql.append(" and t.khmc like'");
			sql.append(tuanbiao.getKhmc());
			sql.append("%'");
      }
       if(tuanbiao.getShenfenid()!=0&&!"".equals(tuanbiao.getShenfenid())){
  		    sql.append(" and t.shenfenid='");
			sql.append(tuanbiao.getShenfenid());
			sql.append("'");
     }

    	   return this.getPagination(currentPage, numPerPage, sql.toString());
       }
	}


