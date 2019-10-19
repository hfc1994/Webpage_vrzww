package com.vrzww.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.vrzww.bean.SHA;
import com.vrzww.mapper.UserMapper;
import com.vrzww.mapper.UserMapperCustom;
import com.vrzww.po.UserCustom;
import com.vrzww.po.UserQueryVo;
import com.vrzww.service.CommentService;
import com.vrzww.service.UserService;

/**
 * <p>descrption 用户的业务操作实现
 * @author user-hfc
 * @method findUserList 获取完整用户列表
 * @method getUserListExist 获取未被删除的用户的完整列表
 * @method getUserListDeleted 获取被删除的用户的完整列表
 * @method deleteById 根据id删除用户，实际只是把deleteState字段改为0
 * @method recoverById 根据id删除用户，实际只是把deleteState字段改为1
 * 
 */

public class UserServiceImpl implements UserService 
{
	@Autowired
	private UserMapperCustom userMapperCustom;
	
	@Autowired
	private UserMapper useMapper;
	
	@Autowired
	private CommentService commentService;
	
	@Override
	public List<UserCustom> findUserList() throws Exception
	{
		return userMapperCustom.findUserList();
	}

	@Override
	public List<UserCustom> getUserListExist(int pages) throws Exception 
	{
		int offset = 10;
		int start = 0 + offset * (pages - 1);
		return userMapperCustom.getUserListExist(start, offset);
	}

	@Override
	public List<UserCustom> getUserListDeleted(int pages) throws Exception 
	{
		int offset = 10;
		int start = 0 + offset * (pages - 1);
		return userMapperCustom.getUserListDeleted(start, offset);
	}

	@Transactional
	@Override
	public void deleteById(int id) throws Exception 
	{
		//删除用户的同时，要删除用户留下的所有评论
		userMapperCustom.deleteById(id);
		commentService.deleteByUId(id);
	}

	@Override
	public void recoverById(int id) throws Exception 
	{
		userMapperCustom.recoverById(id);
	}

	@Override
	public Map<String,Object> userLogin(String loginname, String password) throws Exception 
	{
		UserCustom user = userMapperCustom.getUserByLoginName(loginname);
		Map<String,Object> resultMap = new HashMap<String,Object>();
		String digest = new SHA().getDigestOfString(password.getBytes());
//		System.out.println("password="+password);
//		System.out.println("digest="+digest);
//		System.out.println("db_password="+user.getPassword());
		if(user != null && user.getPassword().equals(digest))
		{
			if(Integer.parseInt(user.getIdentity()) == 0)
			{
				resultMap.put("result", "admin");
				resultMap.put("user", user);
				return resultMap;
			}
			else
			{
				resultMap.put("result", "notadmin");
				resultMap.put("user", user);
				return resultMap;
			}
		}
		else
		{
			resultMap.put("result", "nouser");
			return resultMap;
		}
	}

	@Override
	public int userRegister(String loginname, String username, String password,
			String question, String answer, String headportrait) throws Exception 
	{
		//密码经过sha1加密
		String digest = new SHA().getDigestOfString(password.getBytes());
		//System.out.println("serviceImpl"+question+answer);
		return userMapperCustom.insertUser(username,loginname,digest,question,answer,headportrait);
	}

	@Override
	public int checkLoginName(String loginname) throws Exception 
	{
		return userMapperCustom.checkByLoginName(loginname);
	}

	@Override
	public String setSelfInfo(String uid,String username, String headportrait,
			String oldpassword, String newpassword) throws Exception 
	{
		
		UserCustom user = userMapperCustom.getUserByUId(uid);
		String insertpassword = null;
		
		if(username.equals(""))
			username = null;
		
		String suffix = haveImageSuffix(headportrait);
		
		if(suffix == null)
			headportrait = null;
		else
		{
			String[] strPicPath = headportrait.split("\"");
			for(String s : strPicPath)
			{
				//System.out.println("分割片段其中之一="+s);
				
				if(s.endsWith(".jpg") || s.endsWith(".png") || s.endsWith(".gif") || s.endsWith(".jpeg"))
				{
					headportrait = s;
					//System.out.println("提取到图片路径名称="+s);
					break;
				}
			}
		}
		System.out.println("333newusername"+username+"//head"+headportrait+"//old"+oldpassword+"//new"+newpassword);
		if(oldpassword.equals("")==false && newpassword.equals("")==false)
		{
			System.out.println("ddddddddddddd");
			String digest = new SHA().getDigestOfString(oldpassword.getBytes());
			System.out.println(digest);
			System.out.println(user.getPassword());
			if(user.getPassword().equals(digest))
			{
				String digest2 = new SHA().getDigestOfString(newpassword.getBytes());
				insertpassword = digest2; 
				System.out.println(insertpassword);
			}
			else
			{
				return "diff_password";
			}
		}
		System.out.println("444newusername"+username+"//head"+headportrait+"//old"+oldpassword+"//new"+newpassword);
		int resultFlag = userMapperCustom.updateUserInfo(uid,username,insertpassword,headportrait);
		System.out.println("555resultFlag"+resultFlag);
		if(resultFlag == 1)
			return "true";
		else
			return "false";
		
	}
	
	//根据是否还有相对应的图片后缀来判断是否含有图片
	public String haveImageSuffix(String mainpic)
	{
		if(mainpic.indexOf(".jpg") > 0)
			return ".jpg";
		if(mainpic.indexOf(".png") > 0)
			return ".png";
		if(mainpic.indexOf(".gif") > 0)
			return ".gif";
		if(mainpic.indexOf(".jpeg") > 0)
			return ".jpeg";
		return null;
	}
}
