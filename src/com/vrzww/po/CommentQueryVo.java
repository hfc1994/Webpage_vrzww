package com.vrzww.po;

import java.util.List;

/**
 * <p>description 评论包装对象
 * @author user-hfc
 *
 */

public class CommentQueryVo
{
	private Comment comment;
	
	private CommentCustom commentCustom;
	
	private List<CommentCustom> commentList;

	public Comment getComment() 
	{
		return comment;
	}

	public void setComment(Comment comment) 
	{
		this.comment = comment;
	}

	public CommentCustom getCommentCustom() 
	{
		return commentCustom;
	}

	public void setCommentCustom(CommentCustom commentCustom) 
	{
		this.commentCustom = commentCustom;
	}

	public List<CommentCustom> getCommentList() 
	{
		return commentList;
	}

	public void setCommentList(List<CommentCustom> commentList) 
	{
		this.commentList = commentList;
	}
	
	
}