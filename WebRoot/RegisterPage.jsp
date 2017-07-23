	<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=gbk"%>
	<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	request.setCharacterEncoding("utf-8");
	%>
	
	<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
	<html>
	  <head>
	    <base href="<%=basePath%>">
	    
	   <title>大学版领英网</title>
		<meta charset="utf-8">
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">    
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
	   <script src="js/jquery.min.js"></script>
	   <script src="js/bootstrap.min.js"></script>
	  <link href="css/bootstrap.min.css" rel="stylesheet">
		<link href="css/body.css" rel="stylesheet">
	   <script src="js/jquery.min.js"></script>
	   <script src="js/bootstrap.min.js"></script>
	   <link href="css/jquery-ui.css" rel="stylesheet"/>
	   <link href="css/jquery.idealforms.min.css" rel="stylesheet" media="screen"/>
	  <link rel="stylesheet" type="text/css" href="css/style1.css" /> 
	<style type="text/css">
	body{font:normal 15px/1.5 Arial, Helvetica, Free Sans, sans-serif;overflow-y:scroll;padding:60px 0 0 0;}
	#my-form{width:755px;margin:0 auto;border:1px solid #ccc;padding:3em;border-radius:3px;box-shadow:0 0 2px rgba(0,0,0,.2);}
	</style>
	
	<script type="text/javascript">		
			function back()
			{
				window.location.href="<%=path%>/LoginPage.jsp";
			}	
			
			function htmlEncode ( str ) {  
			  var ele = document.createElement('span');  
			  ele.appendChild( document.createTextNode( str ) );  
			  return ele.innerHTML;  
			}
			
			function r()
			{			
				var regForm = document.regForm;
				regForm.stuNumber.value = htmlEncode(regForm.stuNumber.value);   
				if(regForm.stuNumber.value == "" || regForm.stuNumber.value.indexOf(" ") > -1)
				{
					regForm.user.focus();
					return;
				}
				regForm.stuName.value = htmlEncode(regForm.stuName.value);
				if(regForm.stuName.value == "" || regForm.stuName.value.indexOf(" ") > -1)
				{
					regForm.user.focus();
					return;
				}
				regForm.password.value = htmlEncode(regForm.password.value);
				if(regForm.password.value == "")
				{
					regForm.user.focus();
					return;
				}
				regForm.password2.value = htmlEncode(regForm.password2.value);
				if(regForm.password2.value == "")
				{
					regForm.user.focus();
					return;
				}
				if(regForm.password.value != regForm.password2.value)
				{
					alert("两次输入的密码不一致");
					regForm.user.focus();
					return;
				}
				regForm.major.value = htmlEncode(regForm.major.value);
				if(regForm.major.value == "" || regForm.major.value.indexOf(" ") > -1)
				{
					regForm.user.focus();
					return;
				} 
				regForm.grade.value = htmlEncode(regForm.grade.value);
				if(regForm.grade.value == "" || regForm.grade.value == "&ndash; 选择年级 &ndash;")
				{
					regForm.user.focus();
					return;
				} 
				regForm.sex.value = htmlEncode(regForm.sex.value);
				if(regForm.sex.value == "" || regForm.stuNumber.value == "&ndash; 选择性别 &ndash;")
				{
					regForm.user.focus();
					return;
				} 
				regForm.age.value = htmlEncode(regForm.age.value);
				if(regForm.age.value == "" || regForm.stuNumber.value.indexOf(" ") > -1)
				{
					regForm.user.focus();
					return;
				}
				if (regForm.age.value.match(/^[0-9].*$/))   
				{   
						
				}    
				else    
				{   
					alert("请填写数字！");
					return;
				}
				regForm.hobby.value = htmlEncode(regForm.hobby.value);
				if(regForm.hobby.value == "")
				{
					regForm.user.focus();
					return;
				}
				
				regForm.action = "<%=path%>/servlet/RegisterAction";
				regForm.submit();		
			}	
		</script>
	  </head>
	  
	  <body>
	  <div id="div1">
 			<img id="img1" src="">
		</div>
	       <div class="container">
			<div class="row clearfix">
			<div class="col-md-12 column">
				<div class="row clearfix">
					<div class="col-md-5 column" style="margin-top:-20px">
						<a href="RegisterPage.jsp"><img alt="140x140" src="png\logo.png" /></a>
					</div>
					<div class="col-md-7 column" style="margin-top:-3px">
					</div>
				</div>
				<div class="row"  style="margin-top:20px">
				<div class="eightcol last">
				<!-- Begin Form -->
	
	    <form id="my-form" action="" name="regForm" method="post" ENCTYPE="multipart/form-data">
	
	        <section name="第一步">
	          <div><label>学号:</label><input id="username" name="stuNumber" type="text"/></div>
	           <div><label>姓名:</label><input id="name" name="stuName" type="text"/></div>
	          <div><label>密码:</label><input id="pass" name="password" type="password"/></div>
	          <div><label>确认密码:</label><input id="pass" name="password2" type="password"/></div>
	          <div><label>性别:</label>
	          <select id="sex" name="sex">
	            <option value="default">&ndash; 选择性别 &ndash;</option>
	            <option value="男">男</option>
	            <option value="女">女</option>
	            </select>
	          </div>
	        </section>
	           
	        <section name="第二步">
	        <div><label>年龄:</label><input name="age" placeholder="请输入纯数字" data-ideal="text" type="text"></div>
	          
	          <div>
	            <label>专业:</label><input type="text" name="major"/>
	          </div>
	          <div><label>年级:</label>
	          <select id="grade" name="grade">
	            <option value="default">&ndash; 选择年级 &ndash;</option>
	            <option value="大一">大一</option>
	            <option value="大二">大二</option>
	            <option value="大三">大三</option>
	            <option value="大四">大四</option>
	          </select> 
	           <div><label>上传头像:</label><input name="head" type="file"/></div> 
	          <div><label>兴趣爱好:</label><input name="hobby" type="text"/></div>
	          </div>
	        </section>
	
	      <div><hr/></div>
	
	      <div>
	        <button type="submit" name="register" onclick="r()">提交</button>
	        <button id="submit" type="button" onclick="back()">返回</button>
	      </div>
	
	    </form>
	
	    <!-- End Form -->
	
	</div>
	<div class="row clearfix">
			<div class="col-md-12 column">
				<p style="text-align:center;margin-top:30px"> 
					Copyright Company 2016 Whu Iss LinkedIn .
				</p>
	      		</div>
		</div>
	</div>
	
	
	<script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
	<script type="text/javascript" src="js/jquery-ui.min.js"></script>
	<script type="text/javascript" src="js/jquery.idealforms.js"></script>
	<script type="text/javascript">
	var options = {
	
		onFail: function(){
			alert( $myform.getInvalid().length +' invalid fields.' )
		},
	
		inputs: {
			'password': {
				filters: 'required pass',
			},
			'stuName': {
				filters: 'required text',
				data: {
				//ajax: { url:'validate.php' }
				}
			},
			'password2': {
				filters: 'required pass',
			},
			'stuNumber': {
				filters: 'required text',
			},
			'file': {
				filters: 'extension',
				data: { extension: ['jpg'] }
			},
	        
		}
		
	};
	
	var $myform = $('#my-form').idealforms(options).data('idealforms');
	
	$('#reset').click(function(){
		$myform.reset().fresh().focusFirst()
	});
	
	
	</script>
	
	</div>
	</div>
	</div>
	</body>
	</html>
	
