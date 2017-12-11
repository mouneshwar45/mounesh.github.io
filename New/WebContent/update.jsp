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
String emailid=session.getAttribute("email").toString();
String sql="select * from register where emailid='"+emailid+"'";
Model m=new Model();
m.setEmailid(emailid);
ResultSet rs=Dao.getValues(m,sql);


%>
<body>
<%if (session.getAttribute("email")!=null){
	%>
<form action="UpdateServlet" method="post">
<jsp:include page="header.jsp"></jsp:include>
<table style="margin:0 auto;" border="1">
<tr>
<th>First Name</th>
<th>Last Name</th>
<th>Contact</th>
<th>Address</th>
<th>Country</th>
<th>State</th>
<th>Dob</th>
</tr>
<% while(rs.next())
{
%>
<tr>
<td><%=rs.getString(1)%></td>
<td><%=rs.getString(2)%></td>
<td><%=rs.getString(3)%></td>
<td><%=rs.getString(4)%></td>
<td><%=rs.getString(6)%></td>
<td><%=rs.getString(7)%></td>
<td><%=rs.getString(10)%></td>
<td><a href="view.jsp">View</a></td>
<td><a href="update1.jsp">Update</a></td>
</tr>
</table>
<%
}
}else
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