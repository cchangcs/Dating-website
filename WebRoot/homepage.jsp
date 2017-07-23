	<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=gbk"%>
	<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String stuNumber = "";
	if((session.getAttribute("stuNumber")) != null){
		stuNumber=(session.getAttribute("stuNumber")).toString();
	}
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
      	<link href="css/body.css" rel="stylesheet">
	   	<link href="css/bootstrap.css" rel="stylesheet">
	   	<script src="js/jquery.js"></script>
	    <script src="js/bootstrap.js"></script>
		<link href="css/style5.css" rel="stylesheet" type="text/css"  media="all" />	
		<link rel="stylesheet" href="css/responsiveslides.css">
		<script src="js/jquery2.min.js"></script>
		<script src="js/responsiveslides.min.js"></script>
		  <script>
		    // You can also use "$(window).load(function() {"
			    $(function () {
			      // Slideshow 1
			      $("#slider1").responsiveSlides({
			        maxwidth: 2500,
			        speed: 600
			      });
			});
		  </script>
	   
	
	<style type="text/css">
	body{font:normal 15px/1.5 Arial, Helvetica, Free Sans, sans-serif;color: #222;background:url(pattern.png);overflow-y:scroll;padding:60px 0 0 0;}
	
	</style>
	
	<script type="text/javascript">
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
					<div class="col-md-4 column" style="margin-top:15px">
						<p>欢迎光临,亲爱的<%=stuNumber%>,<a style="cursor: pointer; " onclick="out()">退出</a></p>
					</div>
					<div class="col-md-6 column" style="margin-top:0px">
						<ul class="nav nav-tabs">
							<li class="active">
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
		<!--start-image-slider---->
		<div class="image-slider" style="margin-top:60px;">
						<!-- Slideshow 1 -->
					    <ul class="rslides" id="slider1">
					      <li><img src="images/slider4.jpg" alt=""></li>
					      <li><img src="images/slider2.jpg" alt=""></li>
					      <li><img src="images/slider3.jpg" alt=""></li>
					       <li><img src="images/slider1.jpg" alt=""></li>
						   </ul>
						 <!-- Slideshow 2 -->
					</div>
			<!--End-image-slider---->
		<!---End-wrap---->
		<div class="clear"> </div>
		<!---start-content---->
		<div class="content">
			    <div class="content_top">
			    	<div class="wrap">
						<h1><a href="homepage.jsp">欢迎来到</a></h1>
						<p>LinkedIn是致力于全球职场人士提供交流的平台，并协助他们的工作事半功倍，发挥董事。加入后，您可以浏览会员信息，在招聘职位、行业新闻、联系人等相关信息，对您的专业技能有所帮助。 </p>
					
					</div>
			    </div>
			<div class="content-grids">
				<div class="wrap">
				 <div class="grid">
					<a href="#"><img src="images/grids-img3.jpg" title="image-name" /></a>
					<h3>友谊</h3>
					<p>你从世界的各个角落来到武汉大学，相遇是一种缘分，也许我们只会在一起生活几年，但我们应该珍惜每一份友谊，无论它是否已经过去，也不管将来会如何，总之，友谊会长存，我们在武大的每一天，我们所经历的每一刻，都将成为我们青春记忆里最鲜活的颜色，青春不朽，友谊长存！</p>
					<a class="button" href="<%=path%>/servlet/FriendListAction">更多</a>
				</div>
				<div class="grid">
					<a href="<%=path%>/servlet/BlogAction"><img src="images/grids-img2.jpg" title="image-name" /></a>
					<h3>快乐</h3>
					<p>丰富多彩的大学生活，是年老时我们回忆中的亮色。ISS的LinkedIn，给你一个地方来分享你的快乐与你的朋友或减少担心，它会在你我生活中不可或缺的一部分，它会承载你的不开心，让你变得快乐，也会记录你每时每刻的快乐，让你在日后回忆之时，可以浅浅一笑，延续以往的快乐!</p>
					<a class="button" href="#">更多</a>
				</div>
				<div class="grid last-grid">
					<a href="#"><img src="images/grids-img1.jpg" title="image-name" /></a>
					<h3>分享 & 发现</h3>
					<p>如果你有什么需要倾诉，如果不把它写下来，它就会随着时间的推移被岁月所掩埋，成为我们再无法触碰的东西。世界这么大，我想去发现点什么，我们终将离开这个美丽的世界，如果不能在我们还未离开之前去尽力看看，那该多遗憾啊，所以，请不要带着遗憾离开这个世界，去看看世界吧!</p>
					<a class="button" href="<%=path%>/servlet/FrogAction">更多</a>
				</div>
				
				<div class="clear"> </div>
			</div>
		 </div>
			<div class="specials">
				<div class="wrap">
					<div class="specials-heading">
						<h3>希望你能</h3>
					</div>
					<div class="specials-grids">
						<div class="special-grid">
							<img src="images/grids-img3.jpg" title="image-name" />
							<a>交到朋友</a>
							<p>莫愁前路无知己，天下谁人不识君。真正的好朋友，应该在你得意的时候，只有邀请才来，在你失意的时候，会不请自来。</p>
						</div>
						<div class="special-grid">
							<img src="images/grids-img2.jpg" title="image-name" />
							<a>分享感受</a>
							<p>我们必须与其它生命共同分享我们的地球。分享是一种神奇的东西，它使快乐增大，它使悲伤减小，感受需要分享。 </p>
						</div>
						<div class="special-grid spe-grid">
							<img src="images/grids-img1.jpg" title="image-name" />
							<a>发现世界</a>
							<p>站在杏树下，让洁白柔顺的花瓣扑打面庞，是一件浪漫的事。当真正领悟到那中美，你会发现：圣洁的白色没有选错主人，让杏花来支配自己，只会显得更温柔、更妩媚。</p>
						</div>
						
						<div class="clear"> </div>
					</div>
			    </div>
			</div>	
			
		</div>
		<!---End-content---->
		<div class="clear"> </div>
		<!---start-footer---->
		
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