<%@ page contentType = "text/html" %>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page errorPage="errorPage.jsp" %>

<%/***********************************************************************
	**	Written by: Anthony Hayden										**
	**	Student No: C11733511											**
	**	Class: DT228/2													**
	**	Description: -Originates from "Book_login.jsp" signup button	**
	**				 -Forwards to "Book_data_input.jsp"					**
	**				 -Displays a page for a user to enter details		**	
	**				 -Displays appropriate error by testing values 		**
	**				  returned from validation.							**
	**				 -Forward to "Book_login.jsp" on link				**	
	**********************************************************************/%>
	
<html>
<div style="width:100% ;height:92%" id="container">
<div style="width:99%; text-align:center; height:50px">

	<head>
	<h3>Please enter your details below</h3>
	</head>
</div>
<hr/>
	
<body>
<div style="width:99%; padding-top:25px; padding-left:1%" id="entry_fields">
<div style="width:32%; float:left; text-align:right">
	<h3>Username:<br>
		Password:<br>
		Confirm Password:<br>
		First Name:<br>
		Surname:<br>
		AddressLine1:<br>
		AddressLine2:<br>
		City:<br>
		Telephone:<br>
		Mobile:<br>
		</h3>
</div>

<div style="width:300px; float:left; padding-top:20px; text-align:left; padding-left:1%">
<form action="Book_data_input.jsp" method="post">

<input type="hidden" name="alreadysent" value="true"/>
<input type="text" name="su_uname" style="height:23px; width:200px" value="<c:out value = "${param.su_uname}"/>"><br>
<input type="password" name="su_pwd" style="height:23px ; width:200px" value="<c:out value = "${param.su_pwd}"/>"><br>
<input type="password" name="su_pwd_confirm" style="height:23px; width:200px" value="<c:out value = "${param.su_pwd_confirm}"/>"><br>
<input type="text" name="su_fname" style="height:23px; width:200px" value="<c:out value = "${param.su_fname}"/>"><br>
<input type="text" name="su_sname" style="height:23px; width:200px" value="<c:out value = "${param.su_sname}"/>"><br>
<input type="text" name="su_add1" style="height:23px; width:200px" value="<c:out value = "${param.su_add1}"/>"><br>
<input type="text" name="su_add2" style="height:23px; width:200px" value="<c:out value = "${param.su_add2}"/>"><br>
<input type="text" name="su_city" style="height:23px; width:200px" value="<c:out value = "${param.su_city}"/>"><br>
<input type="text" name="su_phone" style="height:23px; width:200px" value="<c:out value = "${param.su_phone}"/>"><br>
<input type="text" name="su_mobile" style="height:23px; width:200px" value="<c:out value = "${param.su_mobile}"/>"><br>
</div>

<div style="width:32%; float:left; text-align:left; padding-left:1%">
<h3 style="color:red">
	<c:if test="${param.alreadysent && empty param.su_uname}">
		You must provide a username!
	</c:if>
	<c:if test="${nameTaken}">
		Username taken, please try another!
	</c:if>
<br/>
	<c:if test="${param.alreadysent && empty param.su_pwd}">
		You must provide a password!
	</c:if>
	<c:if test="${errPwdLength && not empty param.su_pwd}">
		Password must be 6 characters long
	</c:if>
<br/>
	<c:if test="${param.alreadysent && empty param.su_pwd_confirm}">
		You must confirm password!
	</c:if>
	<c:if test="${pwdmismatch && not empty param.su_pwd_confirm}">
		Password validation incorrect!
	</c:if>
<br/>
	<c:if test="${param.alreadysent && empty param.su_fname}">
		You must provide your first name
	</c:if>
<br/>
	<c:if test="${param.alreadysent && empty param.su_sname}">
		You must provide your surname
	</c:if>
<br/>
	<c:if test="${param.alreadysent && empty param.su_add1}">
		You must provide an address!
	</c:if>
<br/>
	<c:if test="${param.alreadysent && empty param.su_add2}">
		You must provide an address!
	</c:if>
<br/>
	<c:if test="${param.alreadysent && empty param.su_city}">
		You must provide a city!
	</c:if>
<br/>
	<c:if test="${param.alreadysent && empty param.su_phone}">
		You must provide a contact number!
	</c:if>
<br/>
	<c:if test="${param.alreadysent && empty param.su_mobile}">
		You must provide a contact number!
	</c:if>
	<c:if test="${errMobileLength && not empty param.su_mobile}">
		Mobile Number must be 10 digits long and contain only digits
	</c:if>
<br/>

</div>
</div>
<div style="width:99%; float:left; text-align:center;">
<input type="submit" value="Submit" style="width:100px"/>
<input type="reset" value="Reset" style="width:100px"/>
</div>
</form>
<div style="width:99%; text-align:center; float:left">
<a href="Book_Main.html">Return to Main Page</a>
</div>
</div>
<hr/>
<div id="footer" style="width:100%; height:7%; float:center" >
<div id="name" style="width:49%; float:left; text-align:left">
Web Development 2 Assignment
</div>
<div id="description" style="width:49%; float:right; text-align:right">
Anthony Hayden : C11733511
</div>
</div>
</body>
</html>