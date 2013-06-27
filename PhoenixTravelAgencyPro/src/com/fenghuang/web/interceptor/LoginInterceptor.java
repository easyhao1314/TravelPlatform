package com.fenghuang.web.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
/**
 * 
 * @author 鲍国浩
 *
 *  日期    @2013-6-27
 *  
 *  描述：登录拦截器
 *
 *
 *
 */
public class LoginInterceptor extends HandlerInterceptorAdapter   {

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		return super.preHandle(request, response, handler);
	}

}
