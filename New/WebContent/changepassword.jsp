<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% if(session.getAttribute("email")!=null)
	{
	
	%>
<form action="ChangepasswordServlet" method="post">
<jsp:include page="header.jsp"></jsp:include>
<center>
<table style="margin:0 auto;">
<tr>
<td colspan="2">Change password page</td>
</tr>
<tr>
<td >Old Password</td>
<td><input type="password" name="pass1" placeholder="Enter Old password" maxlength="100" checked="checked" required="required"></td>
</tr>
<tr>
<td >New Password</td>
<td><input type="password" name="pass2" placeholder="Enter new password" maxlength="100" checked="checked" required="required"></td>
</tr>
<tr>
<td>Confirm password</td>
<td><input type="password" name="pass3" placeholder="retype password" maxlength="1000" checked="checked" required="required"></td>
</tr>
<tr>
<td><input type="submit" value="Submit"></td>
<td><input type="reset" value="Refresh"></td>
</tr>
</table>
</center>
</form>
<script type="text/javascript">
<%
try{
String msg=request.getParameter("msg");
if(msg.equals("abc"))
{%>
	alert("all fields are mandatory");
<%	
}
else if(msg.equals("qwerty"))
{	%>
	alert("password updated successfully");
	<%
}
else if(msg.equals("abcd"))
{
%>
alert("password and confirm password must be same");
	<%
}
else if(msg.equals("abcde"))
{
%>
alert("Old password is wrong please try again");
	<%
}
}
catch(Exception e){}
%>
</script>
<%
}
else
{
	response.sendRedirect("login.jsp");
}%>
</body>
</html>