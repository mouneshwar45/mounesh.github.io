<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript" src="js/countries.js"></script>
</head>
<body>
<form action="RegisterServlet1" method="post">
<jsp:include page="header.jsp"></jsp:include>
<center>
<table border="10">
<tr>
<td colspan="2"><strong><en>&emsp;&emsp;Welcome to Register Page</en></strong></td>
</tr>
<tr>
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
<td><input type="text" name="con" placeholder="Enter Contact" maxlength="10" required="required">
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
<td>Country:</td>
<td><select name="country" id="country">
</select>
</td>
</tr>
<tr>
<td>State:</td>
<td><select name="state" id="state">
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
<td>Date Of Birth</td>
<td><input type="date" name="dob" placeholder="Enter Date of Birth" maxlength="100" required="required">
</td>
</tr>


<tr>
<td><input type="submit" value="Register">
</td>
<td><input type="reset" value="Refresh"></td>
</tr>
</table>
<h3>${msg}</h3>
</center> 
<script language="javascript">
            populateCountries("country", "state");
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
alert("try again");
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