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
<script type="text/javascript">
javascript:window.history.forward(1);</script>
</head>
<%
try{
String email=session.getAttribute("email").toString();
String sql="select fname,lname from register where emailid='"+email+"'";
Model m=new Model();
m.setEmailid(email);
ResultSet rs=Dao.search(m,sql);

%>
<body>
<jsp:include page="header.jsp"></jsp:include>
<%if (session.getAttribute("email")!=null){
	while(rs.next())
	{
	%>
	<div id=welcome>
	<h2>Welcome <%=rs.getString(1) %><%=" "%><%=rs.getString(2) %></h2>
	</div>
	<%
	}
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