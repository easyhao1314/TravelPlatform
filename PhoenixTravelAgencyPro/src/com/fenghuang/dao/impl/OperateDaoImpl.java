package com.fenghuang.dao.impl;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.fenghuang.dao.BaseDao;
import com.fenghuang.dao.IOperateDao;
import com.fenghuang.entiey.Operate;
import com.fenghuang.util.Pagination;
@Repository
public class OperateDaoImpl extends BaseDao implements IOperateDao {
	@Autowired
	public OperateDaoImpl(@Qualifier("dataSource")DataSource datasource) {
		super(datasource);
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public boolean AddOperate(Operate o) {
		// TODO Auto-generated method stub
		String sql ="insert into Operate (tuanNo,tuanName,kehuID,kehuName,chutuantime,huituantime,paidanren,jiedanren,jinzhan,paidantime,operateType,operatestate,beizhu) values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
		int sum = this.update(sql,o.getTuanNo(),o.getTuanName(),o.getKehuID(),o.getKehuName(),o.chutuantime,o.huituantime,o.getPaidanren(),o.getJiedanren(),o.getJinzhan(),o.getPaidantime(),o.getOperateType(),o.getOperatestate(),o.getBeizhu());
		return sum>0;
	}


	@Override
	public boolean UpOperate(Operate o) {
		// TODO Auto-generated method stub
		String sql = "UPDATE Operate SET operatestate=+1-1";
		List list = new ArrayList();
		StringBuffer sb = new StringBuffer(sql);
		if(o.getBeizhu()!=null && !"".equals(o.getBeizhu())){
			sb.append(",beizhu=?");
			list.add(o.getBeizhu());
		}
		if(o.getJinzhan()!=0){
			sb.append(",jinzhan=?");
			list.add(o.getJinzhan());
		}
		if(o.getOid()!=0){
			sb.append(" where oid = ?");
			list.add(o.getOid());
		}
		int num = this.update(sb.toString(),list.toArray());
		return num>0;
	}

	@Override
	public Pagination<Operate> OperateInfo(int page,int rows,Operate o) {
		// TODO Auto-generated method stub select o.*,s.userName from Operate as o LEFT JOIN users as s ON s.id=o.jiedanren   where 1=1 
		String sql = "select o.*,s.userName as jiedan ,ss.userName AS paidan from Operate as o LEFT JOIN users as s ON s.id=o.jiedanren LEFT JOIN users as ss ON ss.id=o.paidanren   where 1=1 ";
		StringBuffer sb = new StringBuffer(sql);
		if(o.getTuanNo()!=null && !"".equals(o.getTuanNo())){
			sb.append(" and tuanNo='");
			sb.append(o.getTuanNo());
			sb.append("'");
		}
		return this.getPagination(page, rows, sb.toString());
	}

}
