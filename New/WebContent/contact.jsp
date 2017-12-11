<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="ContactServlet" method="post">
<jsp:include page="header.jsp"></jsp:include>
<center>
<table style="margin:0 auto;">
<tr>
<td colspan="2">Contact page</td>
</tr>
<tr>
<td >EmailId:</td>
<td><input type="email" name="emailid" placeholder="Enter emaild id" maxlength="100" checked="checked" required="required"></td>
</tr>
<tr>
<td>Subject</td>
<td><input type="text" name="subject" placeholder="Enter Subject" maxlength="1000" checked="checked" required="required"></td>
</tr>
<tr>
<td>Message</td>
<td><textarea rows="20px" cols="30px" name="msg" placeholder="Enter Message" maxlength="1000" checked="checked" required="required">
</textarea></td>
</tr>
<tr>
<td><input type="submit" value="Send"></td>
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
{%>
	alert("msg send successfully");
	<%
}
else if(msg.equals("xyz"))
{
%>
alert("Please try again");
	<%
}	}
catch(Exception e){}
%>
</script>
</body>
</html>