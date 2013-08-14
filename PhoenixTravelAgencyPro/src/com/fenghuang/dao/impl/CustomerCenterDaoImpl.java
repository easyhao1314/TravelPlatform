/**
 * 
 */
package com.fenghuang.dao.impl;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import com.fenghuang.dao.BaseDao;
import com.fenghuang.dao.ICustomerCenterDao;
import com.fenghuang.entiey.CustomerAreaWeihu;
import com.fenghuang.entiey.CustomerInfo;
import com.fenghuang.entiey.DictionaryDesc;
import com.fenghuang.entiey.ProvinceSettingDictionary;
import com.fenghuang.entiey.TeamProgressStateDictionary;
import com.fenghuang.util.Pagination;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

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
	public Pagination<CustomerInfo> getCustomInfoListPaginations(int currentPage,int numPerPage,String tuanNo,String name, String type, String lxr,String moblePhone,String telePhone,String qq,String msn, String daqu, String city, String hzjb, String xiaoshou,String zhtime,String jituan) {
		StringBuffer sql = new StringBuffer("select c.id,c.tuanNo,c.name, c.moblePhone,c.telePhone,c.chuanzhen,c.qq,c.msn,c.cjtime,c.lxrs,c.lxr,c.xiaoshou,c.type,c.sex,c.sfzn,c.bz,if(c.sex=15,'男','女') as sexName from customerinfo as c left JOIN dictionarydesc as d ON c.city=d.dicNo  where 1=1 ") ;
		if(tuanNo != null && !"".equals(tuanNo)){
			sql.append(" AND c.tuanNo LIKE '%");
			sql.append(tuanNo);
			sql.append("%'");
		}
		if(name != null && !"".equals(name)){
			sql.append(" AND c.name LIKE '%");
			sql.append(name);
			sql.append("%'");
		}
		if(type != null && !"".equals(type)){
			sql.append(" AND c.type = '");
			sql.append(type);
			sql.append("'");
		}
		if(lxr != null && !"".equals(lxr)){
			sql.append(" AND c.lxr LIKE '%");
			sql.append(lxr);
			sql.append("%'");
		}
		
		if(moblePhone != null && !"".equals(moblePhone)){
			sql.append(" AND c.moblePhone LIKE '%");
			sql.append(moblePhone);
			sql.append("%'");
		}
		if(telePhone != null && !"".equals(telePhone)){
			sql.append(" AND c.telePhone LIKE '%");
			sql.append(lxr);
			sql.append("%'");
		}
		if(qq != null && !"".equals(qq)){
			sql.append(" AND c.qq LIKE '%");
			sql.append(qq);
			sql.append("%'");
		}
		if(msn != null && !"".equals(msn)){
			sql.append(" AND c.msn LIKE '%");
			sql.append(msn);
			sql.append("%'");
		}
		if(daqu != null && !"".equals(daqu)){
			sql.append(" AND c.daqu = '");
			sql.append(daqu);
			sql.append("'");
		}	
		if(city != null && !"".equals(city)){
			sql.append(" AND c.city = '");
			sql.append(city);
			sql.append("'");
		}
		if(hzjb != null && !"".equals(hzjb)){
			sql.append(" AND c.hzjb = '");
			sql.append(hzjb);
			sql.append("'");
		}
		if(xiaoshou != null && !"".equals(xiaoshou)){
			sql.append(" AND c.xiaoshou = '");
			sql.append(xiaoshou);
			sql.append("'");
		}
		if(zhtime != null && !"".equals(zhtime)){
			sql.append(" AND c.zhtime = '");
			sql.append(zhtime);
			sql.append("'");
		}
		if(jituan != null && !"".equals(jituan)){
			sql.append(" AND c.jituan like '%");
			sql.append(jituan);
			sql.append("%'");
		}
		
		
		
		return this.getPagination(currentPage, numPerPage, sql.toString());
	}

	

	@Override
	public boolean deleteCustomById(String id) {
		String sql = "DELETE FROM customerinfo  WHERE id=?" ;
		int count = this.update(sql, id);
		return count>0;
	}

	@Override
	public Integer addCustom(final CustomerInfo customerInfo) {
		
		 KeyHolder keyHolder = new GeneratedKeyHolder();
		 //JdbcTemplate 
		  //这个Dao 本身就继承子 JdbcTemplate CustomerCenterDaoImpl extends BaseDao
		 //BaseDao extends JdbcTemplate
		 //所以this就是  JdbcTemplate。   哈哈！ 行了  下面的自己按照论坛上的操作吧
		 this.update(new PreparedStatementCreator(){
			 SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
				String str=sdf.format(new Date());
			@Override
			public PreparedStatement createPreparedStatement(
					java.sql.Connection con) throws SQLException {
				// TODO Auto-generated method stub
				 String sql = "INSERT INTO customerinfo(tuanNo,name,city,daqu,lxr,post,age,sex,address,moblePhone,telePhone,qq,msn,email,chuanzhen,sfzn,jituan,hzjb,cjtime,zhtime,lxrs,bz,type) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
				PreparedStatement ps = con.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);  
				ps.setString(1, customerInfo.getTuanNo());
				ps.setString(2, customerInfo.getName());
				ps.setLong(3, customerInfo.getCity());
				ps.setLong(4, customerInfo.getDaqu());
				ps.setString(5, customerInfo.getLxr());
				ps.setString(6, customerInfo.getPost());
				ps.setLong(7, customerInfo.getAge());
				ps.setLong(8, customerInfo.getSex());
				ps.setString(9, customerInfo.getAddress());
				ps.setString(10, customerInfo.getMoblePhone());
				ps.setString(11, customerInfo.getTelePhone());
				ps.setString(12, customerInfo.getQq());
				ps.setString(13, customerInfo.getMsn());
				ps.setString(14, customerInfo.getEmail());
				ps.setString(15, customerInfo.getChuanzhen());
				ps.setString(16, customerInfo.getSfzn());
				ps.setString(17, customerInfo.getJituan());
				ps.setLong(18, customerInfo.getHzjb());
				ps.setString(19, str);
				ps.setString(20, str);
				ps.setInt(21, customerInfo.getLxrs());
				ps.setString(22, customerInfo.getBz());
				ps.setLong(23, customerInfo.getType());
				return ps;
			}
		 }, keyHolder);
		 System.out.println(keyHolder.getKey().intValue());
		 return keyHolder.getKey().intValue();
		
		
		
		
//		 String sql = "INSERT INTO customerinfo(tuanNo,name,city,daqu,lxr,post,age,sex,address,moblePhone,telePhone,qq,msn,email,chuanzhen,sfzn,jituan,hzjb,cjtime,zhtime,lxrs,bz,type) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
//		int count = this.update(sql, new PreparedStatementSetter() {
//			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
//			String str=sdf.format(new Date());
//			@Override			
//			public void setValues(PreparedStatement ps) throws SQLException {
//				ps.setString(1, customerInfo.getTuanNo());
//				ps.setString(2, customerInfo.getName());
//				ps.setLong(3, customerInfo.getCity());
//				ps.setLong(4, customerInfo.getDaqu());
//				ps.setString(5, customerInfo.getLxr());
//				ps.setString(6, customerInfo.getPost());
//				ps.setString(7, customerInfo.getAge());
//				ps.setLong(8, customerInfo.getSex());
//				ps.setString(9, customerInfo.getAddress());
//				ps.setString(10, customerInfo.getMoblePhone());
//				ps.setString(11, customerInfo.getTelePhone());
//				ps.setString(12, customerInfo.getQq());
//				ps.setString(13, customerInfo.getMsn());
//				ps.setString(14, customerInfo.getEmail());
//				ps.setString(15, customerInfo.getChuanzhen());
//				ps.setString(16, customerInfo.getSfzn());
//				ps.setString(17, customerInfo.getJituan());
//				ps.setInt(18, customerInfo.getHzjb());
//				ps.setString(19, str);
//				ps.setString(20, str);
//				ps.setInt(21, customerInfo.getLxrs());
//				ps.setString(22, customerInfo.getBz());
//				ps.setInt(23, customerInfo.getType());
//			}



		
	}

	@Override
	public List<Map<String,Object>> findAllCustomName() {
		String sql = "SELECT id , name FROM customerinfo";
		return this.queryForList(sql);
	}

	
	@Override
	public List<Map<String, Object>> findCustomerInfoById(String updateId) {
		String sql = "SELECT * FROM customerinfo c WHERE c.id = ?";
		return this.queryForList(sql, updateId);
	}

	@Override
	public boolean updateCustom(CustomerInfo customerInfo) {
		String sql = "UPDATE customerinfo SET tuanNO=?,name=?,city=?,daqu=?,lxr=?,post=?,age=?,sex=?,address=?,moblePhone=?,telePhone=?,qq=?,msn=?,email=?,chuanzhen=?,sfzn=?,jituan=?,hzjb=?,cjtime=?,zhtime=?,lxrs=?,bz=?,type=? WHERE id=?";
		int count = this.update(sql,customerInfo.getTuanNo(),customerInfo.getName(),customerInfo.getCity(),customerInfo.getDaqu(),customerInfo.getLxr(),customerInfo.getPost(),customerInfo.getAge(),customerInfo.getSex(),customerInfo.getAddress(),
				customerInfo.getMoblePhone(),customerInfo.getTelePhone(),customerInfo.getQq(),customerInfo.getMsn(),customerInfo.getEmail(),customerInfo.getChuanzhen(),customerInfo.getSfzn(),customerInfo.getJituan(),customerInfo.getHzjb(),
				customerInfo.getCjtime(),customerInfo.getZhtime(),customerInfo.getLxrs(),customerInfo.getBz(),customerInfo.getType(),customerInfo.getId());
		return count > 0;
	}

	@Override
	public boolean updateContact(CustomerInfo contactInfo) {
		/**String sql = "UPDATE customerinfo SET name=?,province=?,city=?,contact=?,post=?,moblePhone=?,telePhone=?,qq=?,msn=?,fax=?,email=? WHERE id=?";
		int count = this.update(sql, customerInfo.getName(),customerInfo.getCity(),customerInfo.getDaqu(),customerInfo.getLxr(),customerInfo.getPost(),customerInfo.getAddress(),customerInfo.getMoblePhone(),customerInfo.getTelePhone(),customerInfo.getQq(),customerInfo.getMsn(),customerInfo.getEmail(),customerInfo.getChuanzhen(),customerInfo.getBz(),customerInfo.getType(),customerInfo.getId());
		return count > 0 ;*/
		return false;
	}

	@Override
	public boolean updateXiaoshou(CustomerInfo Customer) {
		// TOD修改销售
		String sql="update customerinfo set xiaoshou=? where id=?";
		int count=this.update(sql,Customer.getXiaoshou(),Customer.getId());
		return count>0;
	}

	@Override
	public String findCityNameById(Long city) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Map<String, Object>> findAllCityName() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public long findProvinceByCityId(long city) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Map<String, Object>> findAllProvionceName() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Pagination<TeamProgressStateDictionary> getCustomVIPListPaginations(
			String wordprefix, Integer page, Integer rows) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean addCustomVIP(TeamProgressStateDictionary team) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteCustomVIP(String deleteRow) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void updateCustomVIPs(List<TeamProgressStateDictionary> teamProList) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean updateCustomVIP(TeamProgressStateDictionary team) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<Map<String, Object>> searchCustomVIP(String tpsdNo,
			String tpsdName, String tpsdHelp, String tpsdSort, String wordprefix) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Pagination<CustomerAreaWeihu> findAllCustomerAreaWeihu(Integer page,
			Integer rows) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean addCustomerArea(Integer id, String name) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteCustomerArea(Integer id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean updateCustomerArea(Integer updateRow, String name) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Integer selectmaxid() {
		// TODO Auto-generated method stub
		String sql="select id from customerinfo where id =(select max(id) from customerinfo)";
		int int1 = this.queryForInt(sql);
		
		return int1;
	}	
	
}
