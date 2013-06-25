/**
 * 
 */
package com.fenghuang.dao.impl;


import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.stereotype.Repository;

import com.fenghuang.dao.BaseDao;
import com.fenghuang.dao.ICustomerCenterDao;
import com.fenghuang.entiey.CustomerInfo;
import com.fenghuang.entiey.DictionaryDesc;
import com.fenghuang.entiey.ProvinceSettingDictionary;
import com.fenghuang.entiey.TeamProgressStateDictionary;
import com.fenghuang.util.Pagination;

/**
 * @author 陈家海
 * 
 */
@Repository
public class CustomerCenterDaoImpl extends BaseDao implements
		ICustomerCenterDao {
	
	@Autowired
	public CustomerCenterDaoImpl(@Qualifier("dataSource") DataSource dataSource) {
		super(dataSource);
	}

	@Override
	public Pagination<CustomerInfo> getCustomInfoListPaginations(int currentPage,
			int numPerPage, String kw) {
		StringBuffer sql = new StringBuffer("SELECT * FROM customerinfo c WHERE 1=1 ") ;
		if(kw != null && !"".equals(kw)){
			sql.append(" AND c.name LIKE '%");
			sql.append(kw);
			sql.append("%'");
		}
		
		return this.getPagination(currentPage, numPerPage, sql.toString());
	}

	@Override
	public String findCityNameById(Long city) {
		String sql = "SELECT cd.cityName FROM citysettingdictionary cd WHERE cd.id = ?";
		return this.queryForObject(sql, new Object[]{city.intValue()},String.class);
	}

	@Override
	public boolean deleteCustomById(String id) {
		String sql = "DELETE FROM customerinfo  WHERE id=?" ;
		int count = this.update(sql, id);
		return count>0;
	}

	@Override
	public boolean addCustom(final CustomerInfo customInfo) {
		String sql = "INSERT INTO customerinfo(name,province,city,contact,post,address,moblePhone,telePhone,qq,msn,fax,email) VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";
		int count = this.update(sql, new PreparedStatementSetter() {
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setString(1, customInfo.getName());
				ps.setLong(2, customInfo.getProvince());
				ps.setLong(3, customInfo.getCity());
				ps.setString(4, customInfo.getContact());
				ps.setString(5, customInfo.getPost());
				ps.setString(6, customInfo.getAddress());
				ps.setString(7, customInfo.getMoblePhone());
				ps.setString(8, customInfo.getTelePhone());
				ps.setString(9, customInfo.getQq());
				ps.setString(10, customInfo.getMsn());
				ps.setString(11, customInfo.getFax());
				ps.setString(12, customInfo.getEmail());
			}
		});
		return count>0;
	}

	@Override
	public List<Map<String,Object>> findAllCustomName() {
		String sql = "SELECT c.id , c.name FROM customerinfo c";
		return this.queryForList(sql);
	}

	@Override
	public List<Map<String, Object>> findAllCityName() {
		String sql = "SELECT c.id , c.cityName FROM citysettingdictionary c";
		return this.queryForList(sql);
	}


	@Override
	public long findProvinceByCityId(long city) {
		String sql = "SELECT c.psdId FROM citysettingdictionary c WHERE c.id=?" ;
		return this.queryForLong(sql, city);
	}

	@Override
	public List<Map<String, Object>> findAllProvionceName() {
		String sql = "SELECT p.id , p.pcdName FROM provincesettingdictionary p" ;
		return this.queryForList(sql);
	}

	@Override
	public List<Map<String, Object>> findCustomerInfoById(String updateId) {
		String sql = "SELECT * FROM customerinfo c WHERE c.id = ?";
		return this.queryForList(sql, updateId);
	}

	@Override
	public boolean updateCustom(CustomerInfo customerInfo) {
		String sql = "UPDATE customerinfo SET name=?,province=?,city=?,contact=?,post=?,address=?,moblePhone=?,telePhone=?,qq=?,msn=?,fax=?,email=? WHERE id=?";
		int count = this.update(sql, customerInfo.getName(),customerInfo.getProvince(),customerInfo.getCity(),customerInfo.getContact(),customerInfo.getPost(),customerInfo.getAddress(),customerInfo.getMoblePhone(),customerInfo.getTelePhone(),customerInfo.getQq(),customerInfo.getMsn(),customerInfo.getFax(),customerInfo.getEmail(),customerInfo.getId());
		return count > 0;
	}

	@Override
	public boolean updateContact(CustomerInfo contactInfo) {
		String sql = "UPDATE customerinfo SET name=?,province=?,city=?,contact=?,post=?,moblePhone=?,telePhone=?,qq=?,msn=?,fax=?,email=? WHERE id=?";
		int count = this.update(sql, contactInfo.getName(),contactInfo.getProvince(),contactInfo.getCity(),contactInfo.getContact(),contactInfo.getAddress(),contactInfo.getMoblePhone(),contactInfo.getTelePhone(),contactInfo.getQq(),contactInfo.getMsn(),contactInfo.getFax(),contactInfo.getEmail(),contactInfo.getId());
		return count > 0 ;
	}

	@Override
	public Pagination<TeamProgressStateDictionary> getCustomVIPListPaginations(
			Integer page, Integer rows) {
		String sql = "SELECT * FROM teamprogressstatedictionary";
		return this.getPagination(page, rows, sql);
	}

	@Override
	public boolean addCustomVIP(TeamProgressStateDictionary team) {
		String sql = "INSERT INTO teamprogressstatedictionary(tpsdNo,tpsdName,tpsdHelp,tpsdSort) VALUES(?,?,?,?)";
		int count = this.update(sql, team.getTpsdNo(),team.getTpsdName(),team.getTpsdHelp(),team.getTpsdSort());
		return count > 0;
	}

	@Override
	public boolean deleteCustomVIP(String deleteRow) {
		String sql = "DELETE FROM teamprogressstatedictionary  WHERE tpsdNo=?";
		int count = this.update(sql, deleteRow) ;
		return count > 0;
	}

	
	@Override
	public void updateCustomVIPs(List<TeamProgressStateDictionary> teamProList) {
		for(TeamProgressStateDictionary team : teamProList){
			updateCustomVIP(team);
		}
	}

	@Override
	public boolean updateCustomVIP(TeamProgressStateDictionary team) {
		String sql = "UPDATE teamprogressstatedictionary SET tpsdName=?,tpsdHelp=?,tpsdSort=? WHERE tpsdNo=?" ;
		int count = this.update(sql, team.getTpsdName(),team.getTpsdHelp(),team.getTpsdSort(),team.getTpsdNo());
		return count > 0;
	}

	@Override
	public List<Map<String, Object>> searchCustomVIP(String tpsdNo,
			String tpsdName, String tpsdHelp, String tpsdSort) {
		StringBuffer sql = new StringBuffer("SELECT * FROM teamprogressstatedictionary t WHERE 1=1 ");
		if(!"".equals(tpsdNo) && tpsdNo != null){
			sql.append(" AND t.tpsdNo="+tpsdNo);
		}
		if(!"".equals(tpsdName) && tpsdName != null){
			sql.append(" AND t.tpsdName LIKE '%" + tpsdName + "%'");
		}
		if(!"".equals(tpsdHelp) && tpsdHelp != null){
			sql.append(" AND tpsdHelp="+tpsdHelp);
		}
		if(!"".equals(tpsdSort) && tpsdSort != null){
			sql.append(" AND t.tpsdSort="+tpsdSort);
		}
		return this.queryForList(sql.toString());
	}

	
}
