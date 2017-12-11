<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>search for blood group</title>

<link rel="StyleSheet" type="text/css" href="css/style.css">
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<center>
<br><br>
<h2> Welcome to Blood search Page</h2>
<form action="BloodsearchServlet" method="post">
<%if (session.getAttribute("login")!=null){
	%>

<pre>



<h3>Search Here </h3><select name="bgsearch">
<option value="">select value</option>
 <option value="A+">A Positive</option>
  <option value="A-">A Negative</option>
  <option value="AB+">AB Positive</option>
  <option value="AB-">AB Negative</option>
  <option value="O+">O Positive</option>
  <option value="O-">O Negative</option>
  <option value="B+">B Positive</option>
  <option value="B-">B Negative</option>
</select><input type="submit" value="search">
</pre>


<%
}else
{
	response.sendRedirect("login.jsp");
}%>
</form>
<script type="text/javascript">
<%
try{
String msg=request.getParameter("msg");
if(msg.equals("abcd"))
{
%>
alert("");
<%
}
else if(msg.equals("abc"))
{
%>
alert("blood group is unavailable");
<%
}
else if(msg.equals("abcd"))
{
%>
alert("try again");
<%
}
}
catch(Exception e)
{	
};

%>

</script>
</center>
</body>
</html>