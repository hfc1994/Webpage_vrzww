package com.vrzww.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.vrzww.bean.Upload;
import com.vrzww.bean.UrlManage;
import com.vrzww.po.ArticleCustom;
import com.vrzww.po.CommentCustom;
import com.vrzww.po.UserCustom;
import com.vrzww.service.ArticleService;
import com.vrzww.service.CommentService;
import com.vrzww.service.UserService;



/**
 * <p>description 管理员的controller
 * @author user-hfc
 * @RequestMapping "/articleList" 获取完整的文章列表
 * @RequestMapping "/articleList" 获取完整的文章列表
 * @RequestMapping "/deleteRecover" 管理员删除恢复功能
 * 
 */

@Controller

@RequestMapping("/administrator")
public class AdministratorController 
{
	@Autowired
	private ArticleService articleService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private CommentService commentService;
	
	@Autowired
	private Upload upload;
	
	@Autowired
	private UrlManage urlManage;
	
	@RequestMapping("/editContent")
	public ModelAndView editContent(HttpServletRequest request) throws Exception
	{
		
		ModelAndView modelAndView = new ModelAndView();
		
		List infoList = new ArrayList();
		String infoName = "内容推送";
		String infoUrl = request.getContextPath()+"/administrator/editContent";
		infoList.add(infoName);
		infoList.add(infoUrl);
		
		modelAndView.addObject("infoList", infoList);
		
		modelAndView.setViewName("editContent");
		
		return modelAndView;
	}
	
	
	@RequestMapping("/articleImgUpload")
	@ResponseBody
	public void articleImgUpload(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		upload.picUpload(request, response);
		
	}
	
	@RequestMapping("/usersExist")
	public ModelAndView usersExist(int pages,HttpServletRequest request) throws Exception
	{
		//pages=1
		List<UserCustom> userList = userService.getUserListExist(pages);
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("userList", userList);
		
		List infoList = new ArrayList();
		String infoName = "用户列表";
		String infoUrl = request.getContextPath()+"/administrator/usersExist";
		infoList.add(infoName);
		infoList.add(infoUrl);
		
		modelAndView.addObject("infoList", infoList);
		
		modelAndView.setViewName("adminManage");
		
		return modelAndView;
	}
	
	@RequestMapping("/usersDeleted")
	public ModelAndView usersDeleted(int pages,HttpServletRequest request) throws Exception
	{
		//pages=1
		List<UserCustom> userList = userService.getUserListDeleted(pages);
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("userList", userList);
		
		List infoList = new ArrayList();
		String infoName = "被删用户列表";
		String infoUrl = request.getContextPath()+"/administrator/usersDeleted";
		infoList.add(infoName);
		infoList.add(infoUrl);
		
		modelAndView.addObject("infoList", infoList);
		
		modelAndView.setViewName("adminManage");
		
		return modelAndView;
	}
	
	@RequestMapping("/articlesExist")
	public ModelAndView articlesExist(int pages,HttpServletRequest request) throws Exception
	{
		//pages=1
		List<ArticleCustom> articleList = articleService.getArticleListExist(pages);
		
		ModelAndView modelAndView = new ModelAndView();
		
		//在网页上显示简略信息，50个字
		articleList = contentSubstring(articleList);
		
		modelAndView.addObject("articleList", articleList);
		
		List infoList = new ArrayList();
		String infoName = "文章列表";
		String infoUrl = request.getContextPath()+"/administrator/articlesExist";
		infoList.add(infoName);
		infoList.add(infoUrl);
		
		modelAndView.addObject("infoList", infoList);
		
		modelAndView.setViewName("adminManage");
		
		return modelAndView;
	}
	
	@RequestMapping("/articlesDeleted")
	public ModelAndView articlesDeleted(int pages,HttpServletRequest request) throws Exception
	{
		//pages=1
		List<ArticleCustom> articleList = articleService.getArticleListDeleted(pages);
		
		ModelAndView modelAndView = new ModelAndView();
		
		//在网页上显示简略信息，50个字
		articleList = contentSubstring(articleList);
		
		modelAndView.addObject("articleList", articleList);
		
		List infoList = new ArrayList();
		String infoName = "被删文章列表";
		String infoUrl = request.getContextPath()+"/administrator/articlesDeleted";
		infoList.add(infoName);
		infoList.add(infoUrl);
		
		modelAndView.addObject("infoList", infoList);
		
		modelAndView.setViewName("adminManage");
		
		return modelAndView;
	}
	
