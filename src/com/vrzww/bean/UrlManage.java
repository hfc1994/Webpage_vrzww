package com.vrzww.bean;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;

import com.vrzww.po.ArticleCustom;
import com.vrzww.po.CommentCustom;
import com.vrzww.po.UserCustom;
import com.vrzww.service.ArticleService;
import com.vrzww.service.CommentService;
import com.vrzww.service.UserService;

public class UrlManage 
{
	
	public List urlManageBean(ArticleService as,UserService us,CommentService cs,
			int pages,String url, HttpServletRequest request) throws Exception
	{
		String url1 = "/administrator/usersExist"; 
		String url2 = "/administrator/usersDeleted"; 
		String url3 = "/administrator/articlesExist"; 
		String url4 = "/administrator/articlesDeleted"; 
		String url5 = "/administrator/commentsExist"; 
		String url6 = "/administrator/commentsDeleted";
		
		if(url.contains(url1))
		{
			List<UserCustom> userList = us.getUserListExist(pages);
			List bundle = new ArrayList();
			int flag = 1;//表明是userList
			bundle.add(flag);
			bundle.add(userList);
			return bundle;
		}
		else if(url.contains(url2))
		{
			List<UserCustom> userList = us.getUserListDeleted(pages);
			List bundle = new ArrayList();
			int flag = 1;
			bundle.add(flag);
			bundle.add(userList);
			return bundle;
		}
		else if(url.contains(url3))
		{
			List<ArticleCustom> articleList = as.getArticleListExist(pages);
			List bundle = new ArrayList();
			int flag = 2;//表明是articleList
			bundle.add(flag);
			//在网页上显示简略信息，50个字
			articleList = contentSubstring(articleList);
			bundle.add(articleList);
			return bundle;
		}
		else if(url.contains(url4))
		{
			List<ArticleCustom> articleList = as.getArticleListDeleted(pages);
			List bundle = new ArrayList();
			int flag = 2;//表明是articleList
			bundle.add(flag);
			//在网页上显示简略信息，50个字
			articleList = contentSubstring(articleList);
			bundle.add(articleList);
			return bundle;
		}
		else if(url.contains(url5))
		{
			List<CommentCustom> commentList = cs.getCommentExist(pages);
			List bundle = new ArrayList();
			int flag = 3;//表明是commentList
			bundle.add(flag);
			bundle.add(commentList);
			return bundle;
		}
		else if(url.contains(url6))
		{
			List<CommentCustom> commentList = cs.getCommentDeleted(pages);
			List bundle = new ArrayList();
			int flag = 3;//表明是commentList
			bundle.add(flag);
			bundle.add(commentList);
			return bundle;
		}
		else
			return null;
	}
	
	public List<ArticleCustom> contentSubstring(List<ArticleCustom> a)
	{
		//在网页上显示简略信息，50个字
		for(int i=0; i<a.size(); i++)
		{
			a.get(i).setContent(a.get(i).getContent().substring(0, 50) + "……");
		}
		return a;	
	}

}
