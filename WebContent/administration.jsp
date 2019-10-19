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
<script type="text/javascript" src="<%=request.getContextPath()%>/js/sc.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/article.js"></script>


<script type="text/javascript">
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
								href="<%=request.getContextPath() %>/administration.jsp" rel="category tag">管理员欢迎页面</a>
						</div>
						<br />

						<div class="articleListTitle">
							<h3>管理员欢迎页面</h3>
						</div>

						<p id="show_text" style="font-size:60px;height:500px;">欢迎回到管理员页面</p>
					
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