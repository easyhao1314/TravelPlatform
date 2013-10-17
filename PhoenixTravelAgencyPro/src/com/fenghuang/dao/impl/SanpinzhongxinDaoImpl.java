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
import com.fenghuang.util.CommonUtil;
import com.fenghuang.util.FengHuangDateUtil;
import com.fenghuang.util.Pagination;
@Repository
public class SanpinzhongxinDaoImpl extends BaseDao implements ISanpinzhongxinDao {
	@Autowired
	public SanpinzhongxinDaoImpl (@Qualifier("dataSource") DataSource dataSource) {
		super(dataSource);
	}
	@Override
	public boolean AddSanpinzhongxin(Sanpinzhongxin sanpin,String areatypetext) throws Exception {
		// TODO Auto-generated method stub
		String tuanNotype = "s";
		tuanNotype+=areatypetext;
		String autotuanNo = CommonUtil.getTuanHao(tuanNotype);
		sanpin.setTuanNo(autotuanNo);
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
				"dakehujia,zhikejia,tonghang,ertongzhanchuang,ertongbuzhanchuang,zibeiqianjia,numberday,zao,zhong,wan,groupdate,Tourdate,jiantuanren,beizhu) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
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
	 	        sanpin.getTourdate(),
	 	        sanpin.getJiantuanren(),
	 	        sanpin.getBeizhu());
		return num>0;
	}
	@Override
	public Pagination<Sanpinzhongxin> getByQueryConditionPagination(
			int currentPage, int numPerPage,Sanpinzhongxin s) throws Exception {
		// TODO Auto-generated method stub 
		String sql = "select s.*,ss.userName,t.xlid,chufacs.dicName AS chufa,huics.dicName AS zhongdian,prand.dicName AS prand,renqun.dicName as renqun,(SELECT  COUNT(*) FROM customerinfo cu WHERE s.tuanNo=cu.tuanNo) as yishourenshu from sanpinzhongxin as s LEFT JOIN dictionarydesc AS chufacs ON chufacs.dicNo=s.Departurecity LEFT JOIN dictionarydesc AS huics ON huics.dicNo=s.terminalCity LEFT JOIN dictionarydesc AS prand ON prand.dicNo=s.productbrand left join tuanXianlu as t on s.tuanNO=t.tuanNo LEFT JOIN dictionarydesc AS renqun ON renqun.dicNo=s.targetpopulation LEFT JOIN users as ss ON ss.id=s.jiantuanren where 1=1";
		StringBuffer sb = new StringBuffer(sql);
		if(s.getTuanName()!=null && !"".equals(s.getTuanName())){
			sb.append(" and s.tuanName LIKE '%"+s.getTuanName()+"%'");
		}
		if(s.getGroupdate()!=null && !"".equals(s.getGroupdate())){
			String Groupdate = FengHuangDateUtil.getDateTOString(s.getGroupdate());
			sb.append(" and s.groupdate >= '"+Groupdate+"'");
		}
		if(s.getTourdate()!=null && !"".equals(s.getTourdate())){
			String Tourdate = FengHuangDateUtil.getDateTOString(s.getTourdate());
			sb.append(" and s.Tourdate <= '"+Tourdate+"'");
		}
		if(s.getProductbrand()!=0 && !"".equals(s.getProductbrand())){
			sb.append(" and s.productbrand = '"+s.getProductbrand()+"'");
		}
		if(s.getJiantuanren()!=0){
			sb.append(" and s.jiantuanren = '"+s.getJiantuanren()+"'");
		}
		if(s.getTuanNo()!=null && !"".equals(s.getTuanNo())){
			sb.append(" and s.tuanNo = '"+s.getTuanNo()+"'");
		}
		if(s.getFabustate()!=0){
		sb.append(" and s.fabustate = '"+s.getFabustate()+"'");
		}
		return this.getPagination(currentPage, numPerPage, sb.toString());
	}
	
	
	@Override
	public boolean upSanpinzhongxin(Sanpinzhongxin sanpin) throws Exception {
		// TODO Auto-generated method stub
		/*String sql="UPDATE sanpinzhongxin SET tuanName=?,areatype=?,Departurecity=?,TerminalCity=?,Producttypes=?"+
				",productbrand=?,hotel=?,numbercountry=?,numbermaster=?,airways=?"+
				",groupflight=?,Tourflight=?,predict=?,report=?,teamexplains=?" +
				",Servicesinclude=?,servicenoinclude=?,notes=?,Reviewstatus=?,Shenpijia=?" +
				",dakehujia=?,zhikejia=?,tonghang=?,ertongzhanchuang=?,ertongbuzhanchuang=?" +
				",zibeiqianjia=?,numberday=?,groupdate=?,Tourdate=?,zao=?" +
				",zhong=?,wan=?,fabustate=?,shoukestate=? where tuanNo=?";
		int sum=this.update(sql,sanpin.getTuanName(),sanpin.getAreatype(),sanpin.getDeparturecity(),sanpin.getTerminalCity(),sanpin.getProducttypes(),
				sanpin.getProductbrand(),sanpin.getHotel(),sanpin.getNumbercountry(),sanpin.getNumbermaster(),sanpin.getAirways(),
				sanpin.getGroupflight(),sanpin.getTourflight(),sanpin.getPredict(),sanpin.getReport(),sanpin.getTeamexplains(),
				sanpin.getServicesinclude(),sanpin.getServicenoinclude(),sanpin.getNotes(),sanpin.getReviewstatus(),sanpin.getShenpijia(),
				sanpin.getDakehujia(),sanpin.getZhikejia(),sanpin.getTonghang(),sanpin.getErtongzhanchuang(),sanpin.getErtongbuzhanchuang(),
				sanpin.getZibeiqianjia(),sanpin.getNumberday(),sanpin.getGroupdate(),sanpin.getTourdate(),sanpin.getZao(),
				sanpin.getZhong(),sanpin.getWan(),sanpin.getFabustate(),sanpin.getShoukestate(),sanpin.getTuanNo()
				);*/
		String sql = "UPDATE sanpinzhongxin SET fabustate=fabustate+1-1";
		StringBuffer sb = new StringBuffer(sql);
		List list = new ArrayList();
		if(sanpin.getTuanName()!=null && !"".equals(sanpin.getTuanName())){
			sb.append(",tuanName=?");
			list.add(sanpin.getTuanName());
		}
		if(sanpin.getAreatype()!=0){
			sb.append(",Areatype=?");
			list.add(sanpin.getAreatype());
		}
		if(sanpin.getTargetpopulation()!=0){
			sb.append(",targetpopulation=?");
			list.add(sanpin.getTargetpopulation());
		}
		if(sanpin.getDeparturecity()!=0){
			sb.append(",Departurecity=?");
			list.add(sanpin.getDeparturecity());
		}
		if(sanpin.getTerminalCity()!=0){
			sb.append(",TerminalCity=?");
			list.add(sanpin.getTerminalCity());
		}
		if(sanpin.getProducttypes()!=0){
			sb.append(",Producttypes=?");
			list.add(sanpin.getProducttypes());
		}
		if(sanpin.getProductbrand()!=0){
			sb.append(",productbrand=?");
			list.add(sanpin.getProductbrand());
		}
		if(sanpin.getHotel()!=0){
			sb.append(",hotel=?");
			list.add(sanpin.getHotel());
		}
		if(sanpin.getNumbercountry()!=0){
			sb.append(",numbercountry=?");
			list.add(sanpin.getNumbercountry());
		}
		if(sanpin.getNumbermaster()!=0){
			sb.append(",numbermaster=?");
			list.add(sanpin.getNumbermaster());
		}
		if(sanpin.getAirways()!=null && !"".equals(sanpin.getAirways())){
			sb.append(",airways=?");
			list.add(sanpin.getAirways());
		}
		if(sanpin.getGroupflight()!=null && !"".equals(sanpin.getGroupflight())){
			sb.append(",groupflight=?");
			list.add(sanpin.getGroupflight());
		}
		if(sanpin.getTourflight()!=null && !"".equals(sanpin.getTourflight())){
			sb.append(",Tourflight=?");
			list.add(sanpin.getTourflight());
		}
		if(sanpin.getPredict()!=0){
			sb.append(",predict=?");
			list.add(sanpin.getPredict());
		}
		if(sanpin.getReport()!=0){
			sb.append(",report=?");
			list.add(sanpin.getReport());
		}
		if(sanpin.getTeamexplains()!=null && !"".equals(sanpin.getTeamexplains())){
			sb.append(",teamexplains=?");
			list.add(sanpin.getTeamexplains());
		}
		if(sanpin.getServicesinclude()!=null && !"".equals(sanpin.getServicesinclude())){
			sb.append(",Servicesinclude=?");
			list.add(sanpin.getServicesinclude());
		}
		if(sanpin.getServicenoinclude()!=null && !"".equals(sanpin.getServicenoinclude())){
			sb.append(",servicenoinclude=?");
			list.add(sanpin.getServicenoinclude());
		}
		if(sanpin.getNotes()!=null && !"".equals(sanpin.getNotes())){
			sb.append(",notes=?");
			list.add(sanpin.getNotes());
		}
		if(sanpin.getReviewstatus()!=0){
			sb.append(",Reviewstatus=?");
			list.add(sanpin.getReviewstatus());
		}
		if(sanpin.getShenpijia()!=0){
			sb.append(",Shenpijia=?");
			list.add(sanpin.getShenpijia());
		}
		if(sanpin.getDakehujia()!=0){
			sb.append(",dakehujia=?");
			list.add(sanpin.getDakehujia());
		}
		if(sanpin.getZhikejia()!=0){
			sb.append(",zhikejia=?");
			list.add(sanpin.getZhikejia());
		}
		if(sanpin.getTonghang()!=0){
			sb.append(",tonghang=?");
			list.add(sanpin.getTonghang());
		}
		if(sanpin.getErtongzhanchuang()!=0){
			sb.append(",ertongzhanchuang=?");
			list.add(sanpin.getErtongzhanchuang());
		}
		if(sanpin.getErtongbuzhanchuang()!=0){
			sb.append(",ertongbuzhanchuang=?");
			list.add(sanpin.getErtongbuzhanchuang());
		}
		if(sanpin.getZibeiqianjia()!=0){
			sb.append(",zibeiqianjia=?");
			list.add(sanpin.getZibeiqianjia());
		}
		if(sanpin.getNumberday()!=0){
			sb.append(",numberday=?");
			list.add(sanpin.getNumberday());
		}
		if(sanpin.getGroupdate()!=null && !"".equals(sanpin.getGroupdate())){
			sb.append(",groupdate=?");
			list.add(sanpin.getGroupdate());
		}
		if(sanpin.getTourdate()!=null && !"".equals(sanpin.getTourdate())){
			sb.append(",Tourdate=?");
			list.add(sanpin.getTourdate());
		}
		if(sanpin.getZao()!=0){
			sb.append(",zao=?");
			list.add(sanpin.getZao());
		}
		if(sanpin.getZhong()!=0){
			sb.append(",zhong=?");
			list.add(sanpin.getZhong());
		}
		if(sanpin.getWan()!=0){
			sb.append(",wan=?");
			list.add(sanpin.getWan());
		}
		if(sanpin.getFabustate()!=0){
			sb.append(",fabustate=?");
			list.add(sanpin.getFabustate());
		}

		if(sanpin.getShoukestate()!=0){
			sb.append(",shoukestate=?");
			list.add(sanpin.getShoukestate());
		}
		if(sanpin.getTupian()!=null && !"".equals(sanpin.getTupian())){
			sb.append(",tupian=?");
			list.add(sanpin.getTupian());
		}
		if(sanpin.getBeizhu()!=null && !"".equals(sanpin.getBeizhu())){
			sb.append(",beizhu=?");
			list.add(sanpin.getBeizhu());
		}
		if(sanpin.tuanNo!=null && !"".equals(sanpin.getTuanNo())){
			sb.append(" where tuanNo=?");
			list.add(sanpin.getTuanNo());
		}
		int num = this.update(sb.toString(),list.toArray());
		
		return num>0;
	}
	@Override
	public boolean DeleteSanpinzhongxin(Sanpinzhongxin sanpin, String xianluid)
			throws Exception {
		// TODO Auto-generated method stub
		StringBuffer sb = new StringBuffer("delete from sanpinzhongxin where tuanNo=?");
		int num = this.update(sb.toString(),sanpin.getTuanNo());
		return num>0;
	}

}
