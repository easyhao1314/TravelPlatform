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
		 String sql = "update tuanbiao set kxsm=?,zhanghaoid=?,yfk=?,khmc=?,yushoutime=?,fukuantime=?,yingshou=?,huilvID=?,beizhu=?,ykfp=?,fpxk=? where id=?";
		   int  rs=this.update(sql,tuanbiao.getKxsm(), tuanbiao.getZhanghaoid(),tuanbiao.getYfk(), tuanbiao.getKhmc(), tuanbiao.getYushoutime(),tuanbiao.getFukuantime(),tuanbiao.getYingshou(), tuanbiao.getHuilvID(), tuanbiao.getBeizhu(),tuanbiao.getYkfp(),tuanbiao.getFpxk(),tuanbiao.getId());
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
		StringBuffer sql=new StringBuffer("SELECT z.tuanName AS sanpinName,z.groupdate as sanpinchutuan,z.Tourdate as sanpinhuituan, jiantuanren.userName as zerenren,t.*,f.cashier,f.confirmed,f.review,f.`status`,sum(ROUND(t.yingshou*b.huilv,2)) as syingshou ,sum(ROUND(t.yishou*b.huilv,2)) as syishou,sum(ROUND(t.yifu*b.huilv,2)) as syifu ,sum(ROUND(t.yfk*b.huilv,2)) as syfk ,s.userName as xiaoshouyuan,b.huilv+b.huilv-b.huilv as huilv,b.bizhong as bizhong,sum(ROUND(t.yingshou*b.huilv-t.yishou*b.huilv,2)) as weishou,sum(ROUND(t.yfk*b.huilv-t.yifu*b.huilv,2)) as weifu,sum(ROUND(t.yingshou*b.huilv-t.yfk*b.huilv,2)) as yuji from tuanbiao AS t LEFT JOIN users AS s ON s.id=t.xiaoshou LEFT JOIN bizhonghuilv as b on t.huilvID=b.id LEFT JOIN finance as f on t.caiwuid=f.id LEFT JOIN sanpinzhongxin ON t.tuanduimc = sanpinzhongxin.tuanNo LEFT JOIN users as jiantuanren ON jiantuanren.id=sanpinzhongxin.jiantuanren LEFT JOIN sanpinzhongxin as z on z.tuanNo=t.tuanduimc  where shanchu=1  ");
		 if(tuanbiao.getTeam()!=null&&!"".equals(tuanbiao.getTeam())){
	    	   
			    sql.append(" and t.team like '");
				sql.append(tuanbiao.getTeam());
				sql.append("%'");
	    	   
	       }
		 if(tuanbiao.getTuanduimc()!=null&&!"".equals(tuanbiao.getTuanduimc())){
	    	   
	    	    sql.append(" and t.tuanduimc like'");
				sql.append(tuanbiao.getTuanduimc());
				sql.append("%'"); 
	       }
		 if(tuanbiao.getYsyfID()!=0&&!"".equals(tuanbiao.getYsyfID())){
	    	   
	    	    sql.append(" and ysyfid='");
				sql.append(tuanbiao.getYsyfID());
				sql.append("'");
	    	   
	       }
		 sql.append(" group by tuanduimc");
		return this.getPagination(currentPage, numPerPage, sql.toString());
	}

	@Override
	public List<Map<String, Object>> getDictionaryComboboxs() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
