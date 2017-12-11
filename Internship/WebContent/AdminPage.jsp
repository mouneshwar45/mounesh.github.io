<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Page</title>
<link rel="StyleSheet" type="text/css" href="css/style.css">
<link rel="icon" href="images/logo.jpg">
<script type="text/javascript">
javascript:window.history.forward(1);</script>
</head>
<body>
<div id="header">
<div id="logo"></div>
<div id="headtitle">Welcome to Online Blood Bank</div>


<ul class="mymenu">

<%
try
{
String Alogin=(String)session.getAttribute("Alogin").toString();
if(Alogin.equals("true"))
{

%>
<li class="menuitem"><a class="menulink" href="Addblood.jsp">AddBlood</a></li>
<li class="menuitem"><a class="menulink" href="updateblood.jsp">UpdateBlood</a></li>
<li class="menuitem"><a class="menulink" href="DeleteBlood.jsp">DeleteBlood</a></li>
<li class="menuitem"><a class="menulink" href="adminchangepassword.jsp">Change Password</a></li>
<li class="menuitem"><a class="menulink" href="viewbloodstock.jsp">View Stock</a></li>
<li class="menuitem"><a class="menulink" href="Bloodreport.jsp">Blood Report</a></li>
<li class="menuitem"><a class="menulink" href="Alogout.jsp">Logout</a></li>

<%}
else
{%>
<li class="menuitem"><a class="menulink" href="AdminLogin.jsp">Login</a></li>
<li class="menuitem"><a class="menulink" href="home.jsp">Home</a></li>
</ul>
</div>
<div id="content">
 Welcome to Online Blood Bank!!


</div>
<%}
}
catch(Exception e)
{%>
<li class="menuitem"><a class="menulink" href="AdminLogin.jsp">Login</a></li>
<li class="menuitem"><a class="menulink" href="home.jsp">Home</a></li>
<% 
	e.printStackTrace();
}

%>
</body>
</html>