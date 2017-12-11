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
String bgsearch=session.getAttribute("bgname").toString();
String sql="select * from blood where bgname='"+bgsearch+"'";
Model m=new Model();
m.setBgname(bgsearch);
ResultSet rs=Dao.search(m,sql);

%>
<body>
<form action="" method="post">
<jsp:include page="header.jsp"></jsp:include>
<%if (session.getAttribute("search")!=null){
	%>
<center>
<table style="margin-top:40px; height:400px; width:300px" border="1" cellpadding="15px" >
<%while(rs.next())
	{%>
<tr>
<td> Blood group</td>
<td><%=rs.getString(1)%></td>


</tr>
<tr>
<td> Blood quantity</td>
<td><%=rs.getString(2)%></td>
</tr>
<tr>
<td> price</td>
<td><%=rs.getString(3)%></td>
</tr>

<tr>
<%
if(rs.getString(4).equals("yes"))
{
%>
<td><a href="order.jsp">Order</a></td>
<%
}
else
{
%><td><a href="request.jsp">Request for donor</a></td>
<%
}%></tr>
</table>
</center>

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
</form>
<script type="text/javascript">
<%
try{
String msg=request.getParameter("msg");
if(msg.equals("abcd"))
{%>
	alert("all fields are mandatory");
<%	
}
else if(msg.equals("qwerty"))
{%>
	//alert("updated successfully");
	<%
}
else if(msg.equals("abc"))
{
%>
alert("Please try again");
	<%
}	}
catch(Exception e){}
%>
</script>
</body>
</html>