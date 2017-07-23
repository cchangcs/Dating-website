<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=gbk"%>
<%@ page language="java" import="LinkedIn.Login.JavaBean.*" %>
<!DOCTYPE html>

<html>
		<head>
		<meta charset="utf-8">
		<title>大学版领英网</title>		
		<link rel="stylesheet" type="text/css" href="css/style4.css" media="all"/>
		<link href="css/bootstrap.min.css" rel="stylesheet">
	    <script src="js/jquery.min.js"></script>
	    <script src="js/jquery.js"></script>
	   <script src="js/bootstrap.min.js"></script>

</head>
<%
		String path = request.getContextPath();
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

		String stuNumber=(request.getSession().getAttribute("stuNumber")).toString();
 %>
 <script type="text/javascript">
	function s()
	{ 
		var searchForm=document.search_form;
		searchForm.action="<%=path%>/servlet/SearchAction";
		searchForm.submit();
	} 	
	
	function add(obj)
	{
		var id=obj.id;		
		var form=document.getElementById("add"+id);
        form.action="<%=path%>/servlet/AddAction";
		form.submit();	

	}
	
	function delet(obj)
	{
		var id = obj.id;
		var form2 = document.getElementById("delete"+id);
		form2.action="<%=path%>/servlet/DeleteAction";
		form2.submit();
	}
	function out()
	{
		window.location.href="LoginPage.jsp";
		<%request.getSession().setAttribute("new_User", null);%>
	}
</script>

<body>
<div class="container">
<div class="row clearfix">
			<div style="font-size:15px;" class="col-md-12 column">
				<div class="row clearfix">
					<div class="col-md-2 column" style="margin-top:40px;">
						<a href="homepage.jsp"><img alt="140x140" src="png\home.png" /></a>
					</div>
					<div class="col-md-4 column" style="margin-top:75px" >
						<p>欢迎光临,亲爱的<%=stuNumber%>,<a style="cursor: pointer; " onclick="out()">退出</a></p>
					</div>
					<div class="col-md-6 column" style="margin-top:61px">
						<ul class="nav nav-tabs">
							<li>
								 <a href="homepage.jsp">首页</a>
							</li>
							<li>
								 <a href="<%=path%>/servlet/ModifyAction">个人主页</a>
							</li>
							<li class="active">
								 <a href="<%=path%>/servlet/FriendListAction">好友列表</a>
							</li>
							<li>
								 <a href="<%=path%>/servlet/BlogAction">好友动态</a>
							</li>
							<li >
								 <a href="<%=path%>/servlet/FrogAction">兴趣社区</a>
							</li>
	                         <li>
								 <a href="AboutUs.jsp">关于我们</a>
							</li>
						</ul>
					</div>
				</div>
		</div>
</div>

<div id="adver" style="margin-top:30px;">					 
    <img src="img/adver.jpg" alt="" style="width:100%;height:450px;margin-top:-47px;">
    <div class="center"></div>
    <div class="center copy">
    	<form id="123" name="search_form" class="form-horizontal" role="form" method="post" action="">
	        <input name="_search" type="text" class="search" placeholder="请输入用户学号或姓名">
	        <button class="button" onclick="s()">搜索好友</button>
	    </form>
	     <%
				User user2 = new User();
				List<User> list2 =(List<User>)session.getAttribute("search_list");
				if(list2==null)
				{
					
				}else{
					for(int i=0;i<list2.size();i++){
					user2=list2.get(i); 
				%>
					 <div  style="z-index:999;margin-top:80px;height:100px;">
                        <div>
                            <div >
                                <a href="#" class="pull-left">
                                    <img style="border-radius:300px;width:100px;height:100px;" class="thumb" src="<%=user2.getHeadPostrait()%>" alt=""/>
                                </a>
                                <div class="media-body">
                                    <h4 style="color:#ffffff;" class="media-heading"><%=user2.getStuName()%></h4>
                                    <span style="color:#ffffff;"><%=user2.getSex()%>,<%=user2.getAge() %>岁</span>
                                    <p style="color:#ffffff;">专业：<%=user2.getMajor() %> &nbsp;&nbsp;&nbsp;
                                                                                                        年级：<%=user2.getGrade() %></p>
                                    <p style="color:#ffffff;">学号：<%=user2.getStuNumber() %>&nbsp;&nbsp;&nbsp;
                                                                                                        兴趣：<%=user2.getHobby() %>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div >
                            <ul class="user-states" style="margin-top:-25px;">                               
                                <li style="margin-left:150px;">
                                    <i class="fa fa-user"></i> 	
							<button style="background:#4eb6b7;margin-left:3%;margin-top:8%;" class="btn btn-default btn-info" form="<%=user2.getStuNumber()%>" value="submit" id="<%=user2.getStuNumber()%>" type="button" onclick="add(this)">添加为好友</button>
							<form class="form-horizontal" action="" id="add<%=user2.getStuNumber()%>" method="post" style="display:none">
							<input type="hidden" name="addNumber" value="<%=user2.getStuNumber()%>"/>
							</form>
                                </li>
                            </ul>
                        </div>
                    </div>
				<%}} %>
    </div>
</div>
<div id="tour">
    <section class="center ">
        <h2 style="color:#333;"><font face="黑体">好友列表</font></h2>
        <p>您已添加的好友如下</p>
    </section>
    <%
				User user = new User();
				List<User> list = null;
				if(session.getAttribute("friendli") == null || ((List<User>)session.getAttribute("friendli")).get(0).getStuName().equals("test"))
				{
					
				}else{
				
					list =(List<User>)session.getAttribute("friendli");
					for(int i=0;i<list.size();i++){
					user=list.get(i); 
					if((i%2) == 0){
				%>
    	<figure>
					 <div class="panel">
                        <div class="panel-body">
                            <div class="media usr-info">
                                <a href="#" class="pull-left">
                                    <img style="border-radius:300px;width:100px;height:100px;" class="thumb" src="<%=user.getHeadPostrait() %>" alt=""/>
                                </a>
                                <div class="media-body">
                                    <h4 class="media-heading"><%=user.getStuName()%></h4>
                                    <span><%=user.getSex()%>,<%=user.getAge() %>岁</span>
                                    <p>专业：<%=user.getMajor() %> &nbsp;&nbsp;&nbsp;
                                                                                                        年级：<%=user.getGrade() %></p>
                                    <p>学号：<%=user.getStuNumber() %>&nbsp;&nbsp;&nbsp;
                                                                                                        兴趣：<%=user.getHobby() %>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="panel-footer custom-trq-footer">
                            <ul class="user-states" style="margin-top:-25px;">
                                <li style="float:left;margin-top:4%;">
                                <form name="form1" method="post" action="MessagesAction?action=loginRoom">
                                    <i class="fa fa-heart"></i> <button style="background:#4eb6b7" class="btn btn-default btn-info" type="submit" id="<%=user.getStuNumber()%>">聊天</button>
                                </form>
                                </li>                                
                                <li style="margin-left:65%;float:left;margin-top:4%;">
                                    <i class="fa fa-user"></i> <button style="background:#4eb6b7" class="btn btn-default btn-info" type="submit" onclick="delet(this)" id="<%=user.getStuNumber()%>">删除好友</button>
                					<form class="form-inline" action="" id="delete<%=user.getStuNumber()%>" method="post" style="display:none">
										<input type="hidden" name="deleteNumber" value="<%=user.getStuNumber()%>"/>
									</form>
                                </li>
                            </ul>
                        </div>
                    </div>
    </figure>
    <%}
    	if((i%2)  == 1)
    	{
     %>
    <figure style="margin-left:4.3%;">
         <div class="panel">
                        <div class="panel-body">
                            <div class="media usr-info">
                                <a href="#" class="pull-left">
                                    <img class="thumb" style="border-radius:300px;width:100px;height:100px;" src="<%=user.getHeadPostrait()%>" alt=""/>
                                </a>
                                <div class="media-body">
                                    <h4 class="media-heading"><%=user.getStuName()%></h4>
                                    <span><%=user.getSex()%>,<%=user.getAge() %>岁</span>
                                    <p>专业：<%=user.getMajor() %> &nbsp;&nbsp;&nbsp;
                                                                                                        年级：<%=user.getGrade() %></p>
                                    <p>学号：<%=user.getStuNumber() %>&nbsp;&nbsp;&nbsp;
                                                                                                        兴趣：<%=user.getHobby() %>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="panel-footer custom-trq-footer">
                            <ul class="user-states" style="margin-top:-25px;">
                                <li style="float:left;margin-top:4%;">
                                <form name="form1" method="post" action="MessagesAction?action=loginRoom">
                                    <i class="fa fa-heart"></i> <button style="background:#4eb6b7;" class="btn btn-default btn-info" type="submit" id="<%=user.getStuNumber()%>">聊天</button>
                                </form>
                                </li>                                
                                <li style="margin-left:65%;float:left;margin-top:4%;">
                                    <i class="fa fa-user"></i> <button style="background:#4eb6b7" class="btn btn-default btn-info" type="submit" onclick="delet(this)" id="<%=user.getStuNumber()%>">删除好友</button>
                					<form class="form-inline" action="" id="delete<%=user.getStuNumber()%>" method="post" style="display:none">
										<input type="hidden" name="deleteNumber" value="<%=user.getStuNumber()%>"/>
									</form>
                                </li>
                            </ul>
                        </div>
                    </div>
    </figure>
    <% }}} %>
</div>
<div class="row clearfix">
			<div class="col-md-12 column">
				<p style="text-align:center;margin-top:30px"> 
					Copyright Company 2016 Whu Iss LinkedIn .
				</p>
	      		</div>
		</div>
</div>
</body>
</html>