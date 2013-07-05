package com.fenghuang.dao.impl;

import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fenghuang.dao.BaseDao;
import com.fenghuang.dao.IZyJiaotongDao;
import com.fenghuang.entiey.Jiaotong;
import com.fenghuang.util.Pagination;
@Repository
public class ZyJiaotongDaoIMpl extends BaseDao implements IZyJiaotongDao{
	@Autowired
	public ZyJiaotongDaoIMpl(DataSource dataSource) {
		super(dataSource);
		// TODO Auto-generated constructor stub
	}

	@Override
	public boolean jiaotongAdd(Jiaotong jt) throws Exception {
		// TODO 增
		String sql="insert into jiaotong (id,name,lianxiren,chengshiId,dizhi,dianhua,shouji,email,chuanzhen,wangzhi,jiage,hzjbId,whfsid,beizhu) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		int count=this.update(sql,jt.getId(),jt.getName(),jt.getLianxiren(),jt.getChengshiId(),jt.getDizhi(),jt.getDianhua(),jt.getShouji(),jt.getEmail(),jt.getChuanzhen(),jt.getWangzhi(),
				              jt.getJiage(),jt.getHzjbId(),jt.getWhfsid(),jt.getBeizhu());
		return count>0;
	}

	@Override
	public boolean jiaotongDelete(long id) throws Exception {
		// TODO 删
		String sql="delete from jiaotong where id=?";
	    int count=this.update(sql,id);
		return count>0;
	}

	@Override
	public boolean jiaotongUpdate(Jiaotong jt) throws Exception {
		// TODO 改
		String sql="update jiaotong set name=?,lianxiren=?,chengshiId=?,dizhi=?,dianhua=?,shouji=?,email=?,chuanzhen=?,wangzhi=?,jiage=?,hzjbId=?,whfsid=?,beizhu=? where id=?";
		int count=this.update(sql,jt.getName(),jt.getLianxiren(),jt.getChengshiId(),jt.getDizhi(),jt.getDianhua(),jt.getShouji(),jt.getEmail(),jt.getChuanzhen(),jt.getWangzhi(),
	              jt.getJiage(),jt.getHzjbId(),jt.getWhfsid(),jt.getBeizhu(),jt.getId());
		return count>0;
	}

	@Override
	public List<Map<String, Object>> jiaotongSelectId(long id) throws Exception {
		// TODO Auto-generated method stub
		String sql="select * from jiaotong where id=?";
		List<Map<String,Object>> list=this.queryForList(sql,id);
		return list;
	}

	@Override
	public Pagination<Jiaotong> jiaotongSelect(int currentPage, int numPerPage,String name,String chengshiId,String lianxiren,String hzjbId)
			throws Exception {
		// TODO Auto-generated method stub
		StringBuffer sql=new StringBuffer("select * from jiaotong where 1=1 ");
		if(name !=null && !"".equals(name)){
			sql.append(" and name like '%");
			sql.append(name);
			sql.append("%'");
		}
		if(chengshiId !=null && !"".equals(chengshiId)){
			sql.append(" and chengshiId ='");
			sql.append(chengshiId);
			sql.append("'");
		}
		if(lianxiren !=null && !"".equals(lianxiren)){
			sql.append(" and lianxiren ='");
			sql.append(lianxiren);
			sql.append("'");
		}
		if(hzjbId !=null && !"".equals(hzjbId)){
			sql.append(" and hzjbId ='");
			sql.append(hzjbId);
			sql.append("'");
		}
		Pagination<Jiaotong> jt=this.getPagination(currentPage, numPerPage, sql.toString());
		return jt;
	};

	

}
