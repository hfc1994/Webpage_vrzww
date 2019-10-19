<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	
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
						<li class="navIndex">
							<a title="News" hidefocus="true" href="<%=request.getContextPath() %>/article/vrnews"> 
								<img border="0" alt="VR新闻" src="<%=request.getContextPath()%>/img/one_filled_26.png" /> VR新闻 
								<span>News</span>
							</a>
						</li>
						<li class="navIndex">
							<a title="Game" hidefocus="true" href="<%=request.getContextPath() %>/article/vrgame"> 
								<img border="0" alt="VR游戏" src="<%=request.getContextPath()%>/img/two_filled_26.png" /> VR游戏 
								<span>Game</span>
							</a>
						</li>
						<li class="navIndex">
							<a title="Service" hidefocus="true" href="<%=request.getContextPath() %>/article/vrtech"> 
								<img border="0" alt="VR技术" src="<%=request.getContextPath()%>/img/three_filled_26.png" /> VR技术 
								<span>Tech</span>
							</a>
						</li>
						<li class="navIndex">
							<a title="Service" hidefocus="true" href="<%=request.getContextPath() %>/article/ararea"> 
								<img border="0" alt="AR专区" src="<%=request.getContextPath()%>/img/four_filled_26.png" /> AR专区 
								<span>Ararea</span>
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