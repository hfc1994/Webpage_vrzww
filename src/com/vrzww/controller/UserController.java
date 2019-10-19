package com.vrzww.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.vrzww.po.UserCustom;
import com.vrzww.po.UserQueryVo;
import com.vrzww.service.UserService;

/**
 * <p>description 用户的controller
 * @author user-hfc
 * @equestMapping "/userList" 获取全部用户
 * 
 */

@Controller

@RequestMapping("/user")
public class UserController 
{
	@Autowired
	private UserService userService;
	
	@RequestMapping("/userList")
	public ModelAndView userList(HttpServletRequest request) throws Exception
	{
		List<UserCustom> userList = userService.findUserList();
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("userList", userList);
		modelAndView.setViewName("user/userList");
		
		return modelAndView;
	}
	
	@RequestMapping("/userLogin")
	@ResponseBody
	public List userLogin(String account, String password, HttpServletRequest request) throws Exception
	{
		//查询数据库后的返回值
		Map<String,Object> resultMap = new HashMap<String,Object>();
		//System.out.println("////////username="+username+"&password="+password);
		resultMap = userService.userLogin(account,password);
		String result = (String) resultMap.get("result");
		UserCustom user = (UserCustom) resultMap.get("user");
		//给ajax的返回值
		List ajaxResult = new ArrayList();
		
		//ModelAndView modelAndView = new ModelAndView();
		
		if(result.equals("nouser"))
		{
			ajaxResult.add(result);
			return ajaxResult;
		}
		
		//数据库存在这个用户
		HttpSession session = request.getSession();
		session.setAttribute("uid", user.getUid());
		session.setAttribute("username", user.getUsername());
		session.setAttribute("headportrait", user.getHeadportrait());
		session.setAttribute("identity", user.getIdentity());
		session.setMaxInactiveInterval(60*10);//设置存活时间为60秒
		
		if(result.equals("admin"))
		{
			ajaxResult.add(request.getContextPath()+"/administration.jsp");
			return ajaxResult;
		}
		else if(result.equals("notadmin"))
		{
			ajaxResult.add(request.getContextPath()+"/index.jsp");
			return ajaxResult;
		}
		else
		{
			ajaxResult.add("nouser");
			return ajaxResult;
		}
		
		
//		Map<String,Object> resultMap = new HashMap<String,Object>();
//		//System.out.println("////////username="+username+"&password="+password);
//		resultMap = userService.userLogin(account,password);
//		String result = (String) resultMap.get("result");
//		UserCustom user = (UserCustom) resultMap.get("user");
//		
//		ModelAndView modelAndView = new ModelAndView();
//		
//		if(result.equals("nouser"))
//		{
//			modelAndView.setViewName("redirect:/login.jsp");
//			return modelAndView;
//		}
//		HttpSession session = request.getSession();
//		session.setAttribute("uid", user.getUid());
//		session.setAttribute("username", user.getUsername());
//		session.setAttribute("headportrait", user.getHeadportrait());
//		session.setAttribute("identity", user.getIdentity());
//		session.setMaxInactiveInterval(60*10);//设置存活时间为60秒
//		if(result.equals("admin"))
//		{
//			modelAndView.setViewName("redirect:/administration.jsp");
//			return modelAndView;
//		}
//		else if(result.equals("notadmin"))
//		{
//			modelAndView.setViewName("redirect:/index.jsp");
//			return modelAndView;
//		}
//		else
//		{
//			modelAndView.setViewName("redirect:/login.jsp");
//			return modelAndView;
//		}
	}
	
	@RequestMapping("/userLogout")
	public ModelAndView userLogout(HttpServletRequest request) throws Exception
	{
		//String uri = request.getRequestURI();
		HttpSession session = request.getSession();
		session.invalidate();
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/index.jsp");
		return modelAndView;
	}
	
	@RequestMapping("/userRegister")
	public ModelAndView userRegister(HttpServletRequest request,String email,String username,
										String password,String question,String answer) throws Exception
	{
		//System.out.println("controller前"+question+answer);
//		String digest = new SHA().getDigestOfString(password.getBytes());
//		System.out.println("sha加密="+digest);
		//question = new String(request.getParameter("question").getBytes("iso8859-1"),"utf-8");
		//answer = new String(request.getParameter("answer").getBytes("iso8859-1"),"utf-8");
		//System.out.println("controller后"+question+answer);
		//默认头像
		String headportrait = request.getContextPath() + "/img/user_128px.png"; 
		int result = userService.userRegister(email,username,password,question,answer,headportrait);
		
		ModelAndView modelAndView = new ModelAndView();
		//注册成功了就回到登陆界面登陆
		if(result == 1)
			modelAndView.setViewName("redirect:/login.jsp");
		else
			modelAndView.setViewName("redirect:/register.jsp");
		
		return modelAndView;
	}
	
	//检查登录名是否已经被注册
	@RequestMapping("/checkLoginName")
	@ResponseBody
	public int checkLoginName(HttpServletRequest request, String loginname) throws Exception
	{
		return userService.checkLoginName(loginname);
	}
	
	@RequestMapping("setSelfInfo")
	@ResponseBody
	public String setSelfInfo(HttpServletRequest request, String uid, String username, String headportrait, 
							String oldpassword, String newpassword) throws Exception
	{
		return userService.setSelfInfo(uid,username,headportrait,oldpassword,newpassword);
	}
}
