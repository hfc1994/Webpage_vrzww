package com.vrzww.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.vrzww.po.ArticleCustom;

/**
 * <p>descrption 文章的业务操作接口
 * @author user-hfc
 * @method getArticleList 获取全部文章
 * @method getArticleListById 根据categoryId获取全部文章
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

public interface ArticleService 
{
	public List<ArticleCustom> getArticleList() throws Exception;
	
	public List<ArticleCustom> getArticleListById(int categoryId) throws Exception;

	public List<ArticleCustom> getArticleLimitList(int times) throws Exception;
	
	public List<ArticleCustom> getArticleLimitListById(int categoryId, int times) throws Exception;

	public ArticleCustom getArticleContentById(int aid) throws Exception;

	public List<ArticleCustom> getArticleListExist(int pages) throws Exception;

	public List<ArticleCustom> getArticleListDeleted(int pages) throws Exception;

	public ArticleCustom getArticleContentByIdNoLimit(Integer aid) throws Exception;

	public void deleteById(int id) throws Exception;

	public void recoverById(int id) throws Exception;

	public int setArticle(String source, String author, String title,
			String content, String mainpic, String category, HttpServletRequest request) throws Exception;

	public int setLikesByAId(int aid, int likes) throws Exception;
}
