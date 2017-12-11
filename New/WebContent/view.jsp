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
<jsp:include page="header.jsp"></jsp:include>
<%if (session.getAttribute("email")!=null){
	%>

<table style="margin:0 auto;" border="1">
<%while(rs.next())
	{%>
<tr>
<td> First Name</td>
<td><%=rs.getString(1) %></td>
</tr>
<tr>
<td> Last Name</td>
<td><%=rs.getString(2) %></td>
</tr>
<tr>
<td> Contact</td>
<td><%=rs.getString(3) %></td>
</tr>
<tr>
<td> Address</td>
<td><%=rs.getString(4) %></td>
</tr>
<tr>
<td> Country</td>
<td><%=rs.getString(6) %></td>
</tr>
<tr>
<td> State</td>
<td><%=rs.getString(7) %></td>
</tr>
<tr>
<td> Dob</td>
<td><%=rs.getString(10) %></td>
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