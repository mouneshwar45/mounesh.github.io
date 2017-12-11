
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="AdminPage.jsp"></jsp:include>
<form action="BloodreportServlet" method="post">
<center>
<table style="margin-top:40px">
<tr>
<td align="center"> <h2>Blood Report</h2></td>
</tr>
<tr>
<td>Enter Date  From</td>
<td><input type="date" name="bday1" placeholder="yyyymmdd" required="required">
</td>
<td>To</td>
<td><input type="date" name="bday2" placeholder="yyyymmdd" required="required">
</td>
<td>
<input type="submit"  value="Submit" >
</td>
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
{
%>
alert("blood report successfully generated");
	<%
}
else if(msg.equals("abcd"))
{
%>
alert("No Reports Found");
	<%
}
}
catch(Exception e){}
%>
</script>
</body>
</html>