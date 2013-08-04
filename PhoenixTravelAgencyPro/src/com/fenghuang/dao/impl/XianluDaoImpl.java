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
				String sql="insert into xianlu(xianluname,tianshu,guojia,weihuren) values(?,?,?,?)";
				PreparedStatement ps=con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
				ps.setString(1,x.getXianluname());
				ps.setLong(2,x.getTianshu());
				ps.setLong(3,x.getGuojia());
				ps.setLong(4,x.getWeihuren());
				return ps;
			}
		},keyholder);
	
		return keyholder.getKey().intValue();
	}

	@Override
	public boolean delXianlu(Xianlu x) throws Exception {
		// TODO Auto-generated method stub
		
		return false;
	}

	@Override
	public boolean updateXianlu(Xianlu x) throws Exception {
		// TODO Auto-generated method stub
		String sql="";
		int count=this.update(sql);
		return count>0;
	}

	@Override
	public Pagination<Xianlu> xianluinfo(int page, int rows, Long xianid)
			throws Exception {
		// TODO Auto-generated method stub
		String sql = "select * FROM xianlu where 1=1 ";
		StringBuffer sb = new StringBuffer(sql);
		if(xianid!=null && !"".equals(xianid)){			
			sb.append(" and xianid='");
			sb.append(xianid);
			sb.append("'");
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
