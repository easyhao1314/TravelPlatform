package com.fenghuang.dao.impl;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.fenghuang.dao.BaseDao;
import com.fenghuang.dao.ICountrySettingDictionaryDao;
import com.fenghuang.entiey.CountrySettingDictionary;
import com.fenghuang.util.Pagination;

@Repository
public class CountrySettingDictionaryDaoImpl extends BaseDao implements
		ICountrySettingDictionaryDao {

	@Autowired
	public CountrySettingDictionaryDaoImpl(@Qualifier("dataSource")DataSource dataSource) {
		super(dataSource);
		
	}

	@Override
	public boolean saveCountrySettingDictionary(CountrySettingDictionary csd)
			throws Exception {
		String sql ="insert into countrysettingdictionary(csdNo,csdName,csdEnName,stateId,areaId,csdCurrency,minVisaFees,maxVisFees,invitationCosts,taskCosts) values(?,?,?,?,?,?,?,?,?,?)";
		int rs = this.update(sql, csd.getCsdNo(),csd.getCsdName(),csd.getCsdEnName(),csd.getStateId(),csd.getAreaId(),csd.getCsdCurrency(),csd.getMinVisaFees(),csd.getMaxVisFees(),csd.getInvitationCosts(),csd.getTaskCosts());
		return rs >0;
	}

	@Override
	public boolean updateCountrySettingDictionary(CountrySettingDictionary csd)
			throws Exception {
		String sql = "update countrysettingdictionary set csdName=?,csdEnName=?,stateId=?,areaId=?,csdCurrency=?,minVisaFees=?,maxVisFees=?,invitationCosts=?,taskCosts=? where csdNo=?";
		int rs = this.update(sql, csd.getCsdName(),csd.getCsdEnName(),csd.getStateId(),csd.getAreaId(),csd.getCsdCurrency(),csd.getMinVisaFees(),csd.getMaxVisFees(),csd.getInvitationCosts(),csd.getTaskCosts(),csd.getCsdNo());
		return rs>0;
	}

	@Override
	public boolean deleteCountrySettingDictionaryByCsdNo(String csdNo)
			throws Exception {
		String sql = "delete from countrysettingdictionary where csdNo=?";
		int rs = this.update(sql, csdNo);
		return rs > 0;
	}

	@Override
	public Pagination<CountrySettingDictionary> getPaginationCountrySettingDictionarys(
			int currentPage, int numPerPage, CountrySettingDictionary csd)
			throws Exception {
		StringBuffer sql = new StringBuffer("SELECT csd.csdNo,csd.csdName,csd.csdEnName,csd.stateId,csd.areaId,csd.csdCurrency,csd.minVisaFees,csd.maxVisFees,csd.invitationCosts,csd.taskCosts FROM countrysettingdictionary AS csd where 1=1");
		if(csd.getCsdNo() != null &&!"".equals(csd.getCsdNo())){
			sql.append(" and csd.csdNo='");
			sql.append(csd.getCsdNo());
			sql.append("'");
		}
		if(csd.getCsdName() != null && !"".equals(csd.getCsdName())){
			sql.append(" and csd.csdName like '");
			sql.append(csd.getCsdName());
			sql.append("%'");
		}
		
		if(csd.getCsdEnName() != null && !"".equals(csd.getCsdEnName())){
			sql.append(" and csd.csdEnName like '");
			sql.append(csd.getCsdEnName());
			sql.append("%'");
		}
		if(csd.getCsdCurrency()!=null && !"".equals(csd.getCsdCurrency())){
			sql.append(" and csd.csdCurrency like '");
			sql.append(csd.getCsdCurrency());
			sql.append("%'");
		}
		if(csd.getStateId() != null && !"".equals(csd.getStateId())){
			sql.append(" and csd.stateId ='");
			sql.append(csd.getStateId());
			sql.append("'");
		}
		
		if(csd.getAreaId() != null && !"".equals(csd.getAreaId())){
			sql.append(" and csd.areaId ='");
			sql.append(csd.getAreaId());
			sql.append("'");
		}
		Pagination<CountrySettingDictionary> pcsds = this.getPagination(currentPage, numPerPage, sql.toString());
		return pcsds;
	}

}
