/**
 * 
 */
package com.fenghuang.web.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author 鲍国浩
 * 
 * 版本 ： 1.0
 * 
 * 日期 ：2013-10-29
 *
 * 描述 ：
 *
 *
 */
@Controller
public class CkeditorController {
	
	
	@RequestMapping("fenghuang/editor.do")
	@ResponseBody
	public String submitEditor(HttpServletRequest request,HttpServletResponse response){
		String test = request.getParameter("editor1");
		System.out.println(test);
		
		return test;
	}
	
	
	

}
