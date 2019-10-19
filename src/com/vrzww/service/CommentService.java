package com.vrzww.service;

import java.util.List;

import com.vrzww.po.CommentCustom;
import com.vrzww.po.CommentList;


/**
 * <p>description 评论的业务操作接口
 * @author user-hfc
 * @method getArticleList 获取全部评论
 * @method getArticleListByUId 根据类别用户Id 获取全部评论
 * @method getArticleListByAId 根据类别文章Id 获取全部评论
 * @method getCommentExist 获取未被删除的评论的完整列表
 * @method getCommentDeleted 获取被删除的评论的完整列表
 * @method deleteById 根据id删除指定评论，即更改其deleteState字段为0
 * @method recoverById 根据id恢复指定评论，即更改其deleteState字段为1
 * @method getCommentsListByAId 根据aid获取评论信息以及相关用户信息
 *
 */

public interface CommentService 
{
	public List<CommentCustom> getCommentList() throws Exception; 

	public List<CommentCustom> getCommentListByUId(int uid) throws Exception; 
	
	public List<CommentCustom> getCommentListByAId(int aid) throws Exception;

	public List<CommentCustom> getCommentExist(int pages) throws Exception;

	public List<CommentCustom> getCommentDeleted(int pages) throws Exception;

	public void deleteById(int id) throws Exception;

	public void recoverById(int id) throws Exception;
	
	public List<CommentList> getCommentsListByAId(int aid, int times) throws Exception;

	public int setComment(int aid, int uid, int pid, String content, int isleaf) throws Exception;

	public void setCommentLeaf(int pid) throws Exception;

	public void deleteByUId(int uid) throws Exception;

	public void recoverByUId(int uid) throws Exception;

	public void deleteByAId(int aid) throws Exception;

	public void recoverByAId(int aid) throws Exception;
}