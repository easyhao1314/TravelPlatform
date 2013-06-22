/**
 * 
 */
package com.fenghuang.dao.impl;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.fenghuang.dao.IUserDao;
import com.fenghuang.entiey.Users;
import com.fenghuang.entiey.Usersrr;
import com.fenghuang.util.Pagination;

/**
 * @author 鲍国浩
 * 
 *         版本 ： 1.0
 * 
 *         日期 ：2013-5-27
 * 
 *         描述 ：
 * 
 * 
 */
@Repository
public class UsersDaoImpl extends JdbcTemplate implements IUserDao {

	@Autowired
	public UsersDaoImpl(@Qualifier("dataSource") DataSource dataSource) {
		super(dataSource);
	}

	@Override
	public int addUsers(Usersrr users) throws Exception {
		String sql = "insert into users (userName,loginName,enName,sex,phone,birthday,phone1,email,fax,password)";
		return 0;
	}

	@Override
	public Usersrr queryUsersById(Long id) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean saveUsers(Users users) throws Exception {
		String sql = "insert into users (userNumber,userName,loginName,enName,sex,telephone,birthday,telephoneExt,email,mobilePhone,msn,fax,msn2,skype,msn3,qq,companyId,departmentId,jobDescription,sortNumber,address,zip,remark,imagePath,password) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		int rs = this.update(sql, users.getUserNumber(), users.getUserName(),
				users.getLoginName(), users.getEnName(), users.getSex(),
				users.getTelephone(), users.getBirthday(),
				users.getTelephoneExt(), users.getEmail(),
				users.getMobilePhone(), users.getMsn(), users.getFax(),
				users.getMsn2(), users.getMsn2(), users.getSkype(),
				users.getMsn3(), users.getQq(), users.getCompanyId(),
				users.getDepartmentId(), users.getSortNumber(),
				users.getAddress(), users.getZip(), users.getRemark(),
				users.getImagePath(), users.getPassword());
		return rs >0;
	}

	@Override
	public boolean updateUsers(Users users) throws Exception {
		
		String sql = "update users set userNumber=?,userName=?,loginName=?,enName=?,sex=?,telephone=?,birthday=?,telephoneExt=?,email=?,mobilePhone=?,msn=?,fax=?,msn2=?,skype=?,msn3=?,qq=?,companyId=?,departmentId=?,jobDescription=?,sortNumber=?,address=?,zip=?,remark=?,imagePath=? where id =? ";
        int rs = this.update(sql, users.getUserNumber(), users.getUserName(),
				users.getLoginName(), users.getEnName(), users.getSex(),
				users.getTelephone(), users.getBirthday(),
				users.getTelephoneExt(), users.getEmail(),
				users.getMobilePhone(), users.getMsn(), users.getFax(),
				users.getMsn2(), users.getMsn2(), users.getSkype(),
				users.getMsn3(), users.getQq(), users.getCompanyId(),
				users.getDepartmentId(), users.getSortNumber(),
				users.getAddress(), users.getZip(), users.getRemark(),
				users.getImagePath(), users.getId());		
		return rs >0;
	}

	@Override
	public boolean deleteUserById(Long id) throws Exception {
		String sql = "delete from users where id=?";
		int rs = this.update(sql, id);
		return rs>0;
	}

	@Override
	public Pagination<Users> getPaginationUsers(int currentPage,
			int numPerPage, Users users) throws Exception {
		StringBuffer sql = new StringBuffer("select * from users where 1=1 ");
		
		
		return null;
	}

	@Override
	public Users getUsersById(Long id) throws Exception {
		String sql = "select * from users where id=?";
		Users user =this.queryForObject(sql, Users.class, id);
		return user;
	}

}
