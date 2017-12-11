<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
javascript:window.history.forward(1);
</script>
</head>
<body>
<form action="OtpServlet" method="post">
<jsp:include page="header.jsp"></jsp:include>
<center>
<table border="5" style="height:150px ;width:300px;cellpadding:15px;align:center;margin-top:40px" >
<tr>
<td colspan="2"> Otp Page!!</td>
</tr>
<tr>
<td>Enter Otp:</td>
<td><input type="text" name="otp" placeholder="Enter Otp">
</td>
</tr>
<tr>
<td><input type="submit" value="Forgot"></td>
<td><input type="reset" value="Refresh"></td>
</tr>
</table>

</center>
<script type="text/javascript">
<%
try{
	String msg=request.getParameter("msg");
	if(msg.equals("qwerty"))
	{
		%>
		alert("otp has been sent to mailid");
		<%
		}
	
else if(msg.equals("abcd"))
{
	%>
	alert("try again");
	<%
}
else if(msg.equals("abc"))
{
	%>
	alert("try again");
	<%
}
}
catch(Exception e)
{
	e.printStackTrace();
}
%>
</script>
</form>
</body>
</html>