/**
 * 
 */
package com.fenghuang.web.action;

import java.util.Enumeration;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fenghuang.entiey.Users;
import com.fenghuang.service.IUsersService;
import com.fenghuang.util.CommonUtil;
import com.fenghuang.util.FengHuangDateUtil;
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

	@RequestMapping("login.do")
	public String login(HttpServletRequest request,
			HttpServletResponse response, String loginName, String password,String code,ModelMap map) {

		try {
			String  yanzhengCode = (String)request.getSession().getAttribute("code");
			if(!"".equals(yanzhengCode)){
				if(!yanzhengCode.equals(code)){
					map.put("loginError", "验证码不正确！");
					return "index";
				}
			}
			 boolean isExist = iUsersService.isExistUserLoginName(loginName);
			if(isExist){
				Users users = iUsersService.getUsersByLoginName(loginName);
				if(users != null&&FengHuangMd5Util.getMD5(password).equals(users.getPassword()))
				{
					map.put("userId",users.getId());
					request.getSession().setAttribute("userId", users.getId());
					map.put("dateTime", FengHuangDateUtil.getTimeShow());
					map.put("userName", users.getLoginName());
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
	
	@RequestMapping("fenghuang/getUserMenus.do")
	@ResponseBody
	public List<Map<String, Object>> getFunctions(HttpServletRequest request,HttpServletResponse response,Long userId){
		
		try {
			List<Map<String, Object>> functions = iUsersService.getFunctionMenusByUserId(userId);
		    return functions;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
		
	}
	
	@RequestMapping("index.do")
	public String index(HttpServletRequest request,HttpServletResponse response,ModelMap map){
		String code = CommonUtil.getCode();
		map.put("code", code);
		request.getSession().setAttribute("code", code);
		return "index";
	}
	
	@RequestMapping("logout.do")
	public String logout(HttpServletRequest request,HttpServletResponse response){
		HttpSession session = request.getSession();
        Enumeration<String>  attrs =  session.getAttributeNames();
        while(attrs.hasMoreElements()){
        	String name = attrs.nextElement();
        	session.removeAttribute(name);
        	
        }
		return "redirect:index.do";
	}

}
