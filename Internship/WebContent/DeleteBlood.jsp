<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete Blood</title>
</head>
<body>
<jsp:include page="AdminPage.jsp"></jsp:include>
<form action="DeleteBloodServlet" method="post">
<center>
<table style=" margin 0 auto;align:center;margin-top:40px ;height:200px ;width:300px; ">
<tr>
<strong><td colspan=2><h2>Delete Blood</h2></td></strong>
</tr>
<tr>
<td>Blood Group</td>
<td><select name="bldgrp" required="required">
 <option >Choose Blood Group</option>
 <option value="A+">A Positive</option>
  <option value="A-">A Negative</option>
   <option value="B+">B Positive</option>
  <option value="B-">B Negative</option>
  <option value="AB+">AB Positive</option>
  <option value="AB-">AB Negative</option>
  <option value="O+">O Positive</option>
  <option value="O-">O Negative</option>
</select>
</tr>
<tr>
<td>Units of the blood</td>
<td><input type="number" min="0" max="" name="unitsOfBlood" placeholder="Enter units of blood" required="required" >
</td>
</tr>
<tr>
<td></td>
<td><input type="submit" value="delete" >
</td>
</tr>
</table>
</center>
</form>
 <script type="text/javascript">
          
        <%
        try
        {
        String msg=request.getParameter("msg");
        if(msg.equals("abc"))
        {
        %>
        alert("All fields are mandatory");
        <%
        }
        else if(msg.equals("qwerty"))
        {
        	%>
        	alert("successfully Deleted");
        <%}
        else if(msg.equals("qwertyy"))
        {
        	%>
        	alert("successfully Deleted and stock is unavilable");
        <%}
        else if(msg.equals("asd"))
        {
        	%>
        	alert("Not Deleted");
        <%}
        else if(msg.equals("closed"))
        {
        	%>
        	alert("No blood group to Deleted");
        <%}
        else if(msg.equals("unavail"))
        {
        	%>
        	alert("Unable to update unavilable");
        <%}
        else if(msg.equals("cant"))
        {
        	%>
        	alert("can't delete");
        <%}
        else if(msg.equals("not"))
        {
        	%>
        	alert("the blood group is not available in the database");
        <%}
        }
        catch(Exception e){};
        
        %>
        
        </script>
</body>
</html>