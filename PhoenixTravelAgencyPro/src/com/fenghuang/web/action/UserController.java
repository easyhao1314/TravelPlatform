package com.fenghuang.web.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fenghuang.entiey.Company;
import com.fenghuang.entiey.Users;
import com.fenghuang.service.IUsersService;
import com.fenghuang.util.FengHuangDateUtil;
import com.fenghuang.util.FengHuangMd5Util;
import com.fenghuang.util.Pagination;

/**
 * 
 * @author 鲍国浩
 * 
 *         日期 @2013-6-24
 * 
 *         描述：
 * 
 * 
 * 
 */
@Controller
public class UserController {

	@Autowired
	private IUsersService iUsersService;

	/**
	 * 查询用户信息列表
	 * 
	 * @param request
	 * @param response
	 * @param pages
	 * @param rows
	 * @param userNumber
	 * @param userName
	 * @param loginName
	 * @param enName
	 * @param sex
	 * @param telephone
	 * @param birthday
	 * @param telephoneExt
	 * @param email
	 * @param mobilePhone
	 * @param msn
	 * @param fax
	 * @param msn2
	 * @param skype
	 * @param msn3
	 * @param qq
	 * @param companyId
	 * @param departmentId
	 * @param jobDescription
	 * @param sortNumber
	 * @param address
	 * @param zip
	 * @return
	 */
	@RequestMapping("fenghuang/getUsers.do")
	@ResponseBody
	public Map<String, Object> getUsers(HttpServletRequest request,
			HttpServletResponse response, Integer page, Integer rows,
			String userNumber, String userName, String loginName,
			String enName, String sex, String telephone, String birthday,
			String telephoneExt, String email, String mobilePhone, String msn,
			String fax, String msn2, String skype, String msn3, String qq,
			String companyId, String departmentId, String jobDescription,
			String sortNumber, String address, String zip) {

		Users user = new Users();
		user.setUserNumber(userNumber);
		user.setUserName(userName);
		user.setLoginName(loginName);
		user.setEnName(enName);
		user.setSex(sex);
		user.setTelephone(telephone);
		if (birthday != null && !"".equals(birthday)) {
			user.setBirthday(FengHuangDateUtil.getDateStringTODate(birthday));
		}
		user.setTelephoneExt(telephoneExt);
		user.setEmail(email);
		user.setMobilePhone(mobilePhone);
		user.setMsn(msn);
		user.setFax(fax);
		user.setMsn2(msn2);
		user.setSkype(skype);
		user.setMsn3(msn3);
		user.setQq(qq);
		if (companyId != null && !"".equals(companyId)) {
			user.setCompanyId(Long.valueOf(companyId));
		}

		if (departmentId != null && !"".equals(departmentId)) {
			user.setDepartmentId(Long.valueOf(departmentId));
		}

		user.setJobDescription(jobDescription);
		if (sortNumber != null && !"".equals(sortNumber)) {
			user.setSortNumber(Long.valueOf(sortNumber));
		}
		user.setAddress(address);
		user.setZip(zip);

		try {
			Pagination<Users> userPagins = iUsersService.getPaginationUsers(
					page, rows, user);
			Map<String, Object> returnValue = new HashMap<String, Object>();
			if (userPagins != null) {
				List<Map<String, Object>> userRows = userPagins.getResultList();

				returnValue.put("total", userPagins.getTotalRows());
				returnValue.put("rows", userRows);
			} else {
				returnValue.put("total", 0);
				returnValue.put("rows", new ArrayList<Map<String, Object>>());
			}

			return returnValue;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;

	}

	/**
	 * 修改用户密码
	 * 
	 * @param request
	 * @param response
	 * @param id
	 * @param oldpassword
	 * @param newPassword
	 * @return
	 */
	@RequestMapping("fenghuang/modiryPassowrd.do")
	@ResponseBody
	public Map<String, Object> modifyUserPassword(HttpServletRequest request,
			HttpServletResponse response, Long id, String oldpassword,
			String newPassword) {
		boolean isSuccess = false;
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			if (oldpassword != null && !"".equals(oldpassword)) {
				String md5password = FengHuangMd5Util.getMD5(oldpassword);
				String dbpassword = iUsersService.getUsersPasswordById(id);
				if (md5password.equals(dbpassword)) {
					iUsersService.updateUserPassword(id, newPassword);
					isSuccess = true;
				}
			}
		} catch (Exception e) {
			isSuccess = false;
		}
		result.put("success", isSuccess);
		return result;
	}

	@RequestMapping("fenghuang/isExistLoginName.do")
	@ResponseBody
	public Map<String, Object> isExistLoginName(HttpServletRequest request,
			HttpServletResponse response, String loginName) {
		boolean isExist = false;
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			isExist = iUsersService.isExistUserLoginName(loginName);
		} catch (Exception e) {
			e.printStackTrace();
		}
		result.put("success", isExist);
		return result;
	}

	public Map<String, Object> deleteUsers(HttpServletRequest request,
			HttpServletResponse response, String deleteRows) {
		Map<String, Object> result = new HashMap<String, Object>();
		JSONArray jsonArray = JSONArray.fromObject(deleteRows);
		List<Users>  users = JSONArray.toList(jsonArray, Users.class);
		boolean isSuccess = false;
		try {
			iUsersService.deleteUsersByList(users);
			isSuccess = true;
		} catch (Exception e) {
			isSuccess = false;
			e.printStackTrace();
		}
		result.put("success", isSuccess);
		return result;
	}
	@RequestMapping("fenghuang/updateUsers.do")
	@ResponseBody
	public Map<String,Object>  updateUsers(HttpServletRequest request,HttpServletResponse response,String updateRows){
		Map<String, Object> result = new HashMap<String, Object>();
		JSONArray jsonArray = JSONArray.fromObject(updateRows);
		List<Users> users = JSONArray.toList(jsonArray,Users.class);
		boolean isSuccess = false;
		
		try {
			 iUsersService.updateUsersByList(users);
			isSuccess = true;
		} catch (Exception e) {
			isSuccess= false;
			e.printStackTrace();
		}
		result.put("success", isSuccess);
		return result;
	}
	

}
