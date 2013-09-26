<%/*******************************************************************
	**	Written by: Anthony Hayden									**
	**	Student No: C11733511										**
	**	Class: DT228/2												**
	**	Description: -Displays a table containing currently 		**
	**				  reserved books by the user including a		**
	**				  link using ISBN number to remove reserved		**
	**				 -Forwards to "Books_Reserve_Remove.jsp"		**
	**				  to remove a reserved book						**
	**				 -Forwards to "Book_welcome.jsp" on link		**
	**			     -Retrieves Reservations from DB by Username	**
	**																**
	******************************************************************/%>


<%@ page contentType = "text/html" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@page errorPage="errorPage.jsp" %>

<html>
<div id="container" style="width:100%; text-align:center; height:92%">
<div style="text-align:center; width:100%; height:50px">
<head>
<h2>My reserved books</h2><p>
</head>
</div>
<hr/>


<body>

<sql:query dataSource="${booksdb}" var="reserveresult" scope = "request">
		
		SELECT Books.ISBN, BookTitle, Author
		FROM Books
		INNER JOIN Reservations
		ON Reservations.ISBN = Books.ISBN
		WHERE Reservations.Username = '${uname}'
		

</sql:query>


		<div style="width:100%; text-align:center">
		<c:choose>
			<c:when test="${reserveresult.rowCount == 0}">
				<font style="color:red; size:15">
				No Reservations Found.
				</font>
			</c:when>
			
			<c:otherwise>
			<p>
			<table border="1" align="center">
			<th>ISBN</th>
			<th>Book Title</th>
			<th>Author</th>
			<th>Remove</th>
				<c:forEach items="${reserveresult.rows}" var="row">
					<tr>
						<td><c:out value="${row.ISBN}"/></td>
						<td><c:out value="${row.BookTitle}"/></td>
						<td><c:out value="${row.Author}"/></td>
						<td>
						<c:url value="Book_Reserve_Remove.jsp" var="BookRemove" scope="request">
						<c:param name="DeleteLink" value="${row.ISBN}"/>
						</c:url>
						<a href= ${BookRemove}>
						<c:out value="Remove"/>
						</td>
					</tr>
				</c:forEach>
			</table>
			</c:otherwise>
		</c:choose>
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
		
	