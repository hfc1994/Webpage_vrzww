<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${articleCustom.title }</title>
<meta name="description"
	content="VR 资讯，动态，周边，尽在    @VR 中文网。" />
<meta name="keywords"
	content="VR，AR，MR, 虚拟现实，增强现实，混合现实 ，VR中文，VR中文网，VR资讯，VR游戏，VR技术" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style.css"
	media="screen" />
	
<link rel="bookmark" type="image/x-icon" href="<%=request.getContextPath()%>/img/favicon.ico"/>
<link rel="shortcut icon" href="<%=request.getContextPath()%>/img/favicon.ico">
<link rel="icon" href="<%=request.getContextPath()%>/img/favicon.ico">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/sc.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/article.js"></script>

<script type="text/javascript">
$(document).ready(function()
{
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
							您现在的位置: <a href="<%=request.getContextPath() %>/index.jsp">首页</a> » ${position }${articleCustom.title }
						</div>
						<br />
						<!-- 内容                          -->
						<div class="artTop">
							<div class="artCommentNumber"></div>
							<h1 class="artTitle">${articleCustom.title }</h1>
							<p class="artMeta">
								来源：<a href="http://${articleCustom.source }" target="_blank">${articleCustom.source }&nbsp&nbsp</a>
								作者：<a class="artTime">${articleCustom.author }&nbsp&nbsp</a> 
								发表时间：<a class="artTime">	
									<fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${articleCustom.publishtime }"/>
								</a>
							</p>
						</div>
						<div class="artContent">
							<div></div>
							<p>${articleCustom.content }</p>
						</div>

						<div class="frontback clear">
							<div class="artPre"></div>
							<div class="artNext"></div>
						</div>
						<div class="artCopyright">
							<h2 style="margin-top: 18px;">
							<p></p>
						</div>
					</div>

				</div>	
								
				</div>

				<div class="sideBar rightFloat"></div>
			</div>
			<div class="control_position"></div>
		</div>

		<!-- 引入每个页面共有的部分 -->
		<%@ include file="footer.jsp" %>

</body>
</html>