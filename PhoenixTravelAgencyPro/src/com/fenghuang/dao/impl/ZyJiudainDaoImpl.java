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
		String sql="SELECT j.id,j.chengshi,j.name,j.fangjian,j.hzjb,j.whr,j.xjbz,j.dianhua,j.chuanzhen,j.email,j.guanwang,j.dizhi,j.pingjia,j.tishi,j.danjijia,j.wangjijia,j.jgsm,j.bz,dd.dicName as chengshiName,dd1.dicName as hezuojibie,dd2.dicName as xingjibaozhun FROM jiudian as j left join dictionarydesc as dd on j.chengshi = dd.dicno left join dictionarydesc as dd1 on j.hzjb= dd1.dicno left join dictionarydesc as dd2 on j.xjbz = dd2.dicno where  1=1 ";
		return this.getPagination(currentPage, numPerPage, sql);
	}

	@Override
	public int jiudianAdd(Jiudian jd) {
		// 添加
		String sql="insert into jiudian(chengshi,name,fangjian,hzjb,whr,xjbz,dianhua,chuanzhen,email,guanwang,dizhi,pingjia,tishi,danjijia,wangjijia,jgsm,bz) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		int count=this.update(sql,jd.getChengshi(),jd.getName(),jd.getFangjian(),jd.getHzjb(),jd.getWhr(),jd.getXjbz(),jd.getDanjijia(),jd.getChuanzhen(),jd.getEmail(),jd.getGuanwang(),jd.getDizhi(),
                jd.getPingjia(),jd.getTishi(),jd.getDanjijia(),
                jd.getWangjijia(),jd.getJgsm(),jd.getBz());
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
	public Pagination<Jiudian> jiudianSelectLike(int currentPage, int numPerPage,String name,String chengshi,String weihuren)
			throws Exception {
		// 模糊查询
		StringBuffer sql=new StringBuffer("SELECT j.id,j.name,j.fangjian,j.whr,j.dianhua,j.chuanzhen,j.email,j.guanwang,j.dizhi,j.pingjia,j.tishi,j.danjijia,j.wangjijia,j.jgsm,j.bz,dd.dicName as chengshiName,dd1.dicName as hezuojibie,dd2.dicName as xingjibaozhun FROM jiudian as j,dictionarydesc as dd,dictionarydesc as dd1,dictionarydesc as dd2 where j.chengshi = dd.dicno and j.hzjb= dd1.dicno and j.xjbz = dd2.dicno and 1=1 ");
		if(chengshi != null && !"".equals(chengshi)){
			sql.append(" and chengshi = '");
			sql.append(chengshi);
			sql.append("'");
		}
		if(!"".equals(name) && name!=null){
			sql.append(" and name like '%");
			sql.append(name);
			sql.append("%'");
		}
		if(!"".equals(weihuren) && weihuren!=null){
			sql.append(" and whr like '%");
			sql.append(weihuren);
			sql.append("%'");
		}
		
		 Pagination<Jiudian> jdLike=this.getPagination(currentPage, numPerPage, sql.toString());
		return jdLike;
	}

}
