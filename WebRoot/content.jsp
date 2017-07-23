<%@ page contentType="text/html; charset=gbk" language="java" import="java.util.*" errorPage="" %>
<% request.setCharacterEncoding("gbk"); %>
<%out.println(request.getAttribute("messages").toString());
%>