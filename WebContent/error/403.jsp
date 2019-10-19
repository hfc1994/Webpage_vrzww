<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>403页面</title>

<script type="text/javascript">
	var leftTime = 5000;
	function go()
	{
		document.getElementById("num").innerText = leftTime/1000+"秒钟后自动重定向到网站首页...";
		leftTime -= 1000;
		if(leftTime <= 0)
			document.location.href = "<%=request.getContextPath() %>/index.jsp";
	}
	
	setInterval(go, 1000);
</script>

</head>
<body>
<p>403错误</p>
<p id="num"></p>
</body>
</html>