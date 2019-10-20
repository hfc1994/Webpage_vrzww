<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>VR中文网管理员</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style.css"
	media="screen" />	
<link rel="bookmark" type="image/x-icon" href="<%=request.getContextPath()%>/img/favicon.ico"/>
<link rel="shortcut icon" href="<%=request.getContextPath()%>/img/favicon.ico">
<link rel="icon" href="<%=request.getContextPath()%>/img/favicon.ico">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<!-- <script type="text/javascript" src="<%=request.getContextPath()%>/js/control.js"></script> -->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/sc.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/article.js"></script>

<script>

var pages = 1;
$(document).ready(function(){
	var sessionUId = "<%=request.getSession().getAttribute("uid") %>";
	var uri_head = "<%=request.getContextPath() %>";
	var head = "<%=request.getSession().getAttribute("headportrait") %>";
	var username = "<%=request.getSession().getAttribute("username") %>";
	
	showHeadIcon(sessionUId,uri_head,head,username);
	
	//加载完页面后修正图片路径
	document.getElementById("topcontrol").getElementsByTagName("img")[0].src=uri_head+"/img/topback.png";
	
});


</script>

</head>

<body>
	<div id="wrapper">
		
		
		<!-- 引入每个页面共有的部分 -->
		<%@ include file="adminheader.jsp" %>

		<div id="main">
			<div class="mainContent clear" style="margin-top: 106px;">
				<div class="articleList leftFloat">
					<div class="postList clear">
						<div id="crumbs">
							您现在的位置: <a href="<%=request.getContextPath() %>/administration.jsp">管理</a> » <a id="crumbs_link"
								href="${infoList.get(1) }" rel="category tag">${infoList.get(0) }</a>
						</div>
						<br />

						<div class="articleListTitle">
							<h3>${infoList.get(0) }</h3>
						</div>
						
						<div id="crumbs_radio" >
							<input type="radio" name="choose" value="Exist"  onclick="changeContent()">存在
							<input type="radio" name="choose" value="Deleted" onclick="changeContent()">被删
						</div>
						<!-- <p id="show_text" style="font-size:60px">欢迎来到管理员页面</p> -->
						<ul id="article_ul" >
							<!-- 循环用户list -->
							<c:forEach items="${userList }" var="user" varStatus="status">
								<li> 
									<div class="entryImg">

										<img width="360" height="360" src="<%=request.getContextPath() %>/${user.headportrait } "
											class="attachment-post-thumbnail size-post-thumbnail wp-post-image"
											alt="show.jpg" sizes="(max-width: 360px) 100vw, 360px" />
										</a> 		
									</div>

									<h3 class="entryTitle">
										<a title="${user.username }">用户昵称：${user.username }
										</a>
									</h3>

									<p class="adminentryContent">账号：${user.loginname }<br/>id：${user.uid }</p>
									<div class="entryMeta">
										<em class="entryDate">注册时间：</em>
										<em class="entryDate"></em>
										<em class="entryDate">	<fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${user.registertime }"/> </em>
									</div>
									<input class="dr" type="button" name="deleteRecover" value="删除" onclick="deleteRecover('${user.uid }',this,'<%=request.getContextPath() %>')">
									<br />
									<br />
									<br />
    							</li>
							</c:forEach>
							
							<!-- 循环文章list -->
							<c:forEach items="${articleList }" var="article" varStatus="status">
								<li> 
									<div class="entryImg">
										<a title="${article.title }" target="_blank"
											href="<%=request.getContextPath() %>/administrator/articleContent/${article.aid }">
										<img width="640" height="360" src="${article.mainpic}"
											class="attachment-post-thumbnail size-post-thumbnail wp-post-image"
											alt="show.jpg" sizes="(max-width: 640px) 100vw, 640px" />
										</a> 
										<span class="entryCopyright">精选</span>
									</div>

									<h3 class="entryTitle">
										<a title="${article.title }" target="_blank" 
											href="<%=request.getContextPath() %>/administrator/articleContent/${article.aid }">文章标题：${article.title }
										</a>
									</h3>

									<p class="adminentryContent">文章内容：${article.content }</p>
									<div class="entryMeta">
										<em class="entryDate">来源：</em>
										<em class="entryDate"><a target="_blank"
											href="http://${article.source }">${article.source } </a>
										</em>
										<em class="entryDate">	<fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${article.publishtime }"/> </em>
									</div>
									<input class="dr" type="button" name="deleteRecover" value="删除" onclick="deleteRecover('${article.aid }',this,'<%=request.getContextPath() %>')">
									<br />
									<br />
									<br />
    							</li>
							</c:forEach>
							
							<!-- 循环评论list -->
							<c:forEach items="${commentList }" var="comment" varStatus="status">
								<li> 

									<h3 class="entryTitle">
										<a>评论内容</a>
									</h3>

									<p class="adminentryContent">${comment.content }</p>
									<div class="entryMeta">
										<em class="entryDate">发表时间：</em>
										<em class="entryDate"></em>
										<em class="entryDate">	<fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${comment.posttime }"/> </em>
									</div>
									<input class="dr" type="button" name="deleteRecover" value="删除" onclick="deleteRecover('${comment.cid }',this,'<%=request.getContextPath() %>')">
									<br />
									<br />
									<br />
    							</li>
							</c:forEach>

						</ul>
					</div>

					<div class="navigation clear">
						<div class="prevPage" id="prevPage" style="display:none">
							<input type="button" onclick="adminPrevPage('<%=request.getContextPath() %>')" value="上一页">
						</div>

						<div class="nextPage" id="nextPage">
							<!-- <button value="下一页">下一页</button> -->
							<input type="button" onclick="adminTurnPage('<%=request.getContextPath() %>')" value="下一页">
						</div>
					</div>
					
				</div>

				<div class="sideBar rightFloat"></div>
			</div>
		</div>

		<div class="control_position"></div>

		<!-- 引入每个页面共有的部分 -->
		<%@ include file="footer.jsp" %>

</body>

<script type="text/javascript">
	//根据是什么页面来选择显示相应内容
	var url_judge = document.getElementById("crumbs_link").href;
	var radio_checked = document.getElementsByName('choose');
	var delete_Recover = document.getElementsByName('deleteRecover');
	var judge = url_judge.search("Exist");
	if (judge == -1)//是被删页面
	{
		radio_checked[1].checked = "checked";
		for(var i=0; i<delete_Recover.length; i++)
		{
			delete_Recover[i].value="恢复";
		}
	}
	else
	{
		radio_checked[0].checked = "checked";
		for(var i=0; i<delete_Recover.length; i++)
		{
			delete_Recover[i].value="删除";
		}
	}
</script>

</html>