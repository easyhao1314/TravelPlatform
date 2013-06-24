package com.fenghuang.dao.impl;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.fenghuang.dao.BaseDao;
import com.fenghuang.dao.Idantuan;
import com.fenghuang.entiey.CitySettingDictionary;
import com.fenghuang.entiey.CountrySettingDictionary;
import com.fenghuang.entiey.DantuanXinXi;
import com.fenghuang.entiey.FunctionMenu;
import com.fenghuang.entiey.TestUser;
import com.fenghuang.util.Pagination;
@Repository
public class dantuanImpl extends BaseDao implements Idantuan{

	@Autowired
	public dantuanImpl(@Qualifier("dataSource")DataSource dataSource) {
		super(dataSource);
		// TODO Auto-generated constructor stub
	}

	// 单团添加
	@Override
	public int add(DantuanXinXi dt) {
		String sql="insert into dantuanxinxi (tuanNO,khId,tdczlx,tdm,tdjb,tdzt,cfrs,cfts,cfgj,lyqy,ctsj,htsj,xsNo,jdNo,khjlNo,qzlx,xbqz,xbyq,jdbzNo,zcNo,zhongcNo,wcNo,bssdNo,cheXingNo,jdbjNo,bsbjNo,ycbjNo,dybjNo,qtdjDesc,tsDesc) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
       int i=this.update(sql,dt.getTuanNO(),dt.getKhId(),dt.getTdczlx(),dt.getTdm(),dt.getTdjb(),dt.getTdzt(),dt.getCfrs(),dt.getCfts(),dt.getCfgj(),dt.getLyqy(),
    		                 dt.getCtsj(),dt.getHtsj(),dt.getXsNo(),dt.getJdNo(),dt.getKhjlNo(),dt.getQzlx(),dt.getXbqz(),dt.getXbyq(),dt.getJdbzNo(),dt.getZcNo(),
    		                  dt.getZhongcNo(),dt.getWcNo(),dt.getBssdNo(),dt.getCheXingNo(),dt.getJdbjNo(),dt.getBsbjNo(),dt.getYcbjNo(),dt.getDybjNo(),dt.getQtdjDesc(),dt.getTsDesc());
		return i;
	}

	// 单团查询
	@Override
	public Pagination<DantuanXinXi> getByQueryConditionPagination(int currentPage,int numPerPage) throws Exception{
	
		String sql = "select * from dantuanxinxi";
		return this.getPagination(currentPage, numPerPage, sql);
		
	}
	//模糊查询
	public Pagination<DantuanXinXi>  getDantuanLike(int currentPage,
	int numPerPage,Date ctsj,String lyqy,String tdzt,Long tdjb)throws Exception{
		StringBuffer sql = new StringBuffer("SELECT * from dantanxinxi  where  and 1=1");
		if(ctsj != null && !"".equals(ctsj)){
			sql.append(" and  ctsj ='");
			sql.append(ctsj);
			sql.append("'");
			
		}
		if(lyqy != null && !"".equals(lyqy)){
			sql.append(" and  lyqy like '");
			sql.append(lyqy);
			sql.append("%'");
			
		}
		if(tdzt != null && !"".equals(tdzt)){
			sql.append(" and  tdzt like '");
			sql.append(tdzt);
			sql.append("%'");
			
		}
		if(tdjb != null && tdjb!=0){
			sql.append(" and  tdjb like'");
			sql.append(tdjb);
			sql.append("%'");
			
		}
	    Pagination<DantuanXinXi>  dtlike = this.getPagination(currentPage, numPerPage, sql.toString());
		return dtlike;
	}
	// 单团按id查询.queryForObject
	@Override
	public List<Map<String, Object>> selectDantuanId(String tuanNo){
		String sql = "select * from dantuanxinxi where tuanNo=?";
	    List<Map<String, Object>> queryForList = this.queryForList(sql, tuanNo);
        return queryForList;
	}

	// 单团删除
	@Override
	public  boolean deleteDantuan(String tuanNo){
		String sql="delete from dantuanxinxi where tuanNo=?";
		int count=this.update(sql, tuanNo);
       return count>0;
	}
	// 单团修改

	@Override
	public boolean updateDantuan(DantuanXinXi dt){
		//  修改
		String sql="update DantuanXinXi set khId=?,tdczlx=?,tdm=?,tdjb=?,tdzt=?,cfrs=?,cfts=?,cfgj=?,lyqy=?,ctsj=?,htsj=?,xsNo=?,jdNo=?,khjlNo=?,qzlx=?,xbqz=?,xbyq=?,jdbzNo=?,zcNo=?,zhongcNo=?,wcNo=?,bssdNo=?,cheXingNo=?,jdbjNo=?,bsbjNo=?,ycbjNo=?,dybjNo=?,qtdjDesc=?,tsDesc=? where tuanNO=?";
		int count=this.update(sql,dt.getKhId(),dt.getTdczlx(),dt.getTdm(),dt.getTdjb(),dt.getTdzt(),dt.getCfrs(),dt.getCfts(),dt.getCfgj(),dt.getLyqy(),
                dt.getCtsj(),dt.getHtsj(),dt.getXsNo(),dt.getJdNo(),dt.getKhjlNo(),dt.getQzlx(),dt.getXbqz(),dt.getXbyq(),dt.getJdbzNo(),dt.getZcNo(),
                dt.getZhongcNo(),dt.getWcNo(),dt.getBssdNo(),dt.getCheXingNo(),dt.getJdbjNo(),dt.getBsbjNo(),dt.getYcbjNo(),dt.getDybjNo(),dt.getQtdjDesc(),dt.getTsDesc(),dt.getTuanNO());
		return count>0;
	}



	@Override
	public Pagination<DantuanXinXi> getDantuanDaishen(int currentPage,
			int numPerPage) throws Exception {
		// TODO 待审
		String sql = "select tuanNO,tdm,xsNo,shenpi from dantuanxinxi where shenpi='0'";
		return this.getPagination(currentPage, numPerPage, sql);
	}
	@Override
	public boolean updateshenqi(String tuanNo){
		//是否审批
		String sql="update dantuanxinxi set shenpi=1 where tuanNO=?";
		int count=this.update(sql,tuanNo);
		return count>0;
	}

	@Override
	public Pagination<DantuanXinXi> getDantuanYiqueren(int currentPage,
			int numPerPage) throws Exception {
		// TODO已确认
		String sql = "select * from dantuanxinxi where shenpi='1'";
		return this.getPagination(currentPage, numPerPage, sql);
	}

	@Override
	public boolean updateChengtuan(String tuanNo) {
		// TODO 是否成团
		String sql="update dantuanxinxi set shenpi=0 where tuanNO=?";
		int count=this.update(sql,tuanNo);
		return count>0;
	}

	@Override
	public boolean updateChexiao(String tuanNo) {
		// TODO 撤销成团
		String sql="update dantuanxinxi set shenpi=null where tuanNO=?";
		int count=this.update(sql,tuanNo);
		return count>0;
	}


}
