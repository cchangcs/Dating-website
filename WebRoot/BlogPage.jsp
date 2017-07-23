<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=gbk"%>
<%@ page language="java" import="LinkedIn.Login.JavaBean.*" %>
<%
		request.setCharacterEncoding("utf-8");
		String path = request.getContextPath();
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
		ArrayList<Blog> blogList=(ArrayList<Blog>)session.getAttribute("blogLists");
		String stuNumber=(request.getSession().getAttribute("stuNumber")).toString();
		User user=(User)session.getAttribute("user");
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
	    #div1{ width:700px; margin-left:50px;margin-top:-20px;}
		#div1 p{ float:left; margin:0;}
		#div1 input{  margin-top:10px; float:left;}
		#div1 textarea{ width:700px; height:100px;}
		#div1 a{ width:80px; height:50px; font-size:18px; margin-left:390px;  margin-top:150px;
		line-height:30px; text-align:center; color:#177cb0;}
		#div1 a.dis{color:#177cb0;}
		#con{ width:700px;  margin-top:60px; position:relative;  background-color:#FFFFFF; } 
		#con ul{ margin:10px; top:0; left:0; padding:0;} 
		#con ul li{ width:100%; padding:20px 0; overflow: } 
		#con ul li a{ float:left;margin-top:20px;margin-left:20px} 
		#con ul li span{ margin-top:0px;margin-left:0px} 
		#con ul li p.vright{ font-size:14px;margin-left:68px;line-height:1.5; padding:10px;}
		.blog {  margin-top:-30px;margin-left:80px;border-style:solid; border-width:3px; border-color:#4eb6b7;border-radius:25px 25px 25px 25px;}
 
		
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
		
		function pblsh(){
			var th=document.form1;
			th.blogtext.value = htmlEncode(th.blogtext.value);
			if(th.blogtext.value==""){
				alert("博客内容不能为空！");
				th.blogtext.focus();
				return;
			}
			th.action="<%=path%>/PublishServlet";
			th.submit();
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
		changeForm.action = "<%=path%>/servlet/changeHeadAction?entry=blog";
		changeForm.submit();
	}
	
	function cancelChange()
	{
		document.getElementById("main").style.opacity=1;
		document.getElementById("form").style.display="none";
	}
</script>
<script>  
	window.onload=function(){
		var odiv=document.getElementById('div1');
		var op=odiv.getElementsByTagName('p')[0];
		var ot=odiv.getElementsByTagName('textarea')[0];
		var oa=odiv.getElementsByTagName('a')[0];
		var ie=!-[1,];//判断是否为ie浏览器
		var bbtn=true;
		var timer=null;
		var nnn=0;
		ot.onfocus=function(){
			if(bbtn){
				op.innerHTML='发言请遵守社区公约，还可以输入 <span> 140 </span> 字';
				bbtn=false;
			 }
		};
		ot.onblur=function(){
			if(ot.value==''){
				op.innerHTML='郑爽公开承认和张翰恋情，网友送祝福　热门微博';
				bbtn=true;
			}
		};
		if(ie){
			ot.onpropertychange=toChange;
		}else{
			ot.oninput=toChange;
		}
		function getLength(str){
			return String(str).replace(/[^\x00-\xff]/g,'aa').length;
		}
		function toChange(){
			var num=Math.ceil(getLength(ot.value)/2);
			var oSpan=odiv.getElementsByTagName('span')[0];
			if(num <=140){
				oSpan.innerHTML=140-num;
				oSpan.style.color='';
			}else{
				oSpan.innerHTML=140-num;
				oSpan.style.color='red';		
	    }
		if(ot.value==''||num>140){
			oa.className='dis';
		}else{
	        oa.className='';
	    }}	
		oa.onclick=function(){		
	    	if(this.className=='dis'){
				clearInterval(timer);
				timer=setInterval(function(){
					 if(nnn==5){
						 clearInterval(timer);
						 nnn=0;
						}else{
						 nnn++;
						 }
					if(nnn%2){
						ot.style.background='red';	
					}else{
						ot.style.background='';
					}},100);		
	     	}
	     	else{	
	     		alert('发布成功');
	     	}
	   }
	};
	function out()
	{
		window.location.href="LoginPage.jsp";
		<%request.getSession().setAttribute("new_User", null);%>
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
							<li>
								 <a href="<%=path%>/servlet/ModifyAction">个人主页</a>
							</li>
							<li>
								 <a href="<%=path%>/servlet/FriendListAction">好友列表</a>
							</li>
							<li class="active">
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
<div class="row clearfix">
<div class="n_dispage_jm" style="margin-top:10px">
          <div class="n_dispage_jm_in resetEditStyle"> 
    
    <!--编辑区域-->
    
    <div class="baseStyle clearfix jm0203_j1" id="resume_body">
              <div class="divLeft clearfix" id="bar"> 
        
        <!--头像-->
        
        <div data-toggle="modal" data-target="#myModalHead" class="headDiv" id="resume_head"> <span class="headNotice">点击替换头像</span> <a onclick="reply()"><img class="resume_head" src="<%=user.getHeadPostrait() %>" height="200" /></a> </div>
        <div id="bar_sort"></div>
        
        <!--密码-->
        
        
      <div class="msgDiv positonDiv resume_add_area resume_sort" id="resume_msg">
          <div class="baseMobile baseMsg baseDel" id="resume_mobile">
          <input class="resume_msg baseBorder resume_lang_mobile"  readonly="readonly" value="帐号/学号：<%=stuNumber%>" />
          <input class="resume_msg baseBorder resume_lang_mobile"  readonly="readonly" value="        姓名：<%=user.getStuName() %>" />
          </div>
      </div>
                

      </div>
        

      <div class="divRight clearfix resume_main" id="foo"> 
        
        <!--标题-->
        
        <div class="nameDiv positonDiv" id="resume_name">
                  <h1>
            <div class="resume_msg baseBorder resume_notice resume_lang_name"  style="font-family:微软雅黑">
                                         分享动态 <small>随时随地发现新鲜事</small>
             </div>
          </h1>
        </div>
        
        <!--动态列表-->
       <div id= "div1">  
				    <p> 河北暴雨橙色预警　热门微博 </p> 
				    <form action="" name="form1" method="post" ENCTYPE="multipart/form-data" >
					    <textarea name="blogtext" class="form-control"></textarea> 
						<input style="margin-left:50px;background-color:#4eb6b7;color:#fff;margin-top:10px;" class="btn btn-default btn-info" type="button" id="file" value="加载图片 " onclick="path.click()" >  
						<input type="file" name="load" id="path" style="display:none" onchange="upfile.value=this.value">
						<input style="margin-top:12px;height:32px;" type="text"  name="upfile" id="upfile" >  
					    <button class="btn btn-default btn-info" style="background-color:#4eb6b7;color:#fff;margin-left:210px;margin-top:10px;" type="button" name="publish" onclick="pblsh()">发表</button>
				    </form>
				</div> 
        
        <div  id="con">
				<ul> 
				 <%
					if(blogList!=null){
						for(int i=0;i<blogList.size();i++){
							Blog blog=blogList.get(i);
				 %>
				<li> 
				<div class="blog">
				<img style="margin-top:2%;margin-left:2%" src="http://tp3.sinaimg.cn/1696357270/50/1282628065/1" />
				<p class="vright">
				<%out.println(blog.getBlogText());%><br>
	 			<img src="<%=blog.getPictureUrl()%>" width="400" height="250">
	 			 </p> <p style="margin-left:250px;font-size:12px;color:#616161;">发布人：<%= blog.getStuNumber()%>&nbsp;&nbsp;时间：<%=blog.getTime()%></p>
				</div>
				</li> 
				<%
				 }
				 }
				 %>
				</ul> 
				</div>
				
				
			</div>
        
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