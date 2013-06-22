package com.fenghuang.dao.impl;

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
	public List<Map<String,Object>> getCurrencySettingboboxs() throws Exception{
		String sql = "select csdNo,csdName from countrysettingdictionary";
		List<Map<String, Object>> currency = this.queryForList(sql);
		return currency ;
		
	}

	@Override
	public List<Map<String, Object>> getCountryState() throws Exception {
		// TODO所属 洲
		String sql="select id,csName from countrystate";
		List<Map<String,Object>> countryState=this.queryForList(sql);
		return countryState;
	}

	@Override
	public List<Map<String, Object>> getHotleStar() throws Exception {
		// TODO 酒店星级
		String sql="select hsdNo,hsbName from hotlestardictionary";
		List<Map<String,Object>> hotlestar=this.queryForList(sql);
		return hotlestar;
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
