<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<link rel="stylesheet" text="text/css" href="<%=request.getContextPath()%>/css/templatemo_style.css"
	media="screen" />
<link rel="stylesheet" text="text/css" href="<%=request.getContextPath()%>/css/bootstrap.min.css"
	media="screen" />
<script type="text/javascript" src="<%=request.getContextPath() %>/js/article.js" ></script> 
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
	
<title>登陆</title>
</head>


<body class="templatemo-bg-gray">
	<div class="container">
		<div class="col-md-12">
			<h1 class="margin-bottom-15">登陆</h1>
			<form class="form-horizontal templatemo-container templatemo-login-form-1 margin-bottom-30" role="form" method="post">
							
		        <div class="form-group">
		          <div class="col-xs-9">		            
		            <div class="control-wrapper">
		            	<label for="account" class="control-label fa-label">
		            		<i class="fa fa-user fa-medium"></i></label>
		            	<input type="text" class="form-control" id="account" name="account" placeholder="账号">
		            </div>		            	            
		          </div>   
		          <span id="accountmsg"></span>           
		        </div>
		        
		        
		        <div class="form-group">
		          <div class="col-md-9">
		          	<div class="control-wrapper">
		            	<label for="password" class="control-label fa-label"><i class="fa fa-lock fa-medium"></i></label>
		            	<input type="password" class="form-control" id="password" name="password" placeholder="密码">
		            </div>
		          </div>
		          <span id="passwordmsg"></span>
		        </div>
		        
		        
		       <!--  <div class="form-group">
		          <div class="col-md-12">
	             	<div class="checkbox control-wrapper">
	                	<label>
	                		<!-- 暂时还没实现呢 -//->
	                  		<input type="checkbox"> 记住我
                		</label>
	              	</div>
		          </div>
		        </div> -->
		        
		        
		        <div class="form-group">
		          <div class="col-md-12">
		          	<div class="control-wrapper">
		          		<input type="button" value="登陆" class="btn btn-info" onclick="toLogin('<%=request.getContextPath() %>')">
						<!--<a href="#" class="text-right pull-right">忘记密码?</a> -->
		          	</div>
		          </div>
		        </div>
		        
		        
		        <hr>
		      </form>
		      <div class="text-center">
		      	<a href="register.jsp" class="templatemo-create-new">注册 <i class="fa fa-arrow-circle-o-right"></i></a>	
		      </div>
		</div>
	</div>
</body>
</html>