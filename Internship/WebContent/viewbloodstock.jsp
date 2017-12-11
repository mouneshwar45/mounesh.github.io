<%@ page import="java.sql.*" %>
<%@ page import="dao.Dao"%>
<%@ page import="model.Model"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Blood Stock</title>
<script type="text/javascript">
javascript:window.history.forward(1);
</script>
</head>
<%
String sql="select * from blood";
Model m=new Model();
ResultSet rs= Dao.validate(m, sql);
%>

<body>
<jsp:include page="header.jsp"></jsp:include>
<center>
<h2 align="center">Blood Stock Details</h2>

<table border="1" cellpadding="20px"   colspan="2" style="margin-top:50px; ">

<tr>
<th>BloodGroup</th>
 <th>Blood Quantity in Units</th>
 <th>Price/Unit blood</th>
 <th>Availability</th>
</tr>
<%while(rs.next()) 
{%>
<tr>
<td><%=rs.getString(1)%></td>
<td><%=rs.getString(2)%></td>
<td><%=rs.getString(3)%></td>
<td><%=rs.getString(4)%></td>
</tr>
<%} %>
</table>
</center>
</body>
</html>