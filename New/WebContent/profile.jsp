<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="refresh" content="<%=session.getMaxInactiveInterval() %>URL=./logout.jsp">
<title>Insert title here</title>
<script type="text/javascript" lang="javascript"> 
javascript:window.history.forward(1);
</script>
<%
response.setHeader("Pragma","no-cache");
response.setHeader("Cache-Control","no-store");
response.setHeader("Expires","0");
response.setDateHeader("Expires",-1);
%>
</head>
<body>
<% if(session.getAttribute("email")!=null)
	{
	
	%>
wELCOME ${email }
<jsp:include page="header.jsp"></jsp:include>
<%
String path=application.getRealPath("\\images\\");
String emailid=session.getAttribute("email").toString();

path=path+emailid+".jpg";
File f=new File(path);
String src="";
if(f.exists())
{
	src=f.getName();
}
else
{
	src="profile.jpg";
}
%>
<div style="float:right;border:3px solid green;border-radius:40px;margin:10px">
<form action="UploadServlet" method="post"; style="width:120px;margin:0 auto;margin-bottom:10px" enctype="multipart/form-data">
<img src="images/<%=src%>" style="width:100px;height:120px;margin:10px;">
<input type="file" name="file" accept="images/JPEG" style="width:125px" onchange="this.form.submit();">

<script type="text/javascript">
<%
try{
	String msg=request.getParameter("msg");
	if(msg.equals("qwerty"))
	{%>
	alert("Login successfully");
	<%	
	}
}
catch(Exception e)
{
	e.printStackTrace();
}%>
</script>
<jsp:include page="footer.jsp"></jsp:include>
</form>
<%
}
else
{
	response.sendRedirect("login.jsp");
}%>
</body>
</html>