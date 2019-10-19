<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${categoryList.get(0) }</title>
<meta name="description"
	content="VR 资讯，动态，周边，尽在    @VR 中文网。" />
<meta name="keywords"
	content="VR，AR，MR, 虚拟现实，增强现实，混合现实 ，VR中文，VR中文网，VR资讯，VR游戏，VR技术" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/style.css"
	media="screen" />
	
<link rel="bookmark" type="image/x-icon" href="<%=request.getContextPath() %>/img/favicon.ico"/>
<link rel="shortcut icon" href="<%=request.getContextPath() %>/img/favicon.ico">
<link rel="icon" href="<%=request.getContextPath() %>/img/favicon.ico">
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.min.js"></script>
<!-- <script type="text/javascript" src="<%=request.getContextPath() %>/js/control.js"></script> -->
<script type="text/javascript" src="<%=request.getContextPath() %>/js/sc.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/article.js"></script>
<script >


//拉到底部的次数,刚打开就加载了一页，所以从2开始
var times = 2;
//点下一页之前，可以进行ajax加载的次数
var ajaxTimes = 3;
//是否还有可以加载的东西,1表示还有
var hasData = 1;

var categoryId = "${categoryList.get(2)}";
$(document).ready(function(){

	var sessionUId = "<%=request.getSession().getAttribute("uid") %>";
	var uri_head = "<%=request.getContextPath() %>";
	var head = "<%=request.getSession().getAttribute("headportrait") %>";
	var username = "<%=request.getSession().getAttribute("username") %>";
	
	showHeadIcon(sessionUId,uri_head,head,username);
	
	//加载完页面后修正图片路径
	document.getElementById("topcontrol").getElementsByTagName("img")[0].src=uri_head+"/img/topback.png";
	
	//拉到底部更新
	$(window).scroll(function()
	{
		var scrollTop = $(this).scrollTop();
		var scrollHeight = $(document).height();
		var windowHeight = $(this).height();
		if(scrollTop + windowHeight == scrollHeight)
		{
			if(times % ajaxTimes != 1 && noData() == false)
			{
				//alert("jsp  times="+times+" categoryId="+categoryId);
				ajaxLoadArticleById(times, categoryId,'<%=request.getContextPath() %>');
				//ajax更新2次页面共3段，则显示下一页按钮
				if(times % ajaxTimes == 0)	
					document.getElementById("nextPage").style.display="";
				times++;
			}
		}
	  });
	
});
		
</script>

</head>

<body>
	<div id="wrapper">
		
		<!-- 引入每个页面共有的部分 -->
		<%@ include file="header.jsp" %>

		<div id="main">
			<div class="mainContent clear" style="margin-top: 106px;">
				<div class="articleList leftFloat">
					<div class="postList clear">
						<div id="crumbs">
							您现在的位置: <a href="<%=request.getContextPath() %>/index.jsp">首页</a> » <a
								href="${categoryList.get(1) }" rel="category tag">${categoryList.get(0) }</a>
						</div>
						<br />

						<div class="articleListTitle">
							<h3>${categoryList.get(0) }</h3>
						</div>

						<ul id="article_ul">
							<c:forEach items="${articleList }" var="article" varStatus="status">
								<li> 
									<div class="entryImg">
										<a title="${article.title }" target="_blank"
											href="<%=request.getContextPath() %>/article/articleContent/${article.aid }">
										<img width="640" height="360" src="${article.mainpic} "
											class="attachment-post-thumbnail size-post-thumbnail wp-post-image"
											alt="show.jpg" sizes="(max-width: 640px) 100vw, 640px" />
										</a> 
										<span class="entryCopyright">精选</span>
									</div>

									<h3 class="entryTitle">
										<a title="${article.title }" target="_blank" 
											href="<%=request.getContextPath() %>/article/articleContent/${article.aid }">${article.title }
										</a>
									</h3>

									<p class="entryContent">${article.content }</p>
									<div class="entryMeta">
										<em class="entryDate">来源：</em>
										<em class="entryDate"><a target="_blank"
											href="http://${article.source }">${article.source } </a>
										</em>
										<em class="entryDate">/  <fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${article.publishtime }"/> </em>
									</div>
									<br />
									<br />
									<br />
    							</li>
							</c:forEach>
							


						</ul>
					</div>

					<div class="navigation clear">
						<div class="prevPage" id="prevPage" style="display:none">
							<input type="button" onclick="prevPageTwo('<%=request.getContextPath() %>')" value="上一页">
						</div>

						<div class="nextPage" id="nextPage" style="display:none">
							<!-- <button value="下一页">下一页</button> -->
							<input type="button" onclick="turnPageTwo('<%=request.getContextPath() %>')" value="下一页">
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
</html>