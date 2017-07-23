<%@page import="LinkedIn.Login.JavaBean.Frog"%>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String stuNumber=(session.getAttribute("stuNumber")).toString();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
	<html>
	  <head>
	    <base href="<%=basePath%>">
	    
	   <title>大学版领英网</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">    
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<meta charset="utf-8">

	   <link href="css/bootstrap.css" rel="stylesheet">
	   <script src="js/jquery.js"></script>
	    <script src="js/bootstrap.js"></script>
	    <link href="css/table.css" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="css/normalize.css" />
		<link rel="stylesheet" type="text/css" href="css/demo.css" />
		<link rel="stylesheet" type="text/css" href="css/component.css" /> 
		<link rel="stylesheet" type="text/css" href="css/form_style2.css" /> 
		<script src="js/modernizr.custom.js"></script>
	   
	
	<style type="text/css">
	body{font:normal 15px/1.5 Arial, Helvetica, Free Sans, sans-serif;color: #222;background:#EAEAAE;overflow-y:scroll;padding:60px 0 0 0;}
	</style>
	<script>
		function LoginOut()
		{
			window.location.href = "<%=path%>/ForumPage.jsp";
		}
		
		function htmlEncode ( str ) {  
		  var ele = document.createElement('span');  
		  ele.appendChild( document.createTextNode( str ) );  
		  return ele.innerHTML;  
		}
		
		function send()
		{
			var sendForm = document.sendForm;
			sendForm.frogTitle.value = htmlEncode(sendForm.frogTitle.value);
			sendForm.frogContent.value = htmlEncode(sendForm.frogContent.value);
			if(sendForm.frogTitle.value==""){
				alert("话题标题不能为空！");
				sendForm.frogTitle.focus();
				return;
			}
			if(sendForm.frogContent.value==""){
				alert("话题内容不能为空！");
				sendForm.frogContent.focus();
				return;
			}
			sendForm.action="<%=path%>/servlet/AddForgAction";
			sendForm.submit();
		}
		function out()
		{
			window.location.href="LoginPage.jsp";
			<%request.getSession().setAttribute("new_User", null);%>
		}
	</script>
	
	  </head>
	  
	  <body>
	       <div class="container">
			<div class="row clearfix">
			<div class="col-md-12 column">
				<div class="row clearfix">
					<div class="col-md-2 column" style="margin-top:-20px">
						<a href="homepage.jsp"><img alt="140x140" src="png\home.png" /></a>
					</div>
					<div class="col-md-4 column" style="margin-top:0px">
						<p>欢迎光临,亲爱的<%=stuNumber%>,<a style="cursor: pointer; " onclick="out()">退出</a></p>
					</div>
					<div class="col-md-6 column" style="margin-top:-15px">
						<ul class="nav nav-tabs">
							<li>
								 <a href="homepage.jsp">首页</a>
							</li>
							<li>
								 <a href="<%=path%>/servlet/ModifyAction">个人主页</a>
							</li>
							<li>
								 <a href="<%=path%>/servlet/FriendListAction">好友列表</a>
							</li>
							<li>
								 <a href="<%=path%>/servlet/BlogAction">好友动态</a>
							</li>
							<li class="active">
								 <a href="<%=path%>/servlet/FrogAction">兴趣社区</a>
							</li>
	                         <li>
								 <a href="AboutUs.jsp">关于我们</a>
							</li>
						</ul>
					</div>
				</div>
        <div class="container">
			<section class="grid3d vertical" id="grid3d">
				<div class="grid-wrap">
					<div class="grid">
						<figure style="margin-top:30px;"><img src="images/6.jpg" alt="img01"/><h2 style="margin-top:-150px;color:#242424;">兴趣社区</h2></figure>
						<figure style="margin-top:30px;"><img src="images/5.jpg" alt="img05"/><h2 style="margin-top:-150px;color:#5CACEE;">专业社区</h2></figure>
						<figure style="margin-top:30px;"><img src="images/8.jpg" alt="img08"/><h2 style="margin-top:-150px;color:#EE2C2C;">发布话题</h2></figure>
					</div>
				</div><!-- /grid-wrap -->
				<div class="content">	
                     <div class="row clearfix">
							<div class="col-md-12 column">
				<h2>兴趣爱好社区</h2>
		<table class="zebra" id="mytable">
		    <thead>
		    <tr>
		        <th>话题号</th>        
		        <th>话题标题</th>
		        <th>发布时间</th>
		        <th>发布人</th>
		    </tr>
		    </thead>   
		     <%
				Frog insterestFrog = new Frog();
				List<Frog> list =(ArrayList<Frog>)session.getAttribute("frogInterestLists");
				if(list==null)
				{
					System.out.println("dads");
				}else{
					for(int i=0;i<list.size();i++){
					insterestFrog = list.get(i); 
				%>
		    <tr>
		        <td><%=insterestFrog.getFrogNumber() %></td>        
		        <td><a href="<%=path%>/servlet/FrogDetailAction?frogNumber=<%=insterestFrog.getFrogNumber() %>"><%=insterestFrog.getForgTitle() %></a></td>
		        <td><%=insterestFrog.getFrogDate() %></td>
		        <td><%=insterestFrog.getStuNumber() %></td>
		    </tr> 
		    <%}} %>       
		  
		    
		</table>
</div>
</div>					
		<div class="row clearfix">
							<div class="col-md-12 column">
				<h2>专业知识社区</h2>
		<table class="zebra" id="mytable">
		    <thead>
		    <tr>
		        <th>话题号</th>        
		        <th>话题标题</th>
		        <th>发布时间</th>
		        <th>发布人</th>
		    </tr>
		    </thead>   
		    <%
				Frog majorFrog = new Frog();
				List<Frog> list2=(ArrayList<Frog>)session.getAttribute("frogMajorLists");
				if(list2==null)
				{
					System.out.println("dads");
				}else{
					for(int i=0;i<list2.size();i++){
					majorFrog = list2.get(i); 
				%>
		    <tr>
		        <td><%=majorFrog.getFrogNumber() %></td>        
		        <td><a href="<%=path%>/servlet/FrogDetailAction?frogNumber=<%=majorFrog.getFrogNumber() %>"><%=majorFrog.getForgTitle() %></a></td>
		        <td><%=majorFrog.getFrogDate() %></td>
		        <td><%=majorFrog.getStuNumber() %></td>
		    </tr> 
		    <%}} %>       
		   
		    
		</table>
</div>
</div>	
		<div class="row clearfix">
			<div class="col-md-12 column">
		     <form name="sendForm" action="" method="post" class="smart-green">
				<h1>话题发布框
				<span>请填写下面所有内容</span>
				</h1>
				<label>
				<span>话题表题 :</span>
				<input id="name" type="text" name="frogTitle" placeholder="请填写话题标题" />
				</label>
				<label>
				<span>话题内容:</span>
				<textarea id="message" name="frogContent" placeholder="请填写话题内容"></textarea>
				</label>
				<label>
				<span>选择话题类型</span><select name="type">
				<option value="default">-默认选择-</option>
				<option value="Interests and hobbies">兴趣爱好</option>
				<option value="Professional knowledge resources">专业知识</option>
				</select>
				</label>
				<label>
				<span>&nbsp;</span>
					<input type="button" onclick="send()" style="margin-top:30px;width:70px;height:40px;background:#99cc66;color:#ffffff;" class="btn btn-default" value="发送" />
				<input type="button" onclick="LoginOut()" style="margin-top:30px;margin-left:50px;width:70px;height:40px;background:#99cc66;color:#ffffff;" class="btn btn-default btn-info" value="取消" />
				</label>
			</form>		     
		</div>
		</div>			
					<span class="loading"></span>
					<span class="icon close-content"></span>
				</div>
			</section>
		</div>		
</div>
</div>
				
	        <div class="row clearfix">
			<div class="col-md-12 column">
				<p style="text-align:center;margin-top:30px"> 
					Copyright Company 2016 Whu Iss LinkedIn .
				</p>
	      		</div>
		</div>
	</div>
	
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/main.js"></script>
<script src="js/classie.js"></script>
		<script src="js/helper.js"></script>
		<script src="js/grid3d.js"></script>
		<script>
			new grid3D( document.getElementById( 'grid3d' ));
		</script>
	</body>
	</html>