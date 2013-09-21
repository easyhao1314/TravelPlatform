package com.fenghuang.dao.impl;

import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fenghuang.dao.BaseDao;
import com.fenghuang.dao.IcaiwutdfylbDao;
import com.fenghuang.entiey.Tuanbiao;
import com.fenghuang.util.Pagination;
@Repository
public class CaiwutdfylbDaoImpl extends BaseDao implements IcaiwutdfylbDao{
	@Autowired
	public CaiwutdfylbDaoImpl(DataSource dataSource) {
		super(dataSource);
		// TODO Auto-generated constructor stub
	}

	@Override
	public boolean savetdfy(Tuanbiao tuanbiao) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean updatetdfy(Tuanbiao tuanbiao) throws Exception {
		// TODO Auto-generated method stub
		 String sql = "update tuanbiao set kxsm=?,zhanghaoid=?,yfk=?,khmc=?,yushoutime=?,yingshou=?,huilvID=?,beizhu=? where id=?";
		   int  rs=this.update(sql,tuanbiao.getKxsm(), tuanbiao.getZhanghaoid(),tuanbiao.getYfk(), tuanbiao.getKhmc(), tuanbiao.getYushoutime(),tuanbiao.getYingshou(), tuanbiao.getHuilvID(), tuanbiao.getBeizhu(),tuanbiao.getId());
		   return rs>0;
	}

	@Override
	public boolean deletetdfy(Long id) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Pagination<Tuanbiao> getPaginationfkqr(int currentPage,
			int numPerPage, Tuanbiao tuanbiao) throws Exception {
		// TODO Auto-generated method stub
		StringBuffer sql=new StringBuffer("SELECT team,caiwuid,id,payment,suppliers,caozuo,xiaoshou,zhanghaoid,shenfenid,chutuantime,huituantime,sum(yingshou) as yingshou,sum(yishou) as yishou,sum(yifu) as yifu,tuikuan,fanyong,yujilirun,shijilirun,danhao,fukuantime,yushoutime,huilvID,ykfp,fpxk,fuzeren,zhuangtai,ysyfID,khmc,kxsm,renshu,ddje,fankuan,yajin,cgje,cglr,zhichu,maoli,maolilv,beizhu,sum(yfk) as yfk,baojia,chengben,tuanduimc,shanchu from tuanbiao   group by team  HAVING 1=1 ");
		
		 if(tuanbiao.getTeam()!=null&&!"".equals(tuanbiao.getTeam())){
	    	   
	    	   sql.append(" and team='");
				sql.append(tuanbiao.getTeam());
				sql.append("'");
	    	   
	       }
		 if(tuanbiao.getTuanduimc()!=null&&!"".equals(tuanbiao.getTuanduimc())){
	    	   
	    	   sql.append(" and tuanduimc='");
				sql.append(tuanbiao.getTuanduimc());
				sql.append("'");
	    	   
	       }
		 if(tuanbiao.getYsyfID()!=0&&!"".equals(tuanbiao.getYsyfID())){
	    	   
	    	   sql.append(" and ysyfid='");
				sql.append(tuanbiao.getYsyfID());
				sql.append("'");
	    	   
	       }
		return this.getPagination(currentPage, numPerPage, sql.toString());
	}

	@Override
	public List<Map<String, Object>> getDictionaryComboboxs() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
