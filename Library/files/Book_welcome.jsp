<%/***********************************************************************
	**	Written by: Anthony Hayden										**
	**	Student No: C11733511											**
	**	Class: DT228/2													**
	**	Description: -Displays a page for a user to search for a 		**
	**				  book(author/title) or view own reservations		**
	**				 -Takes in data from "Book_Login.jsp"				**
	**				 -Forwards to "Book_My_Reserved.jsp" to view reserved**
	**				 -Forwards to "Book_cataquery.jsp" 	for search		**
	**				 -Forwards to "Book_Search_description" for search  **
	**				  by description			 						**	
	**																	**
	**********************************************************************/%>
	
<%@ page contentType = "text/html" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<html>
<div id="container" style="width:100%; height:92%">
<div style='height:50px; width:99%; text-align:center'>
<head>
<h2>
Welcome back, <c:out value="${fname}"/><p>
</h2>
</head>
</div>
<hr/>
<body>

<div style="width:99%">
<div style="width:48%; float:left; text-align:center">
	
	<h2>
	Search for Book:
	</h2>
</div>
<div style="width:48%; float:left; text-align:center">
	<h2>
	<a href="Book_My_Reserved.jsp">View My Reserved Books</a>
	</h2>
</div>
</div>

		<form method= "get" action="Book_cataquery.jsp">
		<div style=" width:99%">
		
		<div style="float:left;text-align:right; width:20%;font-size:20">
		Title:<br>
		Author:<br>
		</div>
		
		<div style="float:left; width:20%; text-align:left; padding-left:10px">
		<input type="text" name="btitle" style="width:180px" value="<c:out value = "${param.btitle}"/>"><br>
		<input type="text" name="bauthor" style="width:180px" value="<c:out value= "${param.bauthor}"/>"><br>
		</div>
		
		</div>
		
		<div style="float:left; width:99%">
		<div style="float:left; padding-left:50px; width:30%; text-align:right">
		<input type="submit" value="Enter" style="width:75px" >
		<input type="reset" value="Reset" style="width:75px">
		</div>
		</div>
		<div style="float:left; width:99%; text-align:center">
		<a href="Book_Search_description.jsp"/><h4>Search by Description</h4></a><br/>
		
		<c:if test="${cannotReserve}">
			<font style="color:red">
			<br/>
			Book is no longer available!
			</font>
		</c:if>
		
		</div>
		</body>
</div>
<hr/>
<div id="footer" style="width:100%; height:8%; float:center" >
<div id="name" style="width:49%; float:left; text-align:left">
Web Development 2 Assignment
</div>
<div id="description" style="width:49%; float:right; text-align:right">
Anthony Hayden : C11733511
</div>
</div>


</html>