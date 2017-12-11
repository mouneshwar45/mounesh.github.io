<%@page import="java.sql.ResultSet"%>
<%@page import="dao.Dao"%>
<%@page import="model.Model"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<%
try{
String email=session.getAttribute("emailid").toString();
String sql="select * from donorregistration where emailid='"+email+"'";
Model m=new Model();
m.setEmailid(email);
ResultSet rs=Dao.search(m,sql);

%>


<body>

<form action="" method="post">
<jsp:include page="header.jsp"></jsp:include>
<%if (session.getAttribute("view")!=null){
	%>
<center>
<table style="margin-top:40px; height:400px; width:300px" border="1" cellpadding="15px" >
<%while(rs.next())
	{%>
<tr><h2>Donor details are</h2>
<td> Name</td>
<td><%=rs.getString(1)%><%=" "%><%=rs.getString(2)%></td>


</tr>
<tr>
<td> Contact</td>
<td><%=rs.getString(3)%></td>
</tr>
<tr>
<td> Address</td>
<td><%=rs.getString(4)%></td>
</tr>
<tr>
<td> Gender</td>
<td><%=rs.getString(5)%></td>
</tr>
<tr>
<td> Country</td>
<td><%=rs.getString(6)%></td>
</tr>
<tr>
<td> State</td>
<td><%=rs.getString(7)%></td>
</tr>
<tr>
<td> Emailid</td>
<td><%=rs.getString(8)%></td>
</tr>
<tr>
<td> Bloodgroup</td>
<td><%=rs.getString(10)%></td>
</tr>
<% }%>
</table>
</center>
<%
}
else
{
	response.sendRedirect("login.jsp");
}
}
catch(Exception e){
e.printStackTrace();
}
%>
</body>
</html>