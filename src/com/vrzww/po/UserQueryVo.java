package com.vrzww.po;

import java.util.List;

/**
 * <p>description 用户包装对象
 * @author user-hfc
 *
 */

public class UserQueryVo 
{
	private User user;
	
	private UserCustom userCustom;
	
	private List<UserCustom> userList;

	public User getUser() 
	{
		return user;
	}

	public void setUser(User user) 
	{
		this.user = user;
	}

	public UserCustom getUserCustom() 
	{
		return userCustom;
	}

	public void setUserCustom(UserCustom userCustom) 
	{
		this.userCustom = userCustom;
	}

	public List<UserCustom> getUserList() 
	{
		return userList;
	}

	public void setUserList(List<UserCustom> userList) 
	{
		this.userList = userList;
	}
	
	
}

