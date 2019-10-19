package com.vrzww.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.vrzww.po.Article;
import com.vrzww.po.ArticleCustom;
import com.vrzww.po.CategoryCustom;
import com.vrzww.po.CategoryQueryVo;


/**
 * <p>description 文章相关的映射表接口
 * @author user-hfc
 * @method getArticleList 获取全部文章
 * @method getArticleListById 根据类别Id 获取全部文章
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

public interface ArticleMapperCustom
{

	List<ArticleCustom> getArticleList() throws Exception; 

	List<ArticleCustom> getArticleListById(List<CategoryCustom> list) throws Exception;

	List<ArticleCustom> getArticleLimitList(int start,int offset) throws Exception;

	List<ArticleCustom> getArticleLimitListById(@Param("categoryCustom") List<CategoryCustom> cc,
			@Param("start") int start, @Param("offset")int offset) throws Exception;

	ArticleCustom getArticleContentById(int aid) throws Exception;

	List<ArticleCustom> getArticleListExist(int start, int offset) throws Exception;

	List<ArticleCustom> getArticleListDeleted(int start, int offset) throws Exception;

	ArticleCustom getArticleContentByIdNoLimit(Integer aid) throws Exception;

	void deleteById(int id) throws Exception;

	void recoverById(int id) throws Exception;

	int setArticle(Article article) throws Exception;

	int setLikesByAId(int aid, int likes) throws Exception;
 
}