package com.fenghuang.dao.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.fenghuang.dao.BaseDao;
import com.fenghuang.dao.ISanpinshenpiDao;
import com.fenghuang.entiey.Sanpinshenpi;
import com.fenghuang.util.Pagination;
@Repository
public class SanpinshenpiDaoImpl extends BaseDao implements ISanpinshenpiDao {
	@Autowired
	public SanpinshenpiDaoImpl(@Qualifier("dataSource")DataSource dataSource){
		super(dataSource);
	}
	@Override
	public boolean Addsanpinshenpi(Sanpinshenpi s) throws Exception {
		// TODO Auto-generated method stub
		s.setTijiaotime(new Date());
		s.setShenpizhuangtai(1);
		String sql = "insert into sanpinshenpi(tuanNo,tijiaouserid,beizhu,tijiaotime,shenpizhuangtai,shenpijieguo,shenpiyijian,shenpiuserid,shenpitime) values(?,?,?,?,?,?,?,?,?)";
		int num = this.update(sql,s.getTuanNo(),s.getTijiaouserid(),s.getBeizhu(),s.getTijiaotime(),s.getShenpizhuangtai(),s.getShenpijieguo(),s.getShenpiyijian(),s.getShenpiuserid(),s.getShenpishijian());
		return num>0;
	}

	@Override
	public boolean delsanpinshenpi(Sanpinshenpi s) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean upsanpinshenpi(Sanpinshenpi s) throws Exception {
		// TODO Auto-generated method stub
		String sql = "UPDATE sanpinshenpi SET tijiaouserid=tijiaouserid+1-1";
		StringBuffer sb = new StringBuffer(sql);
		List l = new ArrayList();
		s.setShenpizhuangtai(2);
		if(s.getShenpizhuangtai()!=0){
			sb.append(",shenpizhuangtai=?");
			l.add(s.getShenpizhuangtai());
		}
		if(s.getShenpijieguo()!=0){
			sb.append(",shenpijieguo=?");
			l.add(s.getShenpijieguo());
		}
		if(s.getShenpiyijian()!=null && !"".equals(s.getShenpiyijian())){
			sb.append(",shenpiyijian=?");
			l.add(s.getShenpiyijian());
		}
		if(s.getShenpiuserid()!=0){
			sb.append(",shenpiuserid=?");
			l.add(s.getShenpiuserid());
		}
		sb.append(",shenpitime=?");
		s.setShenpishijian(new Date());
		l.add(s.getShenpishijian());
		sb.append(" where id=?");
		l.add(s.getId());
		int num = this.update(sb.toString(),l.toArray());
		return num>0;
	}

	@Override
	public Pagination<Sanpinshenpi> sanpinshenpiinfo(int currentPage, int numPerPage,Sanpinshenpi s,Long jiantuanren) throws Exception {
		// TODO Auto-generated method stub
		String sql = "SELECT sanpinshenpi.*,CASE shenpizhuangtai WHEN '1' THEN '未审批' ELSE '已审批' END AS shenpi,sanpinzhongxin.tuanName AS tuanName,jiantuanren.userName AS jiantuanren,CASE shenpijieguo WHEN '1' THEN '审核通过' WHEN '0' THEN ''  ELSE '审核失败' END AS shenhejieguo,shenpiren.userName as shenheren   FROM sanpinshenpi LEFT JOIN sanpinzhongxin ON sanpinzhongxin.tuanNo=sanpinshenpi.tuanNo LEFT JOIN users AS jiantuanren ON sanpinzhongxin.jiantuanren = jiantuanren.id LEFT JOIN users AS shenpiren ON shenpiren.id=sanpinshenpi.shenpiuserid  WHERE 1=1 ";
		StringBuffer sb = new StringBuffer(sql);
		if(s.getShenpizhuangtai()!=0){
			sb.append("and shenpizhuangtai = '"+s.getShenpizhuangtai()+"' ");	
		}
		if(jiantuanren!=null ){
			sb.append("AND sanpinzhongxin.jiantuanren= '"+jiantuanren+"' ");
		}
		
		
		return this.getPagination(currentPage, numPerPage, sb.toString());
	}

}
