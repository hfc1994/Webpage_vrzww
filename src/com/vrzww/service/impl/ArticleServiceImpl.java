package com.vrzww.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.vrzww.mapper.ArticleMapper;
import com.vrzww.mapper.ArticleMapperCustom;
import com.vrzww.mapper.CategoryMapper;
import com.vrzww.mapper.CategoryMapperCustom;
import com.vrzww.po.Article;
import com.vrzww.po.ArticleCustom;
import com.vrzww.po.CategoryCustom;
import com.vrzww.po.CategoryQueryVo;
import com.vrzww.service.ArticleService;
import com.vrzww.service.CommentService;

/**
 * <p>descrption 文章的业务操作实现
 * @author user-hfc
 * @method getArticleList 获取全部文章
 * @method getArticleListById 根据categoryId先从category表中获取到
 * 								类别与文章对应关系的list，然后在根据
 * 								list中的文章Id获取全部文章
 * @method getArticleLimitList ajax获取一定数量的文章，分页
 * @method getArticleLimitListById ajax获取一定数量的文章，分页
 * @method getArticleContentById 根据id获取对应文章的内容
 * @method getArticleListExist 获取未被删除的文章的完整列表
 * @method getArticleListDeleted 获取被删除的文章的完整列表
 * @method getArticleContentByIdNoLimit 根据id获取对应文章的内容，无论文章是否被删
 * @method deleteById 根据id删除文章，即更改文章的deleteState为0
 * @method recoverById 根据id恢复文章，即更改文章的deleteState为1
 * 
 */

public class ArticleServiceImpl implements ArticleService
{
	@Autowired
	private ArticleMapperCustom articleMapperCustom;
	
	@Autowired
	private ArticleMapper articleMapper;
	
	@Autowired
	private CategoryMapperCustom categoryMapperCustom;

	@Autowired
	private CategoryMapper categoryMapper;
	
	@Autowired
	private CommentService commentService;
	
	@Override
	public List<ArticleCustom> getArticleList() throws Exception 
	{
		return articleMapperCustom.getArticleList();
	}

	@Override
	public List<ArticleCustom> getArticleListById(int categoryId) throws Exception 
	{
		List<CategoryCustom> cc = new ArrayList<CategoryCustom>();
		cc.addAll(categoryMapperCustom.getAId(categoryId));
		return articleMapperCustom.getArticleListById(cc);
	}

	@Override
	public List<ArticleCustom> getArticleLimitList(int times) throws Exception 
	{
		int offset = 5;
		int start = 0 + offset * (times - 1);
		return articleMapperCustom.getArticleLimitList(start,offset);
	}

	@Override
	public List<ArticleCustom> getArticleLimitListById(int categoryId, int times) throws Exception 
	{
		int offset = 5;
		int start = 0 + offset * (times - 1);
		List<CategoryCustom> categoryCustom = new ArrayList<CategoryCustom>();
		//此处把限制加给category，这样就只取出限定数量的aId，或许传输数据量会小一点
		//然而因为存在被删除的帖子article.deleteState=0，导致这个方法会使显示的帖子少于5条
		//暂时不知道怎么解决，先改回去以后再看看
		//categoryCustom.addAll(categoryMapperCustom.getLimitAId(categoryId, start, offset));
		categoryCustom.addAll(categoryMapperCustom.getAId(categoryId));
		//return articleMapperCustom.getArticleListById(categoryCustom);
		return articleMapperCustom.getArticleLimitListById(categoryCustom, start, offset);
	}

	@Override
	public ArticleCustom getArticleContentById(int aid) throws Exception 
	{
		return articleMapperCustom.getArticleContentById(aid);
	}

	@Override
	public List<ArticleCustom> getArticleListExist(int pages) throws Exception 
	{
		int offset = 10;
		int start = 0 + offset * (pages - 1);
		return articleMapperCustom.getArticleListExist(start,offset);
	}

	@Override
	public List<ArticleCustom> getArticleListDeleted(int pages) throws Exception 
	{
		int offset = 10;
		int start = 0 + offset * (pages - 1);
		return articleMapperCustom.getArticleListDeleted(start,offset);
	}

	@Override
	public ArticleCustom getArticleContentByIdNoLimit(Integer aid)
			throws Exception 
	{
		return articleMapperCustom.getArticleContentByIdNoLimit(aid);
	}

	@Transactional
	@Override
	public void deleteById(int id) throws Exception 
	{
		//删除文章的同时，需要把文章下面的评论也一起删除
		articleMapperCustom.deleteById(id);
		commentService.deleteByAId(id);
	}

	@Override
	public void recoverById(int id) throws Exception 
	{
		articleMapperCustom.recoverById(id);
	}

	@Transactional
	@Override
	public int setArticle(String source, String author, String title,
			String content, String mainpic, String category, HttpServletRequest request) throws Exception 
	{
		if(source.equals("") || source.equals(" "))
			return 0;
		if(author.equals("") || author.equals(" "))
			return 0;
		if(title.equals("") || title.equals(" "))
			return 0;
		if(content.equals("") || content.equals(" "))
			return 0;
		
		//把category数据处理成可读
		String[] newCategory = category.split(",");
		
		//检查字符串中是否含有图片格式后缀，若没有，则给予默认设置，若有，则提取出来
		String suffix = haveImageSuffix(mainpic);
		
		if(suffix.equals("null"))
			mainpic = request.getContextPath() + "/img/show.jpg";
		else
		{
			//System.out.println("初始图片字符串="+mainpic);
			String[] strPicPath = mainpic.split("\"");
			for(String s : strPicPath)
			{
				//System.out.println("分割片段其中之一="+s);
				
				if(s.endsWith(".jpg") || s.endsWith(".png") || s.endsWith(".gif") || s.endsWith(".jpeg"))
				{
					mainpic = s;
					//System.out.println("提取到图片路径名称="+s);
					break;
				}
			}
		}	
		
		//System.out.println("最终="+mainpic);
		
		Article article = new Article();
		article.setSource(source);
		article.setAuthor(author);
		article.setTitle(title);
		article.setContent(content);
		article.setMainpic(mainpic);
		if(articleMapperCustom.setArticle(article) == 0)
			return 0;
		
		//写入category
		for(int i=0; i<newCategory.length; i++)
		{
			categoryMapperCustom.setCategory(Integer.parseInt(newCategory[i]),article.getAid());
		}
		
		return 1;
		
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

	@Override
	public int setLikesByAId(int aid, int likes) throws Exception 
	{
		return articleMapperCustom.setLikesByAId(aid,likes);
	}
	
}
