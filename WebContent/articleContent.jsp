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

//是否已经点赞过了，0表示没有
var clickedLikes = 0;
//有几个赞
var likes = ${articleCustom.likes };
var getCommentsTime = 0;
var articleInfoId = "${articleInfoId }";
//为配合其它函数，此处3个变量名比较特殊
var uid = "<%=request.getSession().getAttribute("uid") %>";
var uri_head = "<%=request.getContextPath() %>";
var headpath = "<%=request.getSession().getAttribute("headportrait") %>";
var name = "<%=request.getSession().getAttribute("username") %>";


$(document).ready(function(){
	
	//填入赞数
	document.getElementById("likes_num").innerHTML=likes;
	
	showHeadIcon(uid,uri_head,headpath,name);
	
	if(getCommentsTime == 0)
	{
		getCommentsTime = 1;
		ajaxGetCommentsById(articleInfoId,getCommentsTime,'<%=request.getContextPath()%>');
	}
	
	//加载完页面后修正图片路径
	document.getElementById("topcontrol").getElementsByTagName("img")[0].src=uri_head+"/img/topback.png";
	
	//拉到底部更新读取评论
	//$(window).scroll(function()
	//{
		//var scrollTop = $(this).scrollTop();
		//var scrollHeight = $(document).height();
		//var windowHeight = $(this).height();
		//if(scrollTop + windowHeight == scrollHeight)
		//{
			//if(getCommentsTime == 0)
			//{
				//getCommentsTime = 1;
				//ajaxGetCommentsById(articleInfoId,getCommentsTime);
			//}
		//}
	  //});
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
							您现在的位置: <a href="<%=request.getContextPath() %>/index.jsp">首页</a> » ${articleCustom.title }
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
							<div style="height:80px;display:inline;">
								<a  onclick="clickLikes('<%=request.getContextPath() %>',${articleCustom.aid })">
									<img id="likes" alt="likes" src="<%=request.getContextPath() %>/img/like.png" style="width:64px;height:64px;">	
								</a>
								<div id="likes_info">点赞数：<p id="likes_num" style="display:inline;"></p></div>
							</div>
						</div>

						<!-- JiaThis Button BEGIN -->
						<div class="jiathis_style">
							<span class="jiathis_txt">分享到：</span> <a
								class="jiathis_button_qzone">QQ空间</a> <a
								class="jiathis_button_tsina">新浪微博</a> <a
								class="jiathis_button_tqq">腾讯微博</a> <a
								class="jiathis_button_weixin">微信</a> <a
								href="http://www.jiathis.com/share"
								class="jiathis jiathis_txt jiathis_separator jtico jtico_jiathis"
								target="_blank">更多</a> <a class="jiathis_counter_style"></a>
						</div>
						<script type="text/javascript"
							src="http://v3.jiathis.com/code/jia.js" charset="utf-8"></script>
						<!-- JiaThis Button END -->



						<div class="frontback clear">
							<div class="artPre"></div>
							<div class="artNext"></div>
						</div>
						<div class="artCopyright">
							<h2 style="margin-top: 18px;">版权声明</h2>
							<p>
								<span>本文仅代表作者观点，不代表VR中文网立场。</span> <br />
							</p>
						</div>

						</div>

						<div id="postcomments">
							<div id="comments">
								一起来吐槽吧
							</div>
							
							<div id="big_comment">
								<textarea id="textarea1" rows="3" cols="80" ></textarea>
								<input class="commentsubmit" type="button" value="发表" onclick="toPostComment(this,'div','0','0','<%=request.getContextPath() %>')">
							</div>
							
							<ol class="commentlist" id="commentlist">
														
							</ol>
	
							<div class="commentnav">
								
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