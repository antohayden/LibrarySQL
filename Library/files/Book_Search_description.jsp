<%/*******************************************************************
	**	Written by: Anthony Hayden									**
	**	Student No: C11733511										**
	**	Class: DT228/2												**
	**	Description: -Displays list of books by Category in table	**
	**				  as links using category ID from DB			**
	**				 -Forwards to "Book_cataquery.jsp"				**
	**			     -Forward to "Book_welcome.jsp" on link			**
	**																**
	******************************************************************/%>

<%@ page contentType = "text/html" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@page errorPage="errorPage.jsp" %>

<html>
<div id="container" style="width:100%; text-align:center; height:92%">
<div style="text-align:center; width:99%; height:50px">
<head>
<h2>Categories:</h2><p>
</head>
</div>
<hr/>

<body>

<sql:query dataSource="${booksdb}" var="cateresult" scope="request">
		
		SELECT *
		FROM Categories
		

</sql:query>
		<div style="width:100%; text-align:center">
			<p>
			<table border="1" align="center">
			
			<th>Catagories:</th>
				<c:forEach items="${cateresult.rows}" var="row">
					<tr>
						<td>
						<c:set var="ISBN" value = "${row.CategoryID}"/>
						
						<c:url value="Book_cataquery.jsp" var="BookDescript" scope="request">
						<c:param name="cataLink" value="${ISBN}"/>
						<c:param name="linkSearch" value="true"/>
						</c:url>
						<a href= ${BookDescript}>
						<c:out value="${row.CategoryDescription}"/>
						
						</a>
						</td>
					</tr>
				</c:forEach>
				
			</table>
		</div>
		<p>
		<a href="Book_welcome.jsp">Return to Main Page</a>
		</p>
</body>				
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
</html>	