/**
 * 
 */
package com.fenghuang.web.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fenghuang.entiey.TestUser;
import com.fenghuang.service.ITestUserService;
import com.fenghuang.util.Pagination;

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

	@Autowired
	// 自动匹配ITestUserService类型的实现，并将该实现注入到该类中。
	public ITestUserService iTestUserService;

	/**
	 * 添加TestUser的Action动作。
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/testUser.do")
	@ResponseBody
	public String testUserAction(HttpServletRequest request,
			HttpServletResponse response, String userName, String password,ModelMap map) {
		TestUser test = new TestUser();
		test.setUsername(userName);
		test.setPassword(password);

		try {
			iTestUserService.addTestUser(test);
		} catch (Exception e) {
			e.printStackTrace();
		}
		map.put("ddd", "ddd");
		return "0000";
	}
	@RequestMapping("/getUsers.do")
	@ResponseBody
	public Map<String,Object> getUsersAction(HttpServletRequest request,
			HttpServletResponse response, Integer page,
			Integer rows,String test) {

		try {
			Pagination<TestUser> pagination = iTestUserService
					.getByQueryConditionPagination(page, rows);
			List<Map<String, Object>> testUsers = pagination.getResultList();
			Map<String,Object> returnValue  = new HashMap<String, Object>();
			returnValue.put("total",  pagination.getTotalRows());
			returnValue.put("rows", testUsers);
			
			return returnValue;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null;

	}
	
	
    @RequestMapping("/test/test.do")
    @ResponseBody
	public String Test()
	{
		return "test";
	}
	
	@RequestMapping("/test/indextReturn.do")
    public String TestIndexReturn(){
    	return "indexTestReturn";
    }
    
	

}
