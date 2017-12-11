<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

</head>
<body>
<form action="OrderServlet" method="post">
<jsp:include page="header.jsp"></jsp:include>

<center>
<table border="5" style="height:550px ;width:400px;cellpadding:15px;align:center;margin-top:40px" >
<tr>
<td colspan="2"><strong><en>&emsp;&emsp;Welcome to Register Page</en></strong></td>
</tr>
<tr>
<td>First Name:</td>
<td><input type="text" name="fname" placeholder="Enter First Name" maxlength="100" required="required">
</td>
</tr>
<tr>
<td>Last Name:</td>
<td><input type="text" name="lname" placeholder="Enter Last Name" maxlength="100" required="required">
</td>
</tr>
<tr>
<td>Contact:</td>
<td><input type="text" name="con" placeholder="Enter Contact"  pattern="^[7-9]{1}[0-9]{9}" title="only 10 numbers are allowed" >
</td>
</tr>
<tr>
<td>Address:</td>
<td><textarea rows="5px" cols="20px" name="add" placeholder="Enter Address" maxlength="1000" required="required"></textarea>
</td>
</tr>
<tr>
<td>District:</td>
<td><input type="text" name="dist" id="dist" placeholder="Enter District name" required="required">
</td>
</tr>
<tr>
<td>State:</td>
<td><input type="text" name="state" id="state" placeholder="Enter State name" required="required">
</td>
</tr>
<tr>
<td>Emailid:</td>
<td><input type="email" name="emailid" placeholder="Enter Emailid" maxlength="100" required="required">
</td>
</tr>

<tr>
<td>Blood group:</td>
<td><select name="bgname" required>
<option value="" disabled selected>select blood group</option>
 <option value="A+">A Positive</option>
  <option value="A-">A Negative</option>
  <option value="AB+">AB Positive</option>
  <option value="AB-">AB Negative</option>
  <option value="O+">O Positive</option>
  <option value="O-">O Negative</option>
  <option value="B+">B Positive</option>
  <option value="B-">B Negative</option>
</select>
</td>
</tr>
<tr>
<td>Select quantity in ml:</td>
<td><select  name="bquantity"   id="state" required>
<option value="" disabled selected>select value</option>
<option value="1">525 ml(one unit)</option>
<option value="2">1050 ml(two units)</option>
<option value="3">1575 ml(three units)</option>
<option value="4">2100 ml(four units)</option>
<option value="5">2625 ml(five units)</option>
<option value="6">3150 ml(six units)</option>
</select>
</td>
</tr>
<tr>
<td>Date:</td>
<td><input type="date" name="day" placeholder="select date" maxlength="100" required="required">
</td>
</tr>
<tr>
<td><input type="submit" value="place order">
</td>
<td><input type="reset" value="cancel"></td>
</tr>
</table>
<h3>${msg}</h3>
</center> 
</form>

<script type="text/javascript">
<%
try{
String msg=request.getParameter("msg");
if(msg.equals("abc"))
{
%>
alert(" all fields are mandatory");
<%
}
else if(msg.equals("ag"))
{
%>
alert("try again");
<%
}
else if(msg.equals("abcd"))
{
%>
alert("please try again with another emailid");
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