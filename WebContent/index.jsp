<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>VR中文网</title>
<meta name="description"
	content="VR 资讯，动态，周边，尽在   @VR 中文网。" />
<meta name="keywords"
	content="VR，AR，MR, 虚拟现实，增强现实，混合现实 ，VR中文，VR中文网，VR资讯，VR游戏，VR技术" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/style.css"
	media="screen" />

<link rel="bookmark" type="image/x-icon" href="<%=request.getContextPath() %>/img/favicon.ico" />
<link rel="shortcut icon" href="<%=request.getContextPath() %>/img/favicon.ico">
<link rel="icon" href="<%=request.getContextPath() %>/img/favicon.ico">
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/sc.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/article.js"></script>
<script>

//拉到底部的次数,刚打开就加载了一页，所以从2开始
var times = 2;
//点下一页之前，可以进行ajax加载的次数
var ajaxTimes = 3;
//是否还有可以加载的东西,1表示还有
var hasData = 1;

$(document).ready(function(){
	
	var sessionUId = "<%=request.getSession().getAttribute("uid") %>";
	var uri_head = "<%=request.getContextPath() %>";
	var head = "<%=request.getSession().getAttribute("headportrait") %>";
	var username = "<%=request.getSession().getAttribute("username") %>";
	
	showHeadIcon(sessionUId,uri_head,head,username);
	
	loadIndexArticle('<%=request.getContextPath() %>');
	
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
				indexAjaxLoadArticle(times,'<%=request.getContextPath() %>');
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
			<div class="mainTop clear">
				<div class="imageRotation leftFloat">
					<div>
						<img src="./img/vrworld.jpg" />
					</div>
				</div>
			</div>

			<div class="mainContent clear">
				<div class="articleList leftFloat">
					<div class="postList clear" id="index_news">
						<ul id="article_ul"><!-- 页面加载内容处 -->
						</ul>
					</div>

					<div class="navigation clear">
						<div class="prevPage" id="prevPage" style="display:none">
							<input type="button" onclick="prevPage('<%=request.getContextPath() %>')" value="上一页">
						</div>

						<div class="nextPage" id="nextPage" style="display:none">
							<!-- <button value="下一页">下一页</button> -->
							<input type="button" onclick="turnPage('<%=request.getContextPath() %>')" value="下一页">
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="control_position"></div>
		
		<!-- 引入每个页面共有的部分 -->
		<%@ include file="footer.jsp" %>
</body>
</html>