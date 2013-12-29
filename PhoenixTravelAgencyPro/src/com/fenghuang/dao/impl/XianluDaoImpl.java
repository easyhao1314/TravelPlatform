package com.fenghuang.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import com.fenghuang.dao.BaseDao;
import com.fenghuang.dao.IXianluDao;
import com.fenghuang.entiey.Xianlu;
import com.fenghuang.util.Pagination;
@Repository
public class XianluDaoImpl extends BaseDao implements IXianluDao {
	@Autowired
	public XianluDaoImpl(@Qualifier("dataSource") DataSource dataSource){
		super(dataSource);
	}
	
	@Override
	public Integer AddXianlu( final Xianlu x) throws Exception {
		// TODO Auto-generated method stu
		KeyHolder keyholder=new GeneratedKeyHolder();
		this.update(new PreparedStatementCreator(){
			SimpleDateFormat sdf=new SimpleDateFormat();
			String str=sdf.format(new Date());
			@Override
			public PreparedStatement createPreparedStatement(Connection con)
					throws SQLException {
				// TODO Auto-generated method stub
				String sql="insert into xianlu(xianluname,tianshu,guojia,weihuren,xingchengku) values(?,?,?,?,?)";
				PreparedStatement ps=con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
				ps.setString(1,x.getXianluname());
				ps.setLong(2,x.getTianshu());
				ps.setLong(3,x.getGuojia());
				ps.setLong(4,x.getWeihuren());
				ps.setLong(5,x.getXingchengku());
				return ps;
			}
		},keyholder);
	
		return keyholder.getKey().intValue();
	}

	@Override
	public boolean delXianlu(Xianlu x) throws Exception {
		// TODO Auto-generated method stub
		String sql = "delete from xianlu where xianid=?";
		
		int count = this.update(sql,x.getXianid());
		return count>0;
	}

	@Override
	public boolean updateXianlu(Xianlu x) throws Exception {
		// TODO Auto-generated method stub
		String sql="update xianlu set xianluname=?,tianshu=?,guojia=?,xingchengku=? where xianid=?";
		int count=this.update(sql,x.getXianluname(),x.getTianshu(),x.getGuojia(),x.getXingchengku(),x.getXianid());
		return count>0;
	}

	@Override
	public Pagination<Xianlu> xianluinfo(int page, int rows, Xianlu x)
			throws Exception {
		// TODO Auto-generated method stub
		String sql = "select xianlu.*,users.userName FROM xianlu LEFT JOIN users ON xianlu.weihuren=users.id where 1=1 ";
		StringBuffer sb = new StringBuffer(sql);
		if(x.getXianid()!=0 && !"".equals(x.getXianid())){
			sb.append("and xianid = '"+x.getXianid()+"'");
		}
		if(x.getXingchengku()!=0){
			sb.append("and xingchengku = '"+x.getXingchengku()+"'");
		}
		
		return this.getPagination(page, rows, sb.toString());
	}

	@Override
	public List<Map<String, Object>> selectXianlu() throws Exception {
		// TODO Auto-generated method stub
		String sql="select  max(xianid) as xianid from xianlu";
		return  this.queryForList(sql);
	}

}
