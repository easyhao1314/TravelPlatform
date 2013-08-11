package com.fenghuang.dao.impl;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.fenghuang.dao.BaseDao;
import com.fenghuang.dao.ISanpinzhongxinDao;
import com.fenghuang.entiey.Sanpinzhongxin;
import com.fenghuang.util.FengHuangDateUtil;
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
			int currentPage, int numPerPage,Sanpinzhongxin s) throws Exception {
		// TODO Auto-generated method stub 
		String sql = "select s.tuanNo,s.tuanName,s.groupdate,s.Tourdate,s.targetpopulation,s.tonghang,s.zhikejia,s.numbermaster,s.productbrand,t.xlid from sanpinzhongxin as s left join tuanXianlu as t on s.tuanNO=t.tuanNo where 1=1";
		StringBuffer sb = new StringBuffer(sql);
		if(s.getTuanName()!=null && !"".equals(s.getTuanName())){
			sb.append(" and tuanName LIKE '%"+s.getTuanName()+"%'");
		}
		if(s.getGroupdate()!=null && !"".equals(s.getGroupdate())){
			String Groupdate = FengHuangDateUtil.getDateTOString(s.getGroupdate());
			sb.append(" and groupdate >= '"+Groupdate+"'");
		}
		if(s.getTourdate()!=null && !"".equals(s.getTourdate())){
			String Tourdate = FengHuangDateUtil.getDateTOString(s.getTourdate());
			sb.append(" and Tourdate <= '"+Tourdate+"'");
		}
		if(s.getProductbrand()!=0 && !"".equals(s.getProductbrand())){
			sb.append(" and productbrand = '"+s.getProductbrand()+"'");
		}
		if(s.getTuanNo()!=null && !"".equals(s.getTuanNo())){
			sb.append(" and tuanNo = '"+s.getTuanNo()+"'");
		}
		//发布状态为必填
		if(s.getFabustate()!=0){
		sb.append(" and fabustate = '"+s.getFabustate()+"'");
		}
		return this.getPagination(currentPage, numPerPage, sb.toString());
	}
	
	
	@Override
	public boolean upSanpinzhongxin(Sanpinzhongxin sanpin) throws Exception {
		// TODO Auto-generated method stub
		String sql = "UPDATE sanpinzhongxin SET fabustate=fabustate+1-1";
		StringBuffer sb = new StringBuffer(sql);
		List list = new ArrayList();
		
		
		if(sanpin.getFabustate()!=0){
			sb.append(",fabustate=?");
			list.add(sanpin.getFabustate());
		}

		if(sanpin.getShoukestate()!=0){
			sb.append(",shoukestate=?");
			list.add(sanpin.getShoukestate());
		}
		
		if(sanpin.tuanNo!=null && !"".equals(sanpin.getTuanNo())){
			sb.append(" where tuanNo=?");
			list.add(sanpin.getTuanNo());
		}
		int num = this.update(sb.toString(),list.toArray());
	
		return num>0;
	}

}
