package com.vrzww.service.impl;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.vrzww.mapper.CommentMapper;
import com.vrzww.mapper.CommentMapperCustom;
import com.vrzww.po.CommentCustom;
import com.vrzww.po.CommentList;
import com.vrzww.service.CommentService;

/**
 * <p>description 评论的业务操作实现
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

public class CommentServiceImpl implements CommentService
{

	@Autowired
	private CommentMapperCustom commentMapperCustom;
	
	@Autowired
	private CommentMapper commentMapper;
	
	@Override
	public List<CommentCustom> getCommentList() throws Exception 
	{
		return commentMapperCustom.getCommentList();
	}

	@Override
	public List<CommentCustom> getCommentListByUId(int uid) throws Exception 
	{
		return commentMapperCustom.getCommentListByUId(uid);
	}

	@Override
	public List<CommentCustom> getCommentListByAId(int aid) throws Exception 
	{
		return commentMapperCustom.getCommentListByAId(aid);
	}

	@Override
	public List<CommentCustom> getCommentExist(int pages) throws Exception 
	{
		int offset = 10;
		int start = 0 + offset * (pages - 1);
		return commentMapperCustom.getCommentExist(start,offset);
	}

	@Override
	public List<CommentCustom> getCommentDeleted(int pages) throws Exception 
	{
		int offset = 10;
		int start = 0 + offset * (pages - 1);
		return commentMapperCustom.getCommentDeleted(start,offset);
	}

	@Override
	public List<CommentList> getCommentsListByAId(int aid,int times) throws Exception 
	{
		int offset = 10;
		int start = 0 + offset * (times - 1);
		//只获得10层主楼（pid=0），楼中楼未查询
		List<CommentList> commentList = new LinkedList<CommentList>();
		//根据主楼的isLeaf是否为0来判断是否需要查询它的所有楼中楼	
		
		commentList.addAll(getCommentListByLeaf(commentMapperCustom.getCommentsListByAId(aid,start,offset),aid));
		
		//把commentList里面的评论按照时间顺序重新排列放到newCommentList里面
		List<CommentList> newCommentList = new LinkedList<CommentList>();

		newCommentList.addAll(sortList(commentList));
		
		return newCommentList;
	}
	
	//根据主楼的isLeaf是否为0来决定通过pid和aid来查询楼中楼comment
	//递归
	public List<CommentList> getCommentListByLeaf(List<CommentList> cl,int aid) throws Exception
	{
		int cl_length = cl.size();
		for(int i=0; i<cl_length; i++)
		{
			int isLeaf = Integer.parseInt(cl.get(i).getIsleaf());
			if(isLeaf == 1)
			{
				List<CommentList> newCL =  new LinkedList<CommentList>();
				newCL.addAll(commentMapperCustom.getCommentListByLeaf(cl.get(i).getCid(), aid));
				cl.addAll(getCommentListByLeaf(newCL,aid));
			}
		}

		return cl;
	}

	//对List<CommentList>根据时间来进行先后排序
	//冒泡排序
	public List<CommentList> sortList(List<CommentList> cl)
	{
		int length = cl.size();
		CommentList cl_temp = new CommentList();//临时变量
		
		for(int i = 0; i < length - 1; i++)
		{
			for(int n = 0; n < length - 1 - i; n++)
			{
				if(cl.get(n).getPosttime().getTime() > cl.get(n+1).getPosttime().getTime())
				{
					cl_temp = cl.get(n);
					cl.set(n, cl.get(n+1));
					cl.set(n+1, cl_temp);
					cl_temp = null;
				}
			}
		}
		
		return cl;
	}
	
	@Transactional
	@Override
	public int setComment(int aid, int uid, int pid, String content, int isleaf)
			throws Exception 
	{
		//根据pid是否为0来决定是否需要把此条评论的父评论isleaf改成1
		if(pid != 0) setCommentLeaf(pid);
		return commentMapperCustom.setComment(aid,uid,pid,content,isleaf);	
	}

	@Override
	public void setCommentLeaf(int pid) throws Exception 
	{
		commentMapperCustom.setCommentLeaf(pid);
	}
	
//////////////////////////////////////////////////////////////
	//根据cid删除评论以及其子评论
	@Transactional
	@Override
	public void deleteById(int cid) throws Exception 
	{
		List<CommentCustom> cc = new LinkedList<CommentCustom>();
		cc = commentMapperCustom.getCommentListByPId(cid);
		List<CommentCustom> cc_new = new ArrayList<CommentCustom>();
		//通过父节点cc查询所有子结点，并最终返回父节点+子结点的集合
		cc_new = getCommentListByLeaf(cc);
		
		int cc_new_size = cc_new.size();
		for(int i=0; i<cc_new_size; i++)
		{
			commentMapperCustom.deleteById(cc_new.get(i).getCid());	
		}
		commentMapperCustom.deleteById(cid);
	}

	@Override
	public void recoverById(int cid) throws Exception 
	{
		commentMapperCustom.recoverById(cid);
	}
	
	//根据uid删除对应的评论，以及其子评论
	@Transactional
	@Override
	public void deleteByUId(int uid) throws Exception 
	{
		List<CommentCustom> cc = new LinkedList<CommentCustom>();
		cc = commentMapperCustom.getCommentListByUId(uid);
		List<CommentCustom> cc_new = new ArrayList<CommentCustom>();
		//通过父节点cc查询所有子结点，并最终返回父节点+子结点的集合
		cc_new = getCommentListByLeaf(cc);
		
		int cc_new_size = cc_new.size();
		for(int i=0; i<cc_new_size; i++)
		{
			commentMapperCustom.deleteById(cc_new.get(i).getCid());	
		}
		commentMapperCustom.deleteByUId(uid);	
	}

	@Override
	public void recoverByUId(int uid) throws Exception 
	{
		commentMapperCustom.recoverByUId(uid);
	}

	//根据aid删除对应的评论，以及其子评论
	@Transactional
	@Override
	public void deleteByAId(int aid) throws Exception 
	{
//		List<CommentCustom> cc = new LinkedList<CommentCustom>();
//		cc = commentMapperCustom.getCommentListByAId(aid);
//		List<CommentCustom> cc_new = new ArrayList<CommentCustom>();
//		//通过父节点cc查询所有子结点，并最终返回父节点+子结点的集合
//		cc_new = getCommentListByLeaf(cc);
//		
//		int cc_new_size = cc_new.size();
//		for(int i=0; i<cc_new_size; i++)
//		{
//			commentMapperCustom.deleteById(cc_new.get(i).getCid());	
//		}
		
		commentMapperCustom.deleteByAId(aid);
	}

	@Override
	public void recoverByAId(int aid) throws Exception 
	{
		commentMapperCustom.recoverByAId(aid);
	}
	
	//根据主楼的isLeaf是否为0来决定通过pid和aid来查询楼中楼comment
	//函数重载
	//递归
	public List<CommentCustom> getCommentListByLeaf(List<CommentCustom> cc) throws Exception
	{
		int cc_length = cc.size();
		for(int i=0; i<cc_length; i++)
		{
			int isLeaf = Integer.parseInt(cc.get(i).getIsleaf());
			if(isLeaf == 1)
			{
				List<CommentCustom> newCc =  new LinkedList<CommentCustom>();
				newCc.addAll(commentMapperCustom.getCommentListByPId(cc.get(i).getCid()));
	
				cc.addAll(getCommentListByLeaf(newCc));
			}
		}
		return cc;
	}
}
