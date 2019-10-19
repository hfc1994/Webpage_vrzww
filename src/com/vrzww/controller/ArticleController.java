package com.vrzww.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.vrzww.po.ArticleCustom;
import com.vrzww.service.ArticleService;

/**
 * <p>description 文章的controller
 * @author user-hfc
 * @RequestMapping "/articleList" 获取完整的文章列表
 * @RequestMapping "/indexArticleList" 首页获取完整的文章列表
 * @RequestMapping "/indexArticleLimitList" 首页ajax获取限定数量的文章列表，返回json数据
 * @RequestMapping "/articleLimitListById" 其它信息页ajax获取限定数量的文章列表，返回json数据
 * @RequestMapping "/articleListById" 根据给定类别Id查找对应文章
 * @RequestMapping "/vrnews" 根据给定类别Id查找对应文章,vrnews的categoryId是1
 * @RequestMapping "/vrgame" 根据给定类别Id查找对应文章,vrgame的categoryId是2
 * @RequestMapping "/vrtech" 根据给定类别Id查找对应文章,vrtech的categoryId是3
 * @RequestMapping "/ararea" 根据给定类别Id查找对应文章,ararea的categoryId是4
 * @method "contentSubstring()" 用于缩短查询到的content内容，使显示在网页上的是简短内容
 * 
 */

@Controller

@RequestMapping("/article")
public class ArticleController 
{
	@Autowired
	private ArticleService articleService;
	
	@RequestMapping("/articleList")
	public ModelAndView articleList(HttpServletRequest request) throws Exception
	{
		List<ArticleCustom> articleList = articleService.getArticleList();
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("articleList", articleList);
		
		modelAndView.setViewName("index");
		
		return modelAndView;
	}
	
	@RequestMapping("/indexArticleList")
	@ResponseBody
	public List<ArticleCustom> indexArticleList(HttpServletRequest request) throws Exception
	{
		List<ArticleCustom> indexArticleList = articleService.getArticleLimitList(1);
		
		return indexArticleList;
	}
	
	//首页自动加载内容
	@RequestMapping("/indexArticleLimitList")
	@ResponseBody
	public List<ArticleCustom> indexArticleLimitList(int times,HttpServletRequest request) throws Exception
	{
		//int number = Integer.parseInt(times);
		//List<ArticleCustom> indexArticleLimitList = articleService.getArticleLimitList(number);
		List<ArticleCustom> indexArticleLimitList = articleService.getArticleLimitList(times);
		
		return indexArticleLimitList;
	}
	
	@RequestMapping("/articleLimitListById")
	@ResponseBody
	public List<ArticleCustom> articleLimitListById(int times,int categoryId,HttpServletRequest request) throws Exception
	{
		List<ArticleCustom> indexArticleLimitList = articleService.getArticleLimitListById(categoryId,times);
		return indexArticleLimitList;
	}
	
	@RequestMapping("/articleListById")
	public ModelAndView articleListById(HttpServletRequest request) throws Exception
	{
		List<ArticleCustom> articleList = articleService.getArticleListById(1);
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("articleList", articleList);
		modelAndView.setViewName("article/articleList");
		
		return modelAndView;
	}
	
	@RequestMapping("/vrnews")
	public ModelAndView vrnews(HttpServletRequest request) throws Exception
	{
		//vrnews的categoryId是1,且是第一次加载
		List<ArticleCustom> articleList = articleService.getArticleLimitListById(1,1);
		
		ModelAndView modelAndView = new ModelAndView();
		
		//在网页上显示简略信息，50个字
		articleList = contentSubstring(articleList);
		
		modelAndView.addObject("articleList", articleList);
		
		List categoryList = new ArrayList();
		String categoryName = "VR新闻";
		String categoryUrl = request.getContextPath()+"/article/vrnews";
		int categoryId = 1;
		categoryList.add(categoryName);
		categoryList.add(categoryUrl);
		categoryList.add(categoryId);
		
		modelAndView.addObject("categoryList", categoryList);
		modelAndView.setViewName("categoryArticle");
		
		return modelAndView;
	}
	

	@RequestMapping("/vrgame")
	public ModelAndView vrgame(HttpServletRequest request) throws Exception
	{
		//vrgame的categoryId是2,且是第一次加载
		List<ArticleCustom> articleList = articleService.getArticleLimitListById(2,1);
		
		ModelAndView modelAndView = new ModelAndView();
		
		//在网页上显示简略信息，50个字
		articleList = contentSubstring(articleList);
		
		modelAndView.addObject("articleList", articleList);
		
		List categoryList = new ArrayList();
		String categoryName = "VR游戏";
		String categoryUrl = request.getContextPath()+"/article/vrgame";
		int categoryId = 2;
		categoryList.add(categoryName);
		categoryList.add(categoryUrl);
		categoryList.add(categoryId);
		
		modelAndView.addObject("categoryList", categoryList);
		
		modelAndView.setViewName("categoryArticle");
		
		return modelAndView;
	}
	

	@RequestMapping("/vrtech")
	public ModelAndView vrtech(HttpServletRequest request) throws Exception
	{
		//vrtech的categoryId是3,且是第一次加载
		List<ArticleCustom> articleList = articleService.getArticleLimitListById(3,1);
		
		ModelAndView modelAndView = new ModelAndView();
		
		//在网页上显示简略信息，50个字
		articleList = contentSubstring(articleList);
		
		modelAndView.addObject("articleList", articleList);
		
		List categoryList = new ArrayList();
		String categoryName = "VR技术";
		String categoryUrl = request.getContextPath()+"/article/vrtech";
		int categoryId = 3;
		categoryList.add(categoryName);
		categoryList.add(categoryUrl);
		categoryList.add(categoryId);
		
		modelAndView.addObject("categoryList", categoryList);
		
		modelAndView.setViewName("categoryArticle");
		
		return modelAndView;
	}
	

	@RequestMapping("/ararea")
	public ModelAndView ararea(HttpServletRequest request) throws Exception
	{
		//ararea的categoryId是4,且是第一次加载
		List<ArticleCustom> articleList = articleService.getArticleLimitListById(4,1);
		
		ModelAndView modelAndView = new ModelAndView();
		
		//在网页上显示简略信息，50个字
		articleList = contentSubstring(articleList);
		
		modelAndView.addObject("articleList", articleList);
		
		List categoryList = new ArrayList();
		String categoryName = "AR专区";
		String categoryUrl = request.getContextPath()+"/article/ararea";
		int categoryId = 4;
		categoryList.add(categoryName);
		categoryList.add(categoryUrl);
		categoryList.add(categoryId);
		
		modelAndView.addObject("categoryList", categoryList);
		
		modelAndView.setViewName("categoryArticle");
		
		return modelAndView;
	}
	
	@RequestMapping("/articleContent/{aid}")
	@ResponseBody
	public ModelAndView articleContent(@PathVariable("aid") String aid) throws Exception
	{
		int id = Integer.parseInt(aid);
		ArticleCustom articleCustom = articleService.getArticleContentById(id);
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject(articleCustom);
		
		modelAndView.addObject("articleInfoId",id);
		
		modelAndView.setViewName("articleContent");
		return modelAndView;
		
	}
	
	public List<ArticleCustom> contentSubstring(List<ArticleCustom> a)
	{
		//在网页上显示简略信息，50个字
		for(int i=0; i<a.size(); i++)
		{
			String ss =a.get(i).getContent();//replaceAll("<(/?\\S+)\\s*?[^<]*?(/?)>","<$1$2>");
			ss = ss.replaceAll("<img", "");
			ss = ss.replaceAll("<p>", "");
			ss = ss.replaceAll("</p>", "");
			if(ss.length() > 50)
				ss = ss.substring(0,50) + "……";
			ss = ss.trim();
//			System.out.println("////////////////");
//			System.out.println(ss);
			a.get(i).setContent(ss);
			//a.get(i).setContent(a.get(i).getContent().substring(0, 50) + "……");
		}
		return a;	
	}
	
	@RequestMapping("setLikesByAId")
	@ResponseBody
	public int setLikesByAId(HttpServletRequest request, String aid, String likes) throws Exception
	{	
		return articleService.setLikesByAId(Integer.parseInt(aid),Integer.parseInt(likes));
	}
}
