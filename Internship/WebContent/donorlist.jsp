<%@ page import="java.sql.*" %>
<%@ page import="dao.Dao"%>
<%@ page import="model.Model"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Reports</title>
<% 
try{

String sql="select * from donorregistration";
Model m=new Model();
ResultSet rs=Dao.validate(m,sql);

%>
</head>
<body>

<form action="" method="post">
<jsp:include page="header.jsp"></jsp:include>
<h2 align="center">Donor details</h2>
<%	String login=session.getAttribute("login").toString();
if(login.equals("true")){%>
	<center>
<table border="2" cellpadding="15px" style="margin-top:40px;">

<tr>
<th>firstname</th>
<th>lastname</th>
<th>contact</th>
<th>address</th>
<th>gender</th>
<th>state</th>
<th>dist</th>
<th>emailid</th>
<th>bloodgroupname</th>
<th>date of birth</th>
<th>pincode</th>
</tr>
<%while(rs.next())
	{%>

	
<tr>

<td><%=rs.getString(1)%></td>


<td><%=rs.getString(2)%></td>


<td><%=rs.getString(3)%></td>

<td><%=rs.getString(4)%></td>

<td><%=rs.getString(5)%></td>

<td><%=rs.getString(6)%></td>

<td><%=rs.getString(7)%></td>

<td><%=rs.getString(8)%></td>

<td><%=rs.getString(10)%></td>

<td><%=rs.getString(11)%></td>

<td><%=rs.getString(12)%></td>
</tr>

<%
}
}
}

catch(Exception e){
	System.out.println("in catch");
e.printStackTrace();
}
%>
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
}	}
catch(Exception e){}
%>
</script>
</body>
</html>