<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=gbk"%>
<%@ page language="java" import="LinkedIn.Login.JavaBean.*" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	
	String stuNumber=(session.getAttribute("stuNumber")).toString();
	User user = new User();
	if((User)session.getAttribute("user")!=null)
	{
		user = (User)session.getAttribute("user");
	}
	if((User)session.getAttribute("new_User") !=null)
	{
		user=(User)session.getAttribute("new_User");
	}
	ArrayList<Blog> blogList=(ArrayList<Blog>)session.getAttribute("blogList");
%>

<!DOCTYPE html>

<html>
		<head>
		<meta charset="utf-8">
		<title>大学版领英网</title>
		<link rel="stylesheet" type="text/css" href="css/new.css" media="all"/>
		<link rel="stylesheet" href="css/bootstrap.min.css" />
		<link rel="stylesheet" href="css/zxbj_base.css?v=2818" />
		<link rel="stylesheet" href="css/jm0203.css" />
	    <link href="css/normalize.css" rel="stylesheet"/>
	    <link href="css/jquery-ui.css" rel="stylesheet"/>
	    <script src="js/jquery.min.js"></script>
	    <script src="js/jquery.js"></script>
	   <script src="js/bootstrap.min.js"></script>
<style>

		
.m-nav-ul .nav_li:nth-child(3) a.erji_a {
	color: #F66000;
}
.m-nav-ul .nav_li:nth-child(3) a.triangle {
	border-color: #F66000;
}
.m-top_user li a {
	box-sizing: content-box;
	-moz-box-sizing: content-box;
	-webkit-box-sizing: content-box;
}
.m-erjinav-ul {
	margin-top: 25px;
}
</style>
<script type="text/javascript">
	function htmlEncode ( str ) {  
		  var ele = document.createElement('span');  
		  ele.appendChild( document.createTextNode( str ) );  
		  return ele.innerHTML;  
		} 
	
	function out()
	{
		window.location.href="LoginPage.jsp";
		<%request.getSession().setAttribute("new_User", null);%>
	}
	
	function reply(){
		document.getElementById("main").style.opacity=0.3;
		document.getElementById("form").style.display="block";
	}
	
	function exit()
	{
		document.getElementById("main").style.opacity=1;
		document.getElementById("form").style.display="none";
	}
	
	function changeHead()
	{
		var changeForm = document.changeForm;
		changeForm.action = "<%=path%>/servlet/changeHeadAction?entry=modify";
		changeForm.submit();
	}
</script>
</head>

<body>
<div class="container" id="main">
<div class="row clearfix">
			<div class="col-md-12 column">
				<div class="row clearfix">
					<div class="col-md-2 column" style="margin-top:40px">
						<a href="homepage.jsp"><img alt="140x140" src="png\home.png" /></a>
					</div>
					<div class="col-md-4 column" style="margin-top:60px" >
						<p>欢迎光临,亲爱的<%=stuNumber%>,<a onclick="out()">退出</a></p>
					</div>
					<div class="col-md-6 column" style="margin-top:47px">
						<ul class="nav nav-tabs">
							<li>
								 <a href="homepage.jsp">首页</a>
							</li>
							<li class="active">
								 <a href="<%=path%>/servlet/ModifyAction">个人主页</a>
							</li>
							<li>
								 <a href="<%=path%>/servlet/FriendListAction">好友列表</a>
							</li>
							<li>
								 <a href="<%=path%>/servlet/BlogAction">好友动态</a>
							</li>
							<li>
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
<script type="text/javascript">
	function cancelChange()
	{
		document.getElementById("main").style.opacity=1;
		document.getElementById("form").style.display="none";
	}
	
	function modifyPass()
	{
		var passForm = document.passwordForm;
		passForm.old_pass.value = htmlEncode (passForm.old_pass.value) ;
		if(passForm.old_pass.value.indexOf(" ") > -1)
		{
			return;
		}
		if(passForm.old_pass.value == "" )
		{
			alert("请输入旧密码！");
			passForm.old_pass.focus();
			return;
		}
		passForm.new_pass.value = htmlEncode (passForm.new_pass.value) ;
		if(passForm.new_pass.value.indexOf(" ") > -1)
		{
			return;
		}
		if(passForm.new_pass.value == "")
		{
			alert("请输入新密码！");
			passForm.new_pass.focus();
			return;
		}
		passForm.check_pass.value = htmlEncode (passForm.check_pass.value) ;
		if(passForm.check_pass.value.indexOf(" ") > -1)
		{
			return;
		}
		if(passForm.check_pass.value == "")
		{
			alert("请再次输入新密码！");
			passForm.check_pass.focus();
			return;
		}
		if(passForm.new_pass.value == passForm.old_pass.value)
		{
			alert("新密码不能与原密码相同！");
			return;
		}
		if(passForm.new_pass.value != passForm.check_pass.value)
		{
			alert("两次输入的新密码不一致！");
			return;
		}
		passForm.action = "<%=path%>/servlet/modifyPassword";
		passForm.submit();
	}
	
	function modifyPerPro(){
		var perForm = document.perProForm;
		var sex = "<%=user.getSex()%>";
		var age = "<%= user.getAge()%>";
		var major = "<%= user.getMajor()%>";
		var grade = "<%=user.getGrade()%>";
		var hobby = "<%=user.getHobby()%>";
		perForm.info_sex.value = htmlEncode (perForm.info_sex.value) ;
		if(perForm.info_sex.value.indexOf(" ") > -1)
		{
			alert("性别不能包含空格！");
			return;
		}
		if(perForm.info_sex.value == "")
		{
			alert("性别不能为空！");
			return;
		}
		perForm.info_age.value = htmlEncode (perForm.info_age.value) ;
		if(perForm.info_age.value.indexOf(" ") > -1)
		{
			alert("年龄不能包含空格！");
			return;
		}
		if(perForm.info_age.value == "")
		{
			alert("年龄不能为空！");
			return;
		}
		if (perForm.info_age.value.match(/^[0-9].*$/))   
		{   
						
		}    
		else    
		{   
			alert("请填写数字！");
			return;
		} 
		perForm.info_major.value = htmlEncode (perForm.info_major.value) ;
		if(perForm.info_major.value.indexOf(" ") > -1)
		{
			alert("专业不能包含空格！");
			return;
		}
		if(perForm.info_major.value == "")
		{
			alert("专业不能为空！");
			return;
		}
		perForm.info_grade.value = htmlEncode (perForm.info_grade.value) ;
		if(perForm.info_grade.value.indexOf(" ") > -1)
		{
			alert("年级不能包含空格！");
			return;
		}
		if(perForm.info_grade.value == "")
		{
			alert("年级不能为空！");
			return;
		}
		perForm.info_hobby.value = htmlEncode (perForm.info_hobby.value) ;
		if(perForm.info_hobby.value == "")
		{
			alert("爱好不能为空！");
			return;
		}
		if(perForm.info_sex.value == sex && perForm.info_age.value == age && 
		perForm.info_major.value == major && perForm.info_grade.value == grade && 
		perForm.info_hobby.value == hobby)
		{
			alert("您没有对个人资料进行修改！");
			return;
		}
		perForm.action = "<%=path%>/servlet/modifyPerProAction";
		perForm.submit();
	}
</script>
<div class="row clearfix">
<div class="n_dispage_jm" style="margin-top:10px">
          <div class="n_dispage_jm_in resetEditStyle"> 
    
    <!--编辑区域-->
    
    <div class="baseStyle clearfix jm0203_j1" id="resume_body">
              <div class="divLeft clearfix" id="bar"> 
        
        <!--头像-->
        
        <div data-toggle="modal" data-target="#myModalHead" class="headDiv" id="resume_head"> <span class="headNotice">点击替换头像</span> <img class="resume_head" onclick="reply()" src="<%=user.getHeadPostrait() %>" height="200" /> </a></div>
        <div id="bar_sort"></div>
        
        <!--密码-->
        
        
      <div class="msgDiv positonDiv resume_add_area resume_sort" id="resume_msg">
          <div class="baseMobile baseMsg baseDel" id="resume_mobile">
          <input class="resume_msg baseBorder resume_lang_mobile"  readonly="readonly" value="帐号/学号：<%=stuNumber%>" />
          <input class="resume_msg baseBorder resume_lang_mobile"  readonly="readonly" value="        姓名：<%=user.getStuName() %>" />
          </div>
          <div class="tabbable" id="tabs-674067" style="margin-top:50px">
				<ul class="nav nav-tabs">
					<li class="active">
						<a href="#panel-705271" data-toggle="tab">修改个人资料</a>
					</li>
					<li>
						 <a href="#panel-748852" data-toggle="tab">修改密码</a>
					</li>
				</ul>
				<div class="tab-content">
				<div class="tab-pane  active" id="panel-705271">
						<form style="color:#FFFFFF" name="perProForm" method="post" action="">        
            			<div class="form_group">
            			<p>性别：<input class="form-control" name="info_sex" value="<%=user.getSex()%>" style="border:solid #FFFFFF"/></p>
            			</div>
            			<div class="form_group">
            			<p>年龄：<input class="form-control" name="info_age"  value="<%=user.getAge()%>" style="border:solid #FFFFFF"/></p>
            			</div>
            			<div class="form_group">
            			<p>专业：<input class="form-control" name="info_major" value="<%=user.getMajor()%>" style="border:solid #FFFFFF"/></p>
            			</div>
            			<div class="form_group">
            			<p>年级：<input class="form-control" name="info_grade" value="<%=user.getGrade() %>" style="border:solid #FFFFFF"/></p>
            			</div>
            			<div class="form_group">
            			<p>兴趣：<input class="form-control" name="info_hobby" value="<%=user.getHobby()%>" style="border:solid #FFFFFF"/></p>
            			</div>
          				<div style="margin-top:65px;margin-left:80px">
          				<button class="btn btn-default" onclick="modifyPerPro()">提交</button>
          				</div>
          				</form> 
					</div>
					<div class="tab-pane" id="panel-748852">
						<form style="color:#FFFFFF" name="passwordForm" method="post" action="">        
	            			<div class="form_group">
	            			<p>旧密码：<input class="form-control" name="old_pass"  style="border:solid #FFFFFF"/></p>
	            			</div>
	            			<div class="form_group">
	            			<p>新密码：<input class="form-control" name="new_pass"  style="border:solid #FFFFFF"/></p>
	            			</div>
	            			<div class="form_group">
	            			<p>确认密码：<input class="form-control" name="check_pass"  style="border:solid #FFFFFF"/></p>
	            			</div>
	          				<div style="margin-top:65px;margin-left:80px">
	          				<button class="btn btn-default" onclick="modifyPass()">提交</button>
	          				</div>
          				</form> 
					</div>
				</div>
             
          </div>            
</div>
                

      </div>
        

      <div class="divRight clearfix resume_main" id="foo"> 
        
        <!--标题-->
        
        <div class="nameDiv positonDiv" id="resume_name">
                  <h1>
            <div class="resume_msg baseBorder resume_notice resume_lang_name"  style="font-family:微软雅黑">
                                         我的动态 <small>分享生活的点点滴滴</small>
             </div>
          </h1>
        </div>
        
        <!--动态列表-->
        <%
		if(blogList!=null){
			for(int i=0;i<blogList.size();i++){
				Blog blog=blogList.get(i);
	 %>
        <div class="eduDiv baseItem positonDiv resume_item resume_add_area resume_sort resume_notice" style="margin-top:-70px">
            <dl>
            <dt> <span>
              <div class="resume_lang_edu">发布人：<%=blog.getStuNumber() %>
              &nbsp;&nbsp;&nbsp;时间：<%=blog.getTime() %></div>
              <div class="Border resume_line" for-id="edu" style="width:668px;border-top-style:solid;border-top-width:2px;"></div>
              </span> </dt>
            <dd class="resume_append_area">
                <div class="baseContent baseDel resume_item_items resume_delete_area">
                <div class="baseDel_ resume_delete_area_"> 
                 <div class="conDisc baseBorder baseDel resume_value" style="margin-top:-20px">
                    <p><%
	 					out.println(blog.getBlogText());
	 				%>
	 				<img src="<%=blog.getPictureUrl()%>" width="400" height="250">
	 					
	 				</p>
                  </div>
                        </div>
              </div>
                    </dd>
          <dl>
        </div>
        <%
	 					}
					    }
	 				 %>
        
      </div>
      </div>
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
<div class="modal-dialog" id="form" style="display:none;position:absolute;top:100px;;margin-left:400px;">
       <div class="modal-content">
       <div class="modal-header">
        <button aria-hidden="true" data-dismiss="modal" class="close" onclick="exit()" type="button">×</button>
       <h4 class="modal-title">修改头像</h4>
        </div>
       <div class="modal-body">

       <form name="changeForm" action="" method="post" class="form-horizontal" role="form" ENCTYPE="multipart/form-data">
	        <div class="form-group">
	        <div class="col-lg-10">
	         <input type="file" name="replyStuNumber"  class="form-control" id="inputEmail4"  value="" >
	     </div>
	        </div>
	        
	       
	       <div class="form-group">
	       <div class="col-lg-offset-2 col-lg-10">
	       		<button style="margin-left:25%;" onclick="changeHead()" type="submit" class="btn btn-primary" style="margin-top:5px;">确认更换</button>
	       		<button style="margin-left:5%;" onclick="cancelChange()" type="submit" class="btn btn-primary" style="margin-top:5px;">取消</button>
	       </div>
	       </div>
       </form>
       </div>
       </div>
       </div>
</body>
</html>