<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>个人中心</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style.css"
	media="screen" />	
<link rel="bookmark" type="image/x-icon" href="<%=request.getContextPath()%>/img/favicon.ico"/>
<link rel="shortcut icon" href="<%=request.getContextPath()%>/img/favicon.ico">
<link rel="icon" href="<%=request.getContextPath()%>/img/favicon.ico">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/sc.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/article.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/wangEditor.min.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/wangEditor.min.js"></script>



<script>
$(document).ready(function(){
	
	
	
	var sessionUId = "<%=request.getSession().getAttribute("uid") %>";
	var uri_head = "<%=request.getContextPath() %>";
	var head = "<%=request.getSession().getAttribute("headportrait") %>";
	var username = "<%=request.getSession().getAttribute("username") %>";
	
	showHeadIcon(sessionUId,uri_head,head,username);
	
	//加载完页面后修正图片路径
	document.getElementById("topcontrol").getElementsByTagName("img")[0].src=uri_head+"/img/topback.png";
	
	//设置头像
	var editor = new wangEditor('headportrait');
	editor.config.menus = 
		[ 			  
	      'img',
	   ];
	editor.config.uploadImgUrl = '<%=request.getContextPath() %>/administrator/articleImgUpload';
	//关闭网络链接图片模式 
	editor.config.hideLinkImg = true;

	editor.create();
	
});
</script>

<script type="text/javascript">
	function setSelfInfo()
	{
		var newusername = document.getElementById("newusername").value;
		var headportrait = $("#headportrait").html();
		var oldpassword = document.getElementById("oldpassword").value;
		var newpassword = document.getElementById("newpassword").value;
		//alert("newusername"+newusername+"//head"+headportrait+"//old"+oldpassword+"//new"+newpassword);
		ajaxSetSelfInfo("<%=request.getSession().getAttribute("uid") %>",newusername,headportrait,oldpassword,newpassword,'<%=request.getContextPath() %>');
	}
</script>

</head>

<body>
	<div id="wrapper">
		
		<div id="header">

			<div class="headerMain">
				<div class="logo">
					<h1>
						<a title="VR中文" href="<%=request.getContextPath() %>/index.jsp"> <img
							border="0" alt="VR中文" src="<%=request.getContextPath()%>/img/logo.png"
							style="width: 80%; margin-top: 3px;" />
						</a>
					</h1>
				</div>

				<div class="nav clear">
					<ul>
						<li class="navIndex">
							<a title="Home" hidefocus="true" href="<%=request.getContextPath() %>/index.jsp"> 
								<img border="0" alt="首页" src="<%=request.getContextPath()%>/img/home1_26.png" /> 首页 
								<span>Home</span>
							</a>
						</li>
					</ul>
				</div>

				<div class="login_register" id="logout" style="display:none;">
					<a href="<%=request.getContextPath() %>/user/userLogout" class="l_r_info" >注销</a>
				</div>
				<div class="username" id="username" style="display:none;">
					<!-- id -->
				</div>
				<div class="head_icon" id="head_icon" style="display:none;">
					<!-- <img alt="头像" src="<%=request.getContextPath()%>/img/user_128px.png" style="width:48px;height:48px;"> -->
				</div>
				<div class="login_register" id="register" >
					<a href="<%=request.getContextPath()%>/register.jsp" class="l_r_info" target="_blank">注册</a>
				</div>
				<div class="login_register" id="login" >
					<a href="<%=request.getContextPath()%>/login.jsp" class="l_r_info" >登陆</a>
				</div>

				<div class="weibo_x_q">
					<a title="VR中文网微博" href="http://weibo.com/VRZWW" target="_blank"><img
						border="0" alt="VR中文网微博" src="<%=request.getContextPath()%>/img/weibo_color_40.png" /></a>
				</div>
				
			</div>
		</div>

		<div id="main">
			<div class="mainContent clear" style="margin-top: 106px;">
				<div class="articleList leftFloat">
					<div class="postList clear">
						<div id="crumbs">
							您现在的位置: <a href="<%=request.getContextPath() %>/index.jsp">首页</a> » <a id="crumbs_link"
								href="<%=request.getContextPath() %>/selfService.jsp" rel="category tag">个人中心</a>
						</div>
						<br />

						<div class="articleListTitle">
							<h3>个人中心</h3>
						</div>

						<div>
							新用户名：<input type="text" id="newusername"><br/><br/><br/>
							新头像：<br/>
							<div id="headportrait" style="height:180px;"></div><br/>	
							旧密码：<input type="password" id="oldpassword"><br/><br/><br/>
							新密码：<input type="password" id="newpassword"><br/><br/><br/>
						</div>
						<div id="submitButton" style="float:right;margin-top:25px;">
							<input type="button" value="更改" onclick="setSelfInfo()">
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