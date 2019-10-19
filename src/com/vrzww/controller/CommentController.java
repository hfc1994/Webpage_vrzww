package com.vrzww.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.vrzww.po.CommentCustom;
import com.vrzww.po.CommentList;
import com.vrzww.service.CommentService;

/**
 * <p>description 评论的controller
 * @author user-hfc
 *  @RequestMapping "/commentList" 获取完整的评论列表
 * @RequestMapping "/articleListById" 根据给定类别Id查找对应文章
 * 
 */

@Controller

@RequestMapping("/comment")
public class CommentController 
{
	@Autowired
	private CommentService commentService;
	
	@RequestMapping("/commentList")
	public ModelAndView articleList(HttpServletRequest request) throws Exception
	{
		List<CommentCustom> commentList = commentService.getCommentList();
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("commentList", commentList);
		modelAndView.setViewName("comment/commentList");
		
		return modelAndView;
	}
	
	@RequestMapping("/commentListByUId")
	public ModelAndView articleListByUId(HttpServletRequest request) throws Exception
	{
		List<CommentCustom> commentList = commentService.getCommentListByUId(1010002);
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("commentList", commentList);
		modelAndView.setViewName("comment/commentList");
		
		return modelAndView;
	}
	
	@RequestMapping("/commentListByAId")
	public ModelAndView articleListByAId(HttpServletRequest request) throws Exception
	{
		List<CommentCustom> commentList = commentService.getCommentListByAId(1004);
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("commentList", commentList);
		modelAndView.setViewName("comment/commentList");
		
		return modelAndView;
	}
	
	@RequestMapping("/getCommentsById")
	@ResponseBody
	public List<CommentList> getCommentsById(int articleId, int times, HttpServletRequest request) throws Exception
	{
		List<CommentList> commentsList = commentService.getCommentsListByAId(articleId,times);
		//System.out.println("///////////////////////////////"+commentsList.size());
		return commentsList;
	}
	
	@RequestMapping("/setComment")
	@ResponseBody
	public int setComment(int aid, int uid, int pid, String content, HttpServletRequest request) throws Exception
	{
		//上传到虚拟主机不需要下面这句转码
		content = new String(request.getParameter("content").getBytes("iso8859-1"),"utf-8");

		//最后一个0表示是叶子节点，后面无回复
		return commentService.setComment(aid,uid,pid,content,0);
	}
}
