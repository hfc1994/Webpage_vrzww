<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="css/templatemo_style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="css/style.css">
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/checkData.js"></script>
<title>注册</title>
</head>
<body class="templatemo-bg-gray">
	<h1 class="margin-bottom-15">注册</h1>
	<div class="container">
		<div class="col-md-12">			
			<form class="form-horizontal templatemo-create-account templatemo-container margin-bottom-30" role="form" 
					action="<%=request.getContextPath() %>/user/userRegister"  method="post" onSubmit="return checkData()">
				<div class="form-inner">
			        <div class="form-group">
			          <div class="col-md-6">		          	
			            <label for="username" class="control-label">登陆账号</label>
			            <input type="email" class="form-control" id="loginname" name="email" placeholder="登陆账号" onblur="checkLoginName('<%=request.getContextPath() %>')">	
			            <span id="emailmsg"></span>	            		            		            
			          </div>            
			        </div>			
			        <div class="form-group">
			          <div class="col-md-6">		          	
			            <label for="username" class="control-label">用户名</label>
			            <input type="text" class="form-control" id="username" name="username" placeholder="用户名">		            		            		            
			          </div>            
			        </div>
			        <div class="form-group">
			          <div class="col-md-6">
			            <label for="password" class="control-label">密码</label>
			            <input type="password" class="form-control" id="password" name="password" placeholder="密码">
			          </div>
			          <div class="col-md-6">
			            <label for="password" class="control-label">确认密码</label>
			            <input type="password" class="form-control" id="password_confirm" placeholder="确认密码">
			          </div>
			        </div>
			        <div class="form-group">
			          <div class="col-md-6">
			            <label for="question" class="control-label">密保问题</label>
			            <input type="question" class="form-control" id="question" name="question" placeholder="密保问题">
			          </div>
			          <div class="col-md-6">
			            <label for="answer" class="control-label">答案</label>
			            <input type="answer" class="form-control" id="answer" name="answer" placeholder="答案">
			          </div>
			        </div>
			        <div class="form-group">
			          <div class="col-md-12">
			            <input type="submit" value="注册" class="btn btn-info" id="register">
			            <a href="#" class="text-right pull-right">忘记密码?</a>
			          </div>
			        </div>	
				</div>				    	
		      </form>	
		      <div class="text-center">
		      	<a href="login.jsp" class="templatemo-create-new">登陆 <i class="fa fa-arrow-circle-o-right"></i></a>	
		      </div>	      
		</div>
	</div>
</body>
</html>