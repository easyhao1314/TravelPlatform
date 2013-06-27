package com.fenghuang.dao.impl;

import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.fenghuang.dao.BaseDao;
import com.fenghuang.dao.IZyJiudian;
import com.fenghuang.entiey.DantuanXinXi;
import com.fenghuang.entiey.Jiudian;
import com.fenghuang.util.Pagination;

@Repository
public class ZyJiudainDaoImpl extends BaseDao implements IZyJiudian{
	@Autowired
	public ZyJiudainDaoImpl(@Qualifier("dataSource")DataSource dataSource) {
		super(dataSource);
		// TODO Auto-generated constructor stub
	}

	@Override
	public Pagination<Jiudian> jiudianSelect(int currentPage, int numPerPage)
			throws Exception {
		// 查询
		String sql="select * from jiudian";
		return this.getPagination(currentPage, numPerPage, sql);
	}

	@Override
	public int jiudianAdd(Jiudian jd) {
		// 添加
		String sql="insert into jiudian(id,chengshi,name,fangjian,hzjb,whr,xjbz,dianhua,chuanzhen,email,guanwang,dizhi,pingjia,tishi,danjijia,wangjijia,jgsm,bz) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		int count=this.update(sql,jd.getId(),jd.getChengshi(),jd.getName(),jd.getFangjian(),jd.getHzjb(),jd.getWhr(),jd.getXjbz(),jd.getDanjijia(),jd.getChuanzhen(),jd.getEmail(),jd.getGuanwang(),jd.getDizhi(),
                jd.getPingjia(),jd.getTishi(),jd.getDanjijia(),jd.getWangjijia(),jd.getJgsm(),jd.getBz());
		return count;
	}

	@Override
	public boolean jiudianDelete(long id) {
		// 删除
		String sql="delete from jiudian where id=?";
		int count=this.update(sql,id);
		return count>0;
	}

	@Override
	public List<Map<String, Object>> jiudianSelectId(long id) {
		// 按id查询
		String sql="select * from jiudian where id=?";
		List<Map<String,Object>> list=this.queryForList(sql,id);
		return list;
	}

	@Override
	public boolean jiudianUpdate(Jiudian jd) {
		// 修改
		String sql="update jiudian set chengshi=?,name=?,fangjian=?,hzjb=?,whr=?,xjbz=?,dianhua=?,chuanzhen=?,email=?,guanwang=?,dizhi=?,pingjia=?,tishi=?,danjijia=?,wangjijia=?,jgsm=?,bz=? where id=?";
		int count=this.update(sql,jd.getChengshi(),jd.getName(),jd.getFangjian(),jd.getHzjb(),jd.getWhr(),jd.getXjbz(),jd.getDanjijia(),jd.getChuanzhen(),jd.getEmail(),jd.getGuanwang(),jd.getDizhi(),
				                  jd.getPingjia(),jd.getTishi(),jd.getDanjijia(),jd.getWangjijia(),jd.getJgsm(),jd.getBz(),jd.getId());
		return count>0;
	}

	@Override
	public Pagination<Jiudian> jiudianSelectLike(int currentPage, int numPerPage,String name,int chengshi)
			throws Exception {
		// 模糊查询
		StringBuffer sql=new StringBuffer("select * from jiudian where 1=1");;
		if(!"".equals(name) && name!=null){
			sql.append(" and name like '%");
			sql.append(name);
			sql.append("%'");
		}
		if(!"".equals(chengshi) && chengshi!=0){
			sql.append(" and chengshi='");
			sql.append(chengshi);
			sql.append("'");
		}
		 Pagination<Jiudian> jdLike=this.getPagination(currentPage, numPerPage, sql.toString());
		return jdLike;
	}

}
