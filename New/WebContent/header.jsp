<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>MY Project</title>

<link rel="StyleSheet" type="text/css" href="css/style.css">
<link rel="icon" href="images/logo.jpg">


</head>
<body>
<div id="header">
<div id="logo">
</div>
<div id="headtitle"> my website</div>
<div id="subtitle"> welcome to you all</div>
<ul class="mymenu">
<li class="menuitem"> <a class="menulink"href="about.jsp">about</a></li>
<%
try{
String login=session.getAttribute("login").toString();
if(login.equals("true"))
{%>
<li class="menuitem"> <a class="menulink"href="update.jsp">Update</a></li>
<li class="menuitem"> <a class="menulink"href="logout.jsp">Logout</a></li>
<li class="menuitem"> <a class="menulink"href="changepassword.jsp">Change password</a></li>
<li class="menuitem"> <a class="menulink"href="photos.jsp">Photos</a></li>
<% }
else
{%>
<li class="menuitem"> <a class="menulink"href="login.jsp"><center>login</center></a></li>
<li class="menuitem"> <a class="menulink"href="contact.jsp">contact</a></li>
<li class="menuitem"> <a class="menulink"href="register.jsp">register</a></li>
</ul>
</div>
<div id="content">

hello everyone here is the registration page
</div>
<%}
}
catch(Exception e){%>
	<li class="menuitem"> <a class="menulink"href="login.jsp">login</a></li>
	<li class="menuitem"> <a class="menulink"href="contact.jsp">contact</a></li>
	<li class="menuitem"> <a class="menulink"href="register.jsp">register</a></li>
<%}
%>
</body>
</html>