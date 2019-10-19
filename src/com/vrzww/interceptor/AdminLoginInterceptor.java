package com.vrzww.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class AdminLoginInterceptor implements HandlerInterceptor
{

	//进入handler方法之前执行
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object handler) throws Exception 
	{
		String uri = request.getRequestURI();
		if(uri.indexOf("login.jsp") >= 0)
		{
			return true;
		}
		
		HttpSession session = request.getSession();
		
		String identity = (String)session.getAttribute("identity");
		
		if(identity!=null && Integer.parseInt(identity) == 0)
		{
			return true;
		}
		
		//request.getRequestDispatcher("/login.jsp").forward(request, response);
		response.sendRedirect(request.getContextPath()+"/login.jsp");
		
		return false;
	}
	
	//进入handler方法之后，返回ModelAndView之前执行
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response,
			Object handler, ModelAndView modelAndView) throws Exception 
	{
		// TODO Auto-generated method stub
		
	}
	
	//完成执行Handler方法
	//应用场景，统一异常处理，统一日志处理
	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception e)
			throws Exception 
	{
		// TODO Auto-generated method stub
		
	}

	


}
