<%@page import="java.sql.ResultSet"%>
<%@page import="dao.Dao"%>
<%@page import="model.Model"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Invoice of the order</title>
<script type="text/javascript">
javascript:window.history.forward(1);

</script>
</head>
<%
try{
String date=session.getAttribute("date").toString();
String email=session.getAttribute("emailid").toString();
String sql="select * from invoice where emailid='"+email+"' and date='"+date+"'";
Model m=new Model();
m.setDate(date);
m.setEmailid(email);
ResultSet rs=Dao.search(m,sql);
%>
<body>
<form action="" method="post">
<jsp:include page="header.jsp"></jsp:include>
<center>
<h3>Invoice of the Order</h3>
<%if (session.getAttribute("invoice")!=null){
	%>
<table style="margin-top:40px; height:400px; width:300px" border="1" cellpadding="15px" >
<%while(rs.next())
	{%>
<tr>
<td> Name</td>
<td><%=rs.getString(1)%></td>


</tr>
<tr>
<td> Contact</td>
<td><%=rs.getString(2)%></td>
</tr>
<tr>
<td> Address</td>
<td><%=rs.getString(3)%></td>
</tr>
<tr>
<td> Emailid</td>
<td><%=rs.getString(4)%></td>
</tr>
<tr>
<td> Blood group</td>
<td><%=rs.getString(5)%></td>
</tr>
<tr>
<td> Bloodquantity</td>
<td><%=rs.getString(6)%></td>
</tr>
<tr>
<td> Price</td>
<td><%=rs.getString(8)%></td>
</tr>
<tr>
<td> Date</td>
<td><%=rs.getString(7)%></td>
</tr>
<% 

}
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
if(msg.equals("abc"))
{
%>
alert("all fields are mandatory");
<%
}
else if(msg.equals("qwerty"))
{
%>
alert("order placed successfully");
<%
}

}
catch(Exception e)
{	
};

%>

</script>
</body>
</html>