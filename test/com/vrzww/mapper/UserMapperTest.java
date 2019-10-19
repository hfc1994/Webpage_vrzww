package com.vrzww.mapper;

import static org.junit.Assert.*;

import java.util.Date;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.vrzww.po.Article;
import com.vrzww.po.User;

public class UserMapperTest 
{
	private ApplicationContext applicationContext;
	
	private UserMapper userMapper;
	private ArticleMapper articleMapper;
	
	@Before
	public void setUp() throws Exception 
	{
		applicationContext = new ClassPathXmlApplicationContext("classpath:config/spring/applicationContext-*.xml");
		userMapper = (UserMapper) applicationContext.getBean("userMapper");
		articleMapper = (ArticleMapper) applicationContext.getBean("articleMapper");
	}

	@Test
	public void testDeleteByPrimaryKey() 
	{
		userMapper.deleteByPrimaryKey(10008);
	}

	@Test
	public void testInsert() {
		User u = new User();
		u.setUsername("asdas");
		u.setLoginname("1233@qq.com");
		u.setPassword("255565");
		u.setQuestion("asdasda");
		u.setAnswer("aaa");
		u.setIdentity("1");
		
		Date time= new java.sql.Date(new java.util.Date().getTime());
		u.setRegistertime(time);
		
		userMapper.insert(u);
		
//		Article a = new Article();
//		
//		a.setSource("www.sina.com");
//		a.setAuthor("dasd");
//		a.setPublishtime(time);
//		a.setTitle("aaaa");
//		a.setContent("ddd");
//		a.setLikes(5);
//		a.setDeletestate("1");
//		
//		articleMapper.insert(a);
	}

	@Test
	public void testSelectByPrimaryKey() 
	{
		User u = userMapper.selectByPrimaryKey(10005);
		System.out.println(u.getUid()+" "+u.getUsername()+" "+u.getLoginname()+" "+u.getPassword());
	}

	@Test
	public void testUpdateByPrimaryKeySelective() 
	{
		User u = new User();
		u.setUid(10008);
		u.setPassword("998899");
		userMapper.updateByPrimaryKeySelective(u);
	}

}
