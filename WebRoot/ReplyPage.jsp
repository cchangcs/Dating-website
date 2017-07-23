<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=gbk"%>
<%@ page language="java" import="LinkedIn.Login.JavaBean.*" %>
<%
request.setCharacterEncoding("utf-8");
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String stuNumber=(request.getSession().getAttribute("stuNumber")).toString();
User user = new User();
if((User)session.getAttribute("user")!=null)
{
	user = (User)session.getAttribute("user");
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

	   <link href="css/bootstrap.css" rel="stylesheet">
	   <script src="js/jquery.js"></script>
	    <script src="js/bootstrap.js"></script>
	  <link href="css/style3.css" rel="stylesheet">
  <link href="css/style-responsive.css" rel="stylesheet">
	   
	
	<style type="text/css">
	body{font:normal 15px/1.5 Arial, Helvetica, Free Sans, sans-serif;color: #222;background:#EAEAAE;overflow-y:scroll;padding:60px 0 0 0;}
	</style>
	<SCRIPT LANGUAGE="JavaScript">
	function reply(){
		document.getElementById("main").style.opacity=0.3;
		document.getElementById("form").style.display="block";
	}
	
	function exit()
	{
		document.getElementById("main").style.opacity=1;
		document.getElementById("form").style.display="none";
	}
	
	function LoginOut()
	{
		window.location.href = "<%=path%>/ForumPage.jsp";
	}
	
	function htmlEncode ( str ) {  
			  var ele = document.createElement('span');  
			  ele.appendChild( document.createTextNode( str ) );  
			  return ele.innerHTML;  
			}
			
	function publishForg()
	{
		var publishForm = document.publishForm;
		publishForm.replyTextArea.value = htmlEncode(publishForm.replyTextArea.value);
		publishForm.action="<%=path%>/servlet/AddReplyAction";
		publishForm.submit();
	}
	</script>
	  </head>
	  
	  <body>
	       <div class="container" id="main">
			<div class="row clearfix">
			<div class="col-md-12 column">
				
			
			<div class="row clearfix" style="margin-top:5px;">
		    <div class="col-md-3 column">
		    <div style="margin-left:50%;margin-top:-5%;" data-toggle="modal" data-target="#myModalHead" class="headDiv" id="resume_head"> <img class="resume_head" src="<%=user.getHeadPostrait()%>" width="100" height="140" /> </div>
        	<div style="margin-left:40%;margin-top:5%;" id="bar_sort">账号：<%=session.getAttribute("stuNumber") %>
        		姓名：<%=user.getStuName() %>
        	</div>
		    </div>
		    <div class="col-md-8 column">
		    <%
				Frog replyFrog = new Frog();
				replyFrog =(Frog) session.getAttribute("searchFrog");
				if(replyFrog==null)
				{
					System.out.println("dads");
				}else{
				%>
			<h3 class="text-left">
				回复话题：<%=replyFrog.getForgTitle() %>
			</h3>
			<small>发表时间：<%=replyFrog.getFrogDate() %>   回复人数：<%=replyFrog.getReplyCount() %></small>
			<p class="text-left" style="margin-top:10px;">
				 内容：<%=replyFrog.getFrogContent() %>
			</p>
				<%} %>
				<div>
					<input type="button" class="btn btn-default" style="margin-left:600px;" onclick="reply()" value="回复"/>
					<input type="button" class="btn btn-default" style="margin-left:660px;margin-top:-34px;" onclick="LoginOut()" value="退出"/>
				
					
				</div>
	
		    </div>
		    <hr style="width:700px;align:center;margin-top:100px;">
		    <div class="row clearfix" style="margin-top:5px;">
		    <div class="col-md-1 column">
		    </div>
		    <div class="col-md-10 column">
		    <table class="table" style="layout:fixed;background:#EAEAAE">
                            <tbody>
                             <%
								FrogReply frogReply = new FrogReply();
								List<FrogReply> list2=(ArrayList<FrogReply>)session.getAttribute("replyList");
								if(list2==null)
								{
									System.out.println("空");
								}else{
									for(int i=0;i<list2.size();i++){
									frogReply = list2.get(i); 
							%>
                            <tr>
                                <td><%=frogReply.getFrogNumber() %></td>
                                <td><%=frogReply.getStuNumber() %></td>
                                <td style="word-break:break-all;">
                                <p><%=frogReply.getReplyContent() %></p>
                                </td>
                                <td style="white-space: nowrap;"><%=frogReply.getReplyDate() %></td>
                            </tr>
                            <%}} %>
                            </tbody>
                        </table>
                        </div>
                        </div>
	</div>
	</div>
	</div>							
	</div>
   
    	 
	<div class="modal-dialog" id="form" style="display:none;position:absolute;top:100px;;margin-left:400px;">
       <div class="modal-content">
       <div class="modal-header">
        <button aria-hidden="true" data-dismiss="modal" class="close" onclick="exit()" type="button">×</button>
       <h4 class="modal-title">评论发布框</h4>
        </div>
       <div class="modal-body">

       <form name="publishForm" action="" method="post" class="form-horizontal" role="form">
	        <div class="form-group">
	       <label for="inputEmail1" class="col-lg-2 col-sm-2 control-label">学号：</label>
	        <div class="col-lg-10">
	         <input name="replyStuNumber"  class="form-control" id="inputEmail4" placeholder="学号" value="<%=stuNumber%>" readonly="readonly">
	     </div>
	        </div>
	         <div class="form-group">
	         <label for="inputComment" class="col-lg-2 col-sm-2 control-label">评论：</label>
	         <div class="col-lg-10">
	          <textArea name="replyTextArea" class="form-control" style="height:100px;"></textArea>
	       </div>
	           </div>
	       <div class="form-group">
	       <div class="col-lg-offset-2 col-lg-10">
	       		<button onclick="publishForg()" type="submit" class="btn btn-primary" style="margin-top:5px;">发布</button>
	       </div>
	       </div>
       </form>
       </div>
       </div>
       </div>
   
	</body>
	</html>