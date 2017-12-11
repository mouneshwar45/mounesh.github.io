<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Save lives</title>
<link rel="StyleSheet" type="text/css" href="css/style.css">
<link rel="icon" href="images/logo.jpg">
</head>
<body>
<div id="header">

<div id="headtitle"> Online Blood Bank</div>
<div id="subtitle"> welcome to you all</div>
<ul class="mymenu">

<li class="menuitem"> <a class="menulink" href="home.jsp">Home</a></li>
<li class="menuitem"> <a class="menulink" href="contact.jsp">Contact Us</a></li>
<%
try{
	String login=session.getAttribute("login").toString();
if(login.equals("true"))
{%>
<li class="menuitem"><a class="menulink" href="viewbloodstock.jsp">View Stock</a></li>
<li class="menuitem"> <a class="menulink"href="donorlist.jsp">Donor List</a></li>
<li class="menuitem"> <a class="menulink"href="changepassword.jsp">Change password</a></li>
<li class="menuitem"> <a class="menulink"href="bloodsearch.jsp">Search for blood</a></li>
<li class="menuitem"> <a class="menulink"href="logout.jsp">Logout</a></li>
<% }
else
{%>

<li class="menuitem"> <a class="menulink"href="AdminLogin.jsp">Admin</a></li>
<li class="menuitem"> <a class="menulink"href="login.jsp"><center>Login</center></a></li>
<li class="menuitem"> <a class="menulink"href="about.jsp">About</a></li>
<li class="menuitem"> <a class="menulink"href="register.jsp">Register</a></li>

</ul>

<%}
}
catch(Exception e){%>
	<li class="menuitem"> <a class="menulink"href="AdminLogin.jsp">Admin</a></li>
	<li class="menuitem"> <a class="menulink"href="login.jsp">Login</a></li>
	<li class="menuitem"> <a class="menulink"href="register.jsp">Register</a></li>
	<li class="menuitem"> <a class="menulink"href="about.jsp">About</a></li>
<%}
%>
</body>
</html>