package com.fenghuang.dao.impl;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.fenghuang.dao.BaseDao;
import com.fenghuang.dao.ISanpinzhongxinDao;
import com.fenghuang.entiey.Sanpinzhongxin;
import com.fenghuang.util.Pagination;
@Repository
public class SanpinzhongxinDaoImpl extends BaseDao implements ISanpinzhongxinDao {
	@Autowired
	public SanpinzhongxinDaoImpl (@Qualifier("dataSource") DataSource dataSource) {
		super(dataSource);
	}
	@Override
	public boolean AddSanpinzhongxin(Sanpinzhongxin sanpin) throws Exception {
		// TODO Auto-generated method stub
		String sql = "insert into sanpinzhongxin (tuanNo,tuanName," +
				"Areatype,targetpopulation," +
				"Departurecity,TerminalCity," +
				"Producttypes,productbrand," +
				"hotel,numbercountry," +
				"numbermaster,airways," +
				"groupflight,Tourflight," +
				"predict,report," +
				"teamexplains," +"Servicesinclude," +
				"servicenoinclude,notes," +
				"Reviewstatus,Shenpijia," +
				"dakehujia,zhikejia,tonghang,ertongzhanchuang,ertongbuzhanchuang,zibeiqianjia,numberday,zao,zhong,wan,groupdate,Tourdate) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		int num = this.update(sql,
				sanpin.getTuanNo(),
				sanpin.getTuanName(),
				sanpin.getAreatype(),
				sanpin.getTargetpopulation(),
				sanpin.getDeparturecity(),
				sanpin.getTerminalCity(),
				sanpin.getProducttypes(),
				sanpin.getProductbrand(),
				sanpin.getHotel(),
				sanpin.getNumbercountry(),
		        sanpin.getNumbermaster(),
		        sanpin.getAirways(),
		        sanpin.getGroupflight(),
		        sanpin.getTourflight(),
		        sanpin.getPredict(),
		        sanpin.getReport(),
		        sanpin.getTeamexplains(),
		        sanpin.getServicenoinclude(),
		        sanpin.getServicesinclude(),
		        sanpin.getNotes(),
		        sanpin.getReviewstatus(),
		        sanpin.getShenpijia(),
		        sanpin.getDakehujia(),
		        sanpin.getZhikejia(),
		        sanpin.getTonghang(),
		        sanpin.getErtongzhanchuang(),
		        sanpin.getErtongbuzhanchuang(),
		        sanpin.getZibeiqianjia(),
		        sanpin.getNumberday(),
		        sanpin.getZao(),
		        sanpin.getZhong(),
		        sanpin.getWan(),
		        sanpin.getGroupdate(),
		        sanpin.getTourdate());
		return num>0;
	}
	@Override
	public Pagination<Sanpinzhongxin> getByQueryConditionPagination(
			int currentPage, int numPerPage) throws Exception {
		// TODO Auto-generated method stub 
		String sql = "select tuanNo,tuanName,groupdate,Tourdate,targetpopulation,tonghang,zhikejia,numbermaster from sanpinzhongxin";
		return this.getPagination(currentPage, numPerPage, sql);
	}

}