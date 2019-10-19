<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>编辑文章</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style.css"
	media="screen" />	
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/wangEditor.min.css">
<link rel="bookmark" type="image/x-icon" href="<%=request.getContextPath()%>/img/favicon.ico"/>
<link rel="shortcut icon" href="<%=request.getContextPath()%>/img/favicon.ico">
<link rel="icon" href="<%=request.getContextPath()%>/img/favicon.ico">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<!-- <script type="text/javascript" src="<%=request.getContextPath()%>/js/control.js"></script> -->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/sc.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/article.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/wangEditor.min.js"></script>

<script>
	
	$(document).ready(function()
	{
		var sessionUId = "<%=request.getSession().getAttribute("uid") %>";
		var uri_head = "<%=request.getContextPath() %>";
		var head = "<%=request.getSession().getAttribute("headportrait") %>";
		var username = "<%=request.getSession().getAttribute("username") %>";
		
		showHeadIcon(sessionUId,uri_head,head,username);
		
		//加载完页面后修正图片路径
		document.getElementById("topcontrol").getElementsByTagName("img")[0].src=uri_head+"/img/topback.png";
		
		
		var editor = new wangEditor('inputRegion');
		
		editor.config.menus = 
		[ 
		  'bold',
		  'underline',
		  'italic',
		  'strikethrough',
		  'eraser',
		  'forecolor',
		  '|',
		  'fontsize',
	      'head',
	      'unorderlist',
	      'orderlist',
	      'alignleft',
	      'aligncenter',
	      'alignright',
	      '|',
	      'link',
	      'unlink',
	      'emotion',
	      '|',
	      'img',
	      '|',
	      'undo',
	      'redo', 
	   ];
		
		editor.config.uploadImgUrl = '<%=request.getContextPath() %>/administrator/articleImgUpload';
		//关闭网络链接图片模式 
		editor.config.hideLinkImg = true;

		editor.create();
		
		var editor2 = new wangEditor('mainPicRegion');
		editor2.config.menus = 
			[ 			  
		      'img',
		   ];
		editor2.config.uploadImgUrl = '<%=request.getContextPath() %>/administrator/articleImgUpload';
		//关闭网络链接图片模式 
		editor2.config.hideLinkImg = true;

		editor2.create();
		
	});
</script>

<script type="text/javascript">
	function submitArticle()
	{
		var title = document.getElementById("title").value;
		var source = document.getElementById("source").value;
		var author = document.getElementById("authorinput").value;
		var mainpic = $("#mainPicRegion").html();
		var content = $("#inputRegion").html();
		var checkbox = document.getElementsByName("category");
		
		var category = "";
		for(var i=0; i<checkbox.length; i++)
		{
			if(checkbox[i].checked==true)
			{
				category =category + checkbox[i].value + ",";
			}
		}

		ajaxSetArticle(title,source,author,mainpic,content,category,'<%=request.getContextPath() %>');
	}
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
						
						<div style="margin:5px 0 5px 0;">
							标题：<input type="text" id="title" style="width:240px;"></div>
						<div style="margin:5px 0 5px 0;">
							来源：<input type="text" id="source" style="width:240px;"></div>
						<div style="margin:5px 0 5px 0;">
							作者：<input type="text" id="authorinput" style="width:240px;"></div>
						<div style="margin:5px 0 5px 0;">
							类型：<input name="category" type="checkbox" value="1" style="margin-right:5px;" checked="true"/>VR新闻
								  <input name="category" type="checkbox" value="2" style="margin-right:5px;"/>VR游戏
								  <input name="category" type="checkbox" value="3" style="margin-right:5px;"/>VR技术
								  <input name="category" type="checkbox" value="4" style="margin-right:5px;"/>AR专区</div>
						 
						
						<div style="margin:10px 0 10px 0;text-align:center;">
							<p>主图</p>
						</div>
						
						<div id="mainPicRegion" style="height:180px;"></div>					
						
						<div style="margin:10px 0 10px 0;text-align:center;">
							<p>正文</p>
						</div>
						
						<div id="inputRegion" style="height:600px;max-height:900px;">
							<p>请输入内容</p>
						</div>
						
						<div id="submitButton" style="float:right;margin-top:25px;">
							<input type="button" value="推送" onclick="submitArticle()">
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