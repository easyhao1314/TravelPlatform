/**
 * 
 */
package com.fenghuang.web.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fenghuang.entiey.Users;
import com.fenghuang.service.IUsersService;
import com.fenghuang.util.FengHuangMd5Util;

/**
 * @author 鲍国浩
 * 
 *         版本 ： 1.0
 * 
 *         日期 ：2013-8-4
 * 
 *         描述 ：
 * 
 * 
 */
@Controller
public class LoginController {

	@Autowired
	private IUsersService iUsersService;

	@RequestMapping("fenghuang/login.do")
	public String login(HttpServletRequest request,
			HttpServletResponse response, String loginName, String password,ModelMap map) {

		try {
			 boolean isExist = iUsersService.isExistUserLoginName(loginName);
			if(isExist){
				Users users = iUsersService.getUsersByLoginName(loginName);
				if(users != null&&FengHuangMd5Util.getMD5(password).equals(users.getPassword()))
				{
					//验证成功
					return "layout";
				}else{
					map.put("loginError", "密码不正确！");
					map.put("loginName", loginName);
				  return "index";
				}
			}else{
				map.put("loginError", "用户不存在！");
				return "index";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "index";
	}

}