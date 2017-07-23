<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>大学版领英网</title>
<link rel="stylesheet" type="text/css" href="css/style1.css" />
<link rel="stylesheet" type="text/css" href="css/body.css"/> 
<script type="text/javascript">
			function htmlEncode ( str ) {  
			  var ele = document.createElement('span');  
			  ele.appendChild( document.createTextNode( str ) );  
			  return ele.innerHTML;  
			}
			function login()
			{
				var loginForm = document.loginForm;
				loginForm.stuNumber.value = htmlEncode(loginForm.stuNumber.value);
				if(loginForm.stuNumber.value == "" || loginForm.stuNumber.value.indexOf(" ") > -1)
				{
					loginForm.user.focus();
					return;
				}
				loginForm.password.value = htmlEncode(loginForm.password.value);
				if(loginForm.password.value == "" || loginForm.password.value.indexOf(" ") > -1)
				{
					loginForm.password.focus();
					return;
				}
				loginForm.action = "homepage.jsp";
				loginForm.action = "<%=path%>/servlet/LoginAction";
				loginForm.submit();
				
			}	
		</script>
</head>
<body>
 <div id="div1">
 			<img id="img1" src="">
</div>
<div class="container">
<div class="col-md-12 column">
				<div class="row clearfix">
					<div class="col-md-5 column" style="margin-top:-20px">
						<a href="LoginPage.jsp"><img alt="140x140" src="png\home.png" /></a>
					</div>
					<div class="col-md-7 column" style="margin-top:-3px">
				</div>
				<div class="row"  style="margin-top:20px">
				<div class="eightcol last">
				<!-- Begin Form -->
	<section id="content">
		<form action=""  name="loginForm" method="post">
			<h1>用户登录</h1>
			<div>
				<input type="text" name="stuNumber" placeholder="学号" required="" id="username" />
			</div>
			<div>
				<input type="password" placeholder="密码" name="password" required="" id="password" />
			</div>
			 <div class="">
				<span class="help-block u-errormessage" id="js-server-helpinfo">&nbsp;</span>			</div> 
			<div>
				<!-- <input type="submit" value="Log in" /> -->
				<input type="submit" value="登录" class="btn btn-primary" id="js-btn-login" onclick="login()"/>
				<a href="RegisterPage.jsp">前往注册</a>
				<!-- <a href="#">Register</a> -->
			</div>
		</form><!-- form -->
		 <div class="button">
			<span class="help-block u-errormessage" id="js-server-helpinfo">&nbsp;</span>	
		</div> <!-- button -->
	</section><!-- content -->
</div>
<!-- container -->


<br><br><br><br>
</body>
</html>
