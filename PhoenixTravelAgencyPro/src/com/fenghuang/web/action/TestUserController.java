/**
 * 
 */
package com.fenghuang.web.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fenghuang.entiey.TestUser;
import com.fenghuang.service.ITestUserService;

/**
 * @author 鲍国浩
 * 
 *         版本 ： 1.0
 * 
 *         日期 ：2013-5-26
 * 
 *         描述 ：测试TestUser 例子的控制层。
 * 
 * 
 */

@Controller
public class TestUserController {

	@Autowired  //自动匹配ITestUserService类型的实现，并将该实现注入到该类中。
	public ITestUserService iTestUserService;
    
	
	/**
	 * 添加TestUser的Action动作。
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/testUser.do")
	@ResponseBody
	public String testUserAction(HttpServletRequest request,
			HttpServletResponse response,String userName,String password){
           TestUser test = new TestUser();
           test.setUsername(userName);
           test.setPassword(password);
           
		try {
			  iTestUserService.addTestUser(test);
		} catch (Exception e) {
			e.printStackTrace();
		}
         
           return "0000";
	}

}
