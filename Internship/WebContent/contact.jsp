<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Contact us</title>
</head>
<body>
<form action="ContactServlet" method="get">
<jsp:include page="header.jsp"></jsp:include>
<table style="margin: 0 auto;align:center;margin-top:40px;height:200px ;width:300px;">

<tr><td><input type="text" placeholder="your name" name="name" required="required"></td></tr>
<tr><td><input type="email" placeholder="Email id" name="emailid" required="required"></td></tr>
<tr><td><input type="text" placeholder="Subject" name="sub" required="required"></td></tr>
<tr><td><input type="text" placeholder="What would you like to tell us" name="matter" required="required"></td></tr>
<tr><td><input type="submit" value="submit"></td></tr>
</table>
</form>
<script type="text/javascript">
<%
try{
String msg=request.getParameter("msg");
if(msg.equals("abc"))
{
%>
alert(" all fields are mandatory");
<%
}
else if(msg.equals("qwerty"))
{
%>
alert("successfully submitted query");
<%
}
}
catch(Exception e)
{	
}
%>
</script>
</body>
</html>