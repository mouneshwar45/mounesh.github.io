<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="LoginServlet" method="post">
<jsp:include page="header.jsp"></jsp:include>
<center>
<table style="margin:0 auto;">
<tr>
<td colspan="2">Login page</td>
</tr>
<tr>
<td >EmailId:</td>
<td><input type="email" name="emailid" placeholder="Enter emaild id" maxlength="100" checked="checked" required="required"></td>
</tr>
<tr>
<td>Password</td>
<td><input type="password" name="passwd" placeholder="Enter Password" maxlength="10" checked="checked" required="required"></td>
</tr>
<tr>
<td><a href="forgotpassword.jsp">Forgot Password !!</a></td>
</tr>
<tr>
<td><input type="submit" value="Login"></td>
<td><input type="reset" value="Refresh"></td>
</tr>


</table>
<jsp:include page="footer.jsp"></jsp:include>
<h3>${msg}</h3>
</center>
</form> 
</body>
</html>