package com.vrzww.mapper;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.vrzww.po.UserCustom;
import com.vrzww.service.UserService;

public class UserServiceImplTest 
{
	private ApplicationContext applicationContext;
	private UserService userService;

	@Before
	public void setUp() throws Exception 
	{
		applicationContext = new ClassPathXmlApplicationContext("spring/applicationContext-*.xml");
		userService = applicationContext.getBean("userService", UserService.class);
	}

	@Test
	public void test() throws Exception 
	{
		List<UserCustom> userList = userService.getUserListExist(1);
		int length = userList.size();
		System.out.println("1");
		for(int i=0;i<length;i++)
		{
			System.out.println("userList="+userList.get(i).getUsername());
		}
		System.out.println("2");
		//fail("Not yet implemented");
	}

}
