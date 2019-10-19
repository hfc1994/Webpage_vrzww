package com.vrzww.mapper;

import java.util.List;

import com.vrzww.po.CommentCustom;
import com.vrzww.po.CommentList;


/**
 * <p>description 评论相关的映射表接口
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

public interface CommentMapperCustom 
{
	List<CommentCustom> getCommentList() throws Exception; 

	List<CommentCustom> getCommentListByUId(int uid) throws Exception; 
	
	List<CommentCustom> getCommentListByAId(int aid) throws Exception;

	List<CommentCustom> getCommentExist(int start, int offset) throws Exception;

	List<CommentCustom> getCommentDeleted(int start, int offset) throws Exception;

	void deleteById(int id) throws Exception;

	void recoverById(int id) throws Exception;

	List<CommentList> getCommentsListByAId(int aid, int start, int offset) throws Exception;

	int setComment(int aid, int uid, int pid, String content, int isleaf) throws Exception;

	void setCommentLeaf(int pid) throws Exception;

	List<CommentList> getCommentListByLeaf(Integer cid,Integer aid) throws Exception;

	void deleteByUId(int uid) throws Exception;

	void recoverByUId(int uid) throws Exception;

	void deleteByAId(int aid) throws Exception;

	void recoverByAId(int aid) throws Exception;

	List<CommentCustom> getCommentListById(int cid) throws Exception;

	List<CommentCustom> getCommentListByPId(int cid) throws Exception;

	
}