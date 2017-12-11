<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>UpdateBlood</title>
</head>
<body>
<jsp:include page="AdminPage.jsp"></jsp:include>
<form action="UpdatebloodServlet" method="post">
<center>
<table style="margin: 0 auto;align:center;margin-top:40px;height:200px ;width:300px;">
<tr>
<strong><td colspan="2"><h2>Update Blood</h2></td></strong>
</tr>
<tr>
<td>Blood Group</td>
<td><select name="bldgrp" required="required">
<option value="" disabled selected>select value</option>
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
<td>Price of the blood</td>
<td><input type="number" min="0" max="" name="price" placeholder="Enter amount" required="required" pattern="[0-9]" title="Enter Positive value">
</td>
</tr>
<tr>
<td>Units of the blood</td>
<td><input type="number" min="0" max="" name="unitsOfBlood" placeholder="Enter units of blood" required="required" pattern="[0-9]" title="Enter Positive value">
</td>
</tr>
<tr>
<td></td>
<td><input type="submit" value="Add"> 
<input type="reset" value="Refresh"></td>
</tr>
</table>

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
        	alert("successfully updated");
        <%}
        else if(msg.equals("asd"))
        {
        	%>
        	alert("Not added");
        <%}
        }
        catch(Exception e){};
        
        %>
        
        </script>
</body>
</html>