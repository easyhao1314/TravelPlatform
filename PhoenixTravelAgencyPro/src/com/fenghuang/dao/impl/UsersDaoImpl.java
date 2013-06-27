/**
 * 
 */
package com.fenghuang.dao.impl;

import javax.sql.DataSource;

import org.hibernate.validator.xml.PayloadType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.fenghuang.dao.BaseDao;
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
public class UsersDaoImpl extends BaseDao implements IUserDao {

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
		return rs > 0;
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
		return rs > 0;
	}

	@Override
	public boolean deleteUserById(Long id) throws Exception {
		String sql = "delete from users where id=?";
		int rs = this.update(sql, id);
		return rs > 0;
	}

	@Override
	public Pagination<Users> getPaginationUsers(int currentPage,
			int numPerPage, Users users) throws Exception {
		StringBuffer sql = new StringBuffer(
				"SELECT users.id,users.userNumber,users.userName,users.loginName,users.enName,users.sex,users.telephone,users.birthday,users.telephoneExt,users.email,users.mobilePhone,users.msn,users.fax,users.msn2,users.skype,users.msn3,users.qq,users.companyId,users.departmentId,");
		sql.append("users.jobDescription,");
		sql.append("users.sortNumber,");
		sql.append("users.address,");
		sql.append("users.zip,");
		sql.append("users.remark,");
		sql.append("users.imagePath,");
		sql.append("department.departName");
		sql.append("company.companyName");
		sql.append(" FROM ");
		sql.append("users ,");
		sql.append("department,company");
		sql.append(" WHERE ");
		sql.append("department.id =  users.departmentId  and users.companyId =company.id and 1=1");
		if (users.getUserNumber() != null && !"".equals(users.getUserNumber())) {
			sql.append("  and users.userNumber like '");
			sql.append(users.getUserNumber());
			sql.append("%'");
		}

		if (users.getUserName() != null && !"".equals(users.getUserName())) {
			sql.append("  and users.userName like '");
			sql.append(users.getUserName());
			sql.append("%'");
		}
		if (users.getLoginName() != null && !"".equals(users.getLoginName())) {
			sql.append("  and users.loginName like '");
			sql.append(users.getLoginName());
			sql.append("%'");
		}

		if (users.getEnName() != null && !"".equals(users.getEnName())) {
			sql.append("  and users.enName like '");
			sql.append(users.getEnName());
			sql.append("%'");
		}

		if (users.getSex() != null && !"".equals(users.getSex())) {
			sql.append("  and users.sex='");
			sql.append(users.getSex());
			sql.append("'");
		}
		if (users.getTelephone() != null && !"".equals(users.getTelephone())) {
			sql.append("  and users.telephone like '");
			sql.append(users.getTelephone());
			sql.append("%'");
		}
		if (users.getTelephoneExt() != null
				&& !"".equals(users.getTelephoneExt())) {
			sql.append("  and users.telephoneExt like '");
			sql.append(users.getTelephoneExt());
			sql.append("%'");
		}
		if (users.getEmail() != null && !"".equals(users.getEmail())) {
			sql.append("  and users.email like '");
			sql.append(users.getEmail());
			sql.append("%'");
		}
		if (users.getMobilePhone() != null
				&& !"".equals(users.getMobilePhone())) {
			sql.append("  and users.mobilePhone like '");
			sql.append(users.getMobilePhone());
			sql.append("%'");
		}
		if (users.getMsn() != null && !"".equals(users.getMsn())) {
			sql.append("  and users.msn like '");
			sql.append(users.getMsn());
			sql.append("%'");
		}
		if (users.getFax() != null && !"".equals(users.getFax())) {
			sql.append("  and users.fax like '");
			sql.append(users.getFax());
			sql.append("%'");
		}
		if (users.getMsn2() != null && !"".equals(users.getMsn2())) {
			sql.append("  and users.msn2 like '");
			sql.append(users.getMsn2());
			sql.append("%'");
		}
		if (users.getSkype() != null && !"".equals(users.getSkype())) {
			sql.append("  and users.skype like '");
			sql.append(users.getSkype());
			sql.append("%'");
		}

		if (users.getMsn3() != null && !"".equals(users.getMsn3())) {
			sql.append("  and users.msn3 like '");
			sql.append(users.getMsn3());
			sql.append("%'");
		}

		if (users.getQq() != null && !"".equals(users.getQq())) {
			sql.append("  and users.qq like '");
			sql.append(users.getQq());
			sql.append("%'");
		}

		if (users.getCompanyId() != null && users.getCompanyId() != 0) {
			sql.append("  and users.companyId ='");
			sql.append(users.getCompanyId());
			sql.append("'");
		}
		if (users.getDepartmentId() != null && users.getDepartmentId() != 0) {
			sql.append("  and users.departmentId ='");
			sql.append(users.getDepartmentId());
			sql.append("'");
		}
		if (users.getSortNumber() != null && users.getSortNumber() != 0) {
			sql.append("  and users.sortNumber ='");
			sql.append(users.getSortNumber());
			sql.append("'");
		}

		if (users.getAddress() != null && !"".equals(users.getAddress())) {
			sql.append("  and users.address like '");
			sql.append(users.getAddress());
			sql.append("%'");
		}

		if (users.getZip() != null && !"".equals(users.getZip())) {
			sql.append("  and users.zip like '");
			sql.append(users.getZip());
			sql.append("%'");
		}

		if (users.getRemark() != null && !"".equals(users.getRemark())) {
			sql.append("  and users.remark like '");
			sql.append(users.getRemark());
			sql.append("%'");
		}
		Pagination<Users> paginUsers = this.getPagination(currentPage,
				numPerPage, sql.toString());
		return paginUsers;
	}

	@Override
	public Users getUsersById(Long id) throws Exception {
		String sql = "select * from users where id=?";
		Users user = this.queryForObject(sql, Users.class, id);
		return user;
	}

	@Override
	public boolean updateUserPassword(Long id, String newPassword)
			throws Exception {
		String sql = "update users set password=? where id=?";
		int rs = this.update(sql, newPassword, id);
		return rs > 0;
	}

	@Override
	public String getUsersPasswordById(Long id) throws Exception {
		String sql = "select password from users where id=?";
		String password = this.queryForObject(sql, String.class);
		return password;
	}

	@Override
	public boolean isExistUserLoginName(String LoginName) throws Exception {
		String sql = "selec count(1) from users where loginName=?";
		int rs = this.queryForInt(sql);
		return rs > 0;
	}

	@Override
	public Users getUsersByLoginName(String loginName) throws Exception {
		String sql = "select * from users where loginName = ?";
		Users users = this.queryForObject(sql, Users.class, loginName);

		return null;
	}

}
