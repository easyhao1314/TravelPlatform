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
		String sql="insert into tuanbiao (" +
				"payment,team,suppliers,caozuo,xiaoshou,caiwuid,zhanghaoid,shenfenid,chutuantime,huituantime," +
				"yingshou,yishou,yifu,tuikuan,fanyong,tupiandizhi,shijilirun,danhao,fukuantime,yushoutime," +
				"huilvID,ykfp,fpxk,fuzeren,zhuangtai,ysyfID,khmc,kxsm,renshu,ddje," +
				"fankuan,yajin,cgje,cglr,zhichu,maoli,maolilv,beizhu,yfk,baojia," +
				"chengben,tuanduimc,shanchu) values(" +
				"?,?,?,?,?,?,?,?,?,?," +
				"?,?,?,?,?,?,?,?,?,?," +
				"?,?,?,?,?,?,?,?,?,?," +
				"?,?,?,?,?,?,?,?,?,?," +
				"?,?,?)";
		int a=this.update(sql,tuanbiao.getPayment(),tuanbiao.getTeam(),tuanbiao.getSuppliers(),tuanbiao.getCaozuo(),tuanbiao.getXiaoshou(),
				tuanbiao.getCaiwuid(),tuanbiao.getZhanghaoid(),tuanbiao.getShenfenid(),tuanbiao.getChutuantime(),tuanbiao.getHuituantime(),
				tuanbiao.getYingshou(),tuanbiao.getYishou(),tuanbiao.getYifu(),tuanbiao.getTuikuan(),tuanbiao.getFanyong(),
				tuanbiao.getTupiandizhi(),tuanbiao.getShijilirun(),tuanbiao.getDanhao(),tuanbiao.getFukuantime(),tuanbiao.getYushoutime(),
				tuanbiao.getHuilvID(),tuanbiao.getYkfp(),tuanbiao.getFpxk(),tuanbiao.getFuzeren(),tuanbiao.getZhuangtai(),
				tuanbiao.getYsyfID(),tuanbiao.getKhmc(),tuanbiao.getKxsm(),tuanbiao.getRenshu(),tuanbiao.getDdje(),
				tuanbiao.getFankuan(),tuanbiao.getYajin(),tuanbiao.getCgje(),tuanbiao.getCglr(),tuanbiao.getZhichu(),
				tuanbiao.getMaoli(),tuanbiao.getMaolilv(),tuanbiao.getBeizhu(),tuanbiao.getYfk(),tuanbiao.getBaojia(),
				tuanbiao.getChengben(),tuanbiao.getTuanduimc(),tuanbiao.getShanchu());
		//                                                                                                           5                                                                                                                       10                                                                                                               15                                                                                                                        20                                                                                                    25                                                                                                       30                                                                                                   35                                                                                                   40                                                                                    
		
		return a>0;
	}

	@Override
	public boolean updatefkqr(Tuanbiao tuanbiao) throws Exception {
		// TODO Auto-generated method stub
		String sql=null;
		int rs=0;
		if(tuanbiao.getShanchu()!=0&&!"".equals(tuanbiao.getShanchu())){
		 sql = "update tuanbiao set shanchu=?  where id=?";
		 rs=this.update(sql,tuanbiao.getShanchu(),tuanbiao.getId());
		}
		if(tuanbiao.getCaiwuid()!=0&&!"".equals(tuanbiao.getCaiwuid())){
			 sql = "update tuanbiao set caiwuid=?  where id=?";
			 rs=this.update(sql,tuanbiao.getCaiwuid(),tuanbiao.getId());
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
		StringBuffer sql=new StringBuffer("SELECT de.departName as departName,sanpin.tuanName as sanpinName,jiantuanren.userName as zerenren,users.userName as xiaoshouyuan,ss.userName,t.*,ROUND(t.yingshou*b.huilv,2) as syingshou,ROUND(t.yishou*b.huilv,2) as syishou,ROUND(t.yfk*b.huilv,2) as syfk,ROUND(t.yifu*b.huilv,2) as syifu,f.cashier,f.confirmed,f.review,f.`status`,b.bizhong,b.huilv+b.huilv-b.huilv as huilv,sanpinzhongxin.tuanName as sanpintuanName,dantuan.tuanName AS dantuanName,ROUND(yfk*huilv-yifu*huilv,2) as weifu,ROUND(yingshou*huilv-yishou*huilv,2) as ysweifu FROM tuanbiao AS t LEFT JOIN sanpinzhongxin ON t.tuanduimc=sanpinzhongxin.tuanNo LEFT JOIN finance AS f on t.caiwuid=f.id LEFT JOIN bizhonghuilv AS b on t.huilvID=b.id LEFT JOIN users AS ss ON ss.id=t.caozuo LEFT JOIN department AS de ON de.id=(SELECT users.departmentId FROM users where t.xiaoshou=users.id) LEFT JOIN dantuanxinxi as dantuan on t.tuanduimc=dantuan.tuanNO LEFT JOIN users on t.xiaoshou=users.id LEFT JOIN users as jiantuanren ON jiantuanren.id=sanpinzhongxin.jiantuanren LEFT JOIN sanpinzhongxin as sanpin ON t.tuanduimc=sanpin.tuanNo where t.shanchu=1   ");
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
    	   if(tuanbiao.getShenfenid()==5){
    		   sql.append(" and t.shenfenid!=4");
    	   }else{
  		    sql.append(" and t.shenfenid='");
			sql.append(tuanbiao.getShenfenid());
			sql.append("'");
    	   }
      }
       if(tuanbiao.getTuanduimc()!=null&&!"".equals(tuanbiao.getTuanduimc())){
    	    sql.append(" and t.tuanduimc like'");
			sql.append(tuanbiao.getTuanduimc());
			sql.append("%'");
       }
    	   return this.getPagination(currentPage, numPerPage, sql.toString());
       }
	}