	@RequestMapping("/articleContent/{aid}")
	@ResponseBody
	public ModelAndView articleContent(@PathVariable("aid") Integer aid) throws Exception
	{
		ArticleCustom articleCustom = articleService.getArticleContentByIdNoLimit(aid);
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject(articleCustom);
		
		String position = "管理员 » 文章 » ";
		
		modelAndView.addObject("position", position);
		
		modelAndView.setViewName("articleContentAdmin");
		return modelAndView;
		
	}
	
	@RequestMapping("/commentsExist")
	public ModelAndView commentsExist(int pages,HttpServletRequest request) throws Exception
	{
		//pages=1
		List<CommentCustom> commentList = commentService.getCommentExist(pages);
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("commentList", commentList);
		
		List infoList = new ArrayList();
		String infoName = "评论列表";
		String infoUrl = request.getContextPath()+"/administrator/commentsExist";
		infoList.add(infoName);
		infoList.add(infoUrl);
		
		modelAndView.addObject("infoList", infoList);
		
		modelAndView.setViewName("adminManage");
		
		return modelAndView;
	}
	
	@RequestMapping("/commentsDeleted")
	public ModelAndView commentsDeleted(int pages,HttpServletRequest request) throws Exception
	{
		//pages=1
		List<CommentCustom> commentList = commentService.getCommentDeleted(pages);
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("commentList", commentList);
		
		List infoList = new ArrayList();
		String infoName = "被删评论列表";
		String infoUrl = request.getContextPath()+"/administrator/commentsDeleted";
		infoList.add(infoName);
		infoList.add(infoUrl);
		
		modelAndView.addObject("infoList", infoList);
		
		modelAndView.setViewName("adminManage");
		
		return modelAndView;
	}
	
	@Transactional
	@RequestMapping("/deleteRecover")
	@ResponseBody
	public boolean deleteRecover(String state,int id) throws Exception
	{
//		if(state=="usersExist usersDeleted articlesExist "
//				+ "articlesDeleted commentsExist commentsDeleted")
		//state 此时的页面链接
		if(state.equals("usersExist"))
			userService.deleteById(id);
		else if(state.equals("usersDeleted"))
			userService.recoverById(id);//不给批量恢复评论，否则本应该已经被指定删除的评论也会同时恢复		
		else if(state.equals("articlesExist"))
			articleService.deleteById(id);
		else if(state.equals("articlesDeleted"))
			articleService.recoverById(id);	//不给批量恢复评论，否则本应该已经被指定删除的评论也会同时恢复
		else if(state.equals("commentsExist"))
			commentService.deleteById(id);
		else if(state.equals("commentsDeleted"))
			commentService.recoverById(id);
		else 
			return false;
		return true;
		
	}
	
	public List<ArticleCustom> contentSubstring(List<ArticleCustom> a)
	{
		//在网页上显示简略信息，50个字
		for(int i=0; i<a.size(); i++)
		{
			String ss =a.get(i).getContent();//replaceAll("<(/?\\S+)\\s*?[^<]*?(/?)>","<$1$2>");
			ss = ss.replaceAll("<img", "");
			ss = ss.replaceAll("<p>", "");
			ss = ss.replaceAll("<p", "");
			ss = ss.replaceAll("</p>", "");
			ss = ss.replaceAll(">", "");
			if(ss.length() > 50)
				ss = ss.substring(0,50) + "……";
			ss = ss.trim();
//			System.out.println("////////////////////");
//			System.out.println(ss);
			a.get(i).setContent(ss);
			//a.get(i).setContent(a.get(i).getContent().substring(0, 50) + "……");
			
		}
		return a;	
	}
	
	@RequestMapping("/adminManage")
	@ResponseBody
	public List adminManage(int pages, String url, HttpServletRequest request) throws Exception
	{
		return urlManage.urlManageBean(articleService,userService,commentService,pages, url, request);
	}
	
	@RequestMapping("/setArticle")
	@ResponseBody
	public int setArticle(String title, String source, String author, String mainpic,
								String content, String category, HttpServletRequest request) throws Exception
	{
		return articleService.setArticle(source,author,title,content,mainpic,category,request);
	}
}
