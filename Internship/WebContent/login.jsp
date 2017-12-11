<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>

</head>
<body>
<form action="LoginServlet" method="post">
<jsp:include page="header.jsp"></jsp:include>
<center>
<table style="margin:0 auto;">
<tr>
<strong><td colspan="2"><h2>Login Page</h2></td></strong>
</tr>
<tr>
<td>Emailid:</td>
<td><input type="email" name="emailid" placeholer="Enter Emailid" maxlength="100" required="required">
</td>
</tr>
<tr>
<td>Password:</td>
<td><input type="password" name="password" placeholer="Enter password" maxlength="100" required="required">
</td>
</tr>
<tr><td> </td>
<td><input type="submit" value="Login">
<input type="reset" value="Refresh"></td>
</tr>
<tr>
<td><a href="forgotpassword.jsp">ForGot Password!!</a></td>
</tr>
</table>
<jsp:include page="footer.jsp"></jsp:include>
<script type="text/javascript">
<%
try{
String msg=request.getParameter("msg");
if(msg.equals("abcd"))
{
%>
alert(" all fields are mandatory");
<%
}
else if(msg.equals("abc"))
{
%>
alert("Password does not match");
<%
}
else if(msg.equals("qwerty"))
{
%>
alert("successfully registered");
<%
}
else if(msg.equals("qwertyz"))
{
%>
alert("password successfully changed");
<%
}
}
catch(Exception e)
{	
};

%>

</script>

</body>
</html>