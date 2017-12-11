<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript" src="js/state.js">
</script>

</head>
<body>
<form action="RegisterServlet" method="post">
<jsp:include page="header.jsp"></jsp:include>
<center>

<table border="0" style="height:550px ;width:400px;cellpadding:15px;align:center;margin-top:40px" >
<tr>
<h2><strong><en>&emsp;&emsp;Welcome to Register Page</en></strong></h2>
<td>First Name</td>
<td><input type="text" name="fname" placeholder="Enter First Name" maxlength="100" required="required">
</td>
</tr>
<tr>
<td>Last Name</td>
<td><input type="text" name="lname" placeholder="Enter Last Name" maxlength="100" required="required">
</td>
</tr>
<tr>
<td>Contact</td>
<td><input type="text" name="con" placeholder="Enter Contact"  pattern="^[7-9]{1}[0-9]{9}" title="only 10 numbers are allowed" >
</td>
</tr>
<tr>
<td>Address</td>
<td><textarea rows="5px" cols="20px" name="add" placeholder="Enter Address" maxlength="1000" required="required"></textarea>
</td>
</tr>
<tr>
<td>Gender</td>
<td><input type="radio" name="gender" value="M" checked="checked">Male
<input type="radio" name="gender" value="F">Female
</td>
</tr>
<tr>
<td>State</td>
<td><select name="state" id="state">
</select>
</td>
</tr>
<tr>
<td>City</td>
<td><select name="city" id="city">
</select>
</td>
</tr>
<tr>
<td>Emailid</td>
<td><input type="email" name="emailid" placeholder="Enter Emailid" maxlength="100" required="required">
</td>
</tr>
<tr>
<td>Password</td>
<td><input type="password" name="pass" placeholder="Enter password" maxlength="100" required="required">
</td>
</tr>



<tr>
<td>Confirm Password</td>
<td><input type="password" name="pass1" placeholder="Enter confirm Password" maxlength="100" required="required">
</td>
</tr>
<tr>
<td>Blood Group</td>
<td><select name="bloodgroup">
<option value="" disabled selected>select value</option>
 <option value="A+">A Positive</option>
  <option value="A-">A Negative</option>
  <option value="AB+">AB Positive</option>
  <option value="AB-">AB Negative</option>
  <option value="O+">O Positive</option>
  <option value="O-">O Negative</option>
  <option value="B+">B Positive</option>
  <option value="B-">B Negative</option>
</select>
</tr>
<tr>
<td>Date Of Birth</td>
<td><input type="date" name="dob" placeholder="Enter Date of Birth" maxlength="100" required="required">
</td>
</tr>
<tr>
<td>Pincode</td>
<td><input type="text" name="pincode" placeholder="Enter pincode" pattern="^[0-9]{6}" title="only 6 numbers are allowed">
</td>
</tr>

<tr>
<td></td>
<td><input type="submit" value="Register">
<input type="reset" value="Refresh"></td>
</tr>
</table>
<h3>${msg}</h3>
</center> 
<script language="javascript">
            populateCountries("state", "city");
</script>
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
alert("user already registered try again with another email");
<%
}
else if(msg.equals("abcd"))
{
%>
alert("Password does not match");
<%
}
else if(msg.equals("qwerty"))
{
%>
alert("successfully registered");
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