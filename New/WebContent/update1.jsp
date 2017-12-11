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
<script type="text/javascript" src="js/countries.js"></script>
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
<form action="UpdateServlet" method="post">
<jsp:include page="header.jsp"></jsp:include>
<%if (session.getAttribute("email")!=null){
	%>

<table style="margin:0 auto;" border="1">
<%while(rs.next())
	{%>
<tr>
<td> First Name</td>
<td><input type="text" name="fname" value="<%=rs.getString(1) %>"></td>
</tr>
<tr>
<td> Last Name</td>
<td><input type="text" name="lname" value="<%=rs.getString(2) %>"></td>
</tr>
<tr>
<td> Contact</td>
<td><input type="text" name="contact"min="7000000000" max="9999999999" value="<%=rs.getString(3) %>"></td>
</tr>
<tr>
<td> Address</td>
<td><input type="text" name="add" value="<%=rs.getString(4) %>"></td>
</tr>
<tr>
<td> Country</td>
<td><select name="country" id="country"></select></td>
</tr>
<tr>
<td> State</td>
<td><select name="state" id="state"></select></td>
</tr>
<tr>
<td> Dob</td>
<td><input type="date" name="dob" value="<%=rs.getString(10) %>"></td>
</tr>
<tr>
<td><input type="submit" value="update"></td>
<td><input type="reset" value="refresh"></td>
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
<script type="text/javascript">
populateCountries("country","state");</script>
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
	alert("updated successfully");
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