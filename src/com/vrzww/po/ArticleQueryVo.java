package com.vrzww.po;

import java.util.List;

/**
 * <p>description 文章信息包装类
 * @author user-hfc
 *
 */

public class ArticleQueryVo
{
	private Article article;

	private ArticleCustom articleCustom;

	private List<ArticleCustom> articleList;

	public Article getArtilce() 
	{
		return article;
	}

	public void setArtilce(Article artilce) 
	{
		this.article = artilce;
	}

	public ArticleCustom getArticleCustom() 
	{
		return articleCustom;
	}

	public void setArticleCustom(ArticleCustom articleCustom) 
	{
		this.articleCustom = articleCustom;
	}

	public List<ArticleCustom> getArticleList() 
	{
		return articleList;
	}

	public void setArticleList(List<ArticleCustom> articleList) 
	{
		this.articleList = articleList;
	}
}