<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" %>
<% request.setCharacterEncoding("gbk"); 
int maxTime=50*60*1000;		//设置5分钟不说话，将其踢出聊天室
%>
<html>
<head>
<script src="js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/style.css" media="screen" type="text/css" />
    <script src='js/jquery.js'></script>
    <link href="css/bootstrap.min.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>LinkedIn对话框</title>

<script language="javascript" src="js/AjaxRequest.js"></script>
<script language="javascript">
window.setInterval("showContent();",1000); 
window.setInterval("showOnline();",10000); 
var sysBBS="<span style='font-size:14px; line-height:30px;'></span><br><span style='line-height:22px;'>";
//此处需要加?nocache="+new Date().getTime()，否则将出现在线人员列表不更新的情况
function showOnline(){
	var loader=new net.AjaxRequest("online.jsp?nocache="+new Date().getTime(),deal_online,onerror,"GET");
}
function showContent(){
	var loader1=new net.AjaxRequest("MessagesAction?action=getMessages&nocache="+new Date().getTime(),deal_content,onerror,"GET");
}
function onerror(){
	window.opener=null;
	window.close();
}
function deal_online(){
	online.innerHTML=this.req.responseText;
}
function deal_content(){
	var returnValue=this.req.responseText;		//获取Ajax处理页的返回值
	var h=returnValue.replace(/\s/g,"");	//去除字符串中的Unicode空白符
	if(h=="error"){
		//alert("您的账户已经过期，请重新登录！");
		Exit();
	}else{
		content.innerHTML=sysBBS+returnValue+"</span>";
	}
}
//控制是否滚屏
function checkScrollScreen(){
	if(!form1.scrollScreen.checked){
		document.getElementById("content").style.overflow='auto';
		//document.getElementById('content').scrollTop = document.getElementById('content').scrollHeight*2;
		//setTimeout('checkScrollScreen()',500);
	}else{
		document.getElementById("content").style.overflow='auto';
		document.getElementById('content').scrollTop = document.getElementById('content').scrollHeight*2;	//当聊天信息超过一屏时，设置最先发送的聊天信息不显示
	}
	setTimeout('checkScrollScreen()',500);
}
window.onload=function(){
	checkScrollScreen();				//当页面载入后控制是否滚屏
	showContent();						//当页面载入后显示聊天内容
	showOnline();						//当页面载入后显示在线人员列表
}
</script>
<script language="javascript">
<!--
	function send(){	//验证聊天信息并发送
		if(form1.to.value==""){
			alert("请选择聊天对象！");return false;
		}
		if(form1.content1.value==""){
			alert("发送信息不可以为空！");form1.content1.focus();return false;
		}
		if(form1.isPrivate.checked){
			isPrivate="true";
		}else{
			isPrivate="false";
		}
		var param="from="+form1.from.value+"&face="+form1.face.value+"&color="+form1.color.value+"&to="+form1.to.value+"&content="+	form1.content1.value+"&isPrivate="+isPrivate; 
		var loader=new net.AjaxRequest("MessagesAction?action=sendMessage",deal_send,onerror,"POST",param);

	}
function deal_send(){
content.innerHTML=sysBBS+this.req.responseText+"</span>";
	if(form1.scrollScreen.checked){
		document.getElementById('content').scrollTop = document.getElementById('content').scrollHeight*2;	//当聊天信息超过一屏时，设置最先发送的聊天信息不显示
	}
	//重新计时
	clearTimeout(timer);
	timer = window.setTimeout("Exit()",<%=maxTime%>); 
	form1.content1.value="";
}	
	function Exit(){
		window.location.href="FriendList.jsp";
	}
-->
</script>
<script language="javascript">
function set(selectPerson){	//自动添加聊天对象
	if(selectPerson!="<%=session.getAttribute("username")%>"){
		if(form1.isPrivate.checked && selectPerson=="正在聊天"){
			alert("请选择私聊对象！");
		}else{
			form1.to.value=selectPerson;
		}
	}else{
		alert("请重新选择聊天对象！");
	}
}
function checkIsPrivate(){
	if(form1.isPrivate.checked){
		if(form1.to.value=="正在聊天"){	
			alert("请选择私聊对象！");
			form1.to.value="";
		}
		
	}	
}
</script>
<script language="jscript"> 
timer = window.setTimeout("Exit()",<%=maxTime%>); 		//用于当用户长时间不说话时，将其踢出聊天室

window.onbeforeunload=function(){   //当用户单击浏览器中的“关闭”按钮时，执行退出操作
	if(event.clientY<0 && event.clientX>document.body.scrollWidth){  
	 	Exit();		//执行退出操作
	}   
}   
</script> 
</head>
<body>
<div style="float:left;color:#97FFFF;font-size:50px;font-family:黑体;margin-left:35%;margin-top:100px;">
LinkedIn对话框
</div>
<p  style="cursor: pointer; margin-left:420px;float:left;color:#97FFFF;font-size:40px;" onClick="Exit()">X
</p>
<table>
  <tr>
    <td  id="online" style="display:none;padding:5px">在线人员列表</td>
    <td  valign="top"  style="padding:5px; ">
	</td>

  </tr>
</table>
<div id="convo" data-from="Sonu Joshi">  
<div class="row clearfix">
<div class="col-md-12 column">
<ul class="chat-thread" id="chatbox">
	<!-- <li class="send"><div  id="content">聊天内容</div></li> -->
	<div style="color:#9AC0CD;" id="content">聊天内容</div>
</ul>


<form action="" name="form1" method="post" >
<div class="col-md-8 column">
<textarea id="text" class="form-control" placeholder="请输入聊天内容" style="margin-top:20px;margin-left:333px;width:600px;
         height:54px;word-wrap: break-all;" name="content1"  size="70" onKeyDown="if(event.keyCode==13 && event.ctrlKey){send();}"></textarea> 
</div>

<table  border="0" align="center" cellpadding="0" cellspacing="0" >
  <tr>
    <td ></td>
    <td >
    <input name="from" style="display:none;" value="<%=session.getAttribute("username")%>">
     <input style="display:none;" name="to" type="text" value="正在聊天" readonly="readonly">

<select style="display:none;" name="face" class="wenbenkuang">
</select>
<input type="hidden" name="isPrivate" type="checkbox" class="noborder" id="isPrivate" value="true" onClick="checkIsPrivate()">
<input type="hidden" name="scrollScreen" type="checkbox" class="noborder" id="scrollScreen" onClick="checkScrollScreen()" value="1" checked></td>
    <td>
      <select style="display:none;" name="color" size="1" class="wenbenkuang" id="select">
        <option selected></option>
      </select></td>
  </tr>
  <tr>
    <td >
     <button type="button" class="btn btn-primary btn-info" style="margin-left:-170px;margin-top:20px;
        height:54px;width:80px" name="Submit2" class="btn_blank" value="发送(Ctrl+Enter)" onClick="send()">发送</button> </td>
  
  </tr>


</table>
</form>
</div>
</div>
</div>

<script>
	var div=document.getElementById("chatbox");	
	div.scrollTop = div.scrollHeight;
</script>
</body>
</html>
