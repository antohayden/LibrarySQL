<%/*******************************************************************
	**	Written by: Anthony Hayden									**
	**	Student No: C11733511										**
	**	Class: DT228/2												**
	**	Description: -Multiple possible queries based on input from **
	**				  "Book_welcome.jsp" or"Book_Search_description"**
	**				 -Displays Table listing query results			**
	**				  from DB table Books							**
	**				 -Implemented table of 5 results at a time 		**
	**				 -Provides a link to reserve beside each		**
	**				  result using ISBN values which				**
	**				  forwards to "Book_ReservationRequest.jsp"		**
	**			     -Forward to "Book_welcome.jsp" on link			**
	**				 -Forward to "Book_Search_Description" on link	**
	**				  if variable linkSearch is true				**
	******************************************************************/%>

<%@ page contentType = "text/html" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@page errorPage="errorPage.jsp" %>
<html>
<div id="container" style="width:100%; text-align:center; height:92%" >
<div style="text-align:center; width:100%; height:50px">
<head>
<h2>Search Results</h2><p>
</head>
</div>
<hr/>


<body>

		<c:choose>
			<c:when test="${param.linkSearch}">
				<sql:query dataSource="${booksdb}" var="SearchResults" scope="request">
				
				SELECT * FROM Books
				WHERE CategoryID = '${param.cataLink}'
				AND Reserved = 'N'
				
				</sql:query>
				
			</c:when>
			
			<c:otherwise>
			
				
				
				<c:choose>
				
					<c:when test="${empty param.btitle && empty param.bauthor}">
					<sql:query dataSource="${booksdb}" var="SearchResults" scope="request">
					
					SELECT * FROM Books
					WHERE Reserved = 'N'
					</sql:query>
					</c:when>
					
					<c:when test="${empty param.btitle}">
					<sql:query dataSource="${booksdb}" var="SearchResults" scope="request">
					
					SELECT * FROM Books
					WHERE Reserved = 'N'
					AND Author LIKE ?
					<sql:param value="%${param.bauthor}%" />
					</sql:query>
					</c:when>
					
					<c:when test="${empty param.bauthor}">
					<sql:query dataSource="${booksdb}" var="SearchResults" scope="request">
					SELECT * FROM Books
					WHERE Reserved = 'N'
					AND BookTitle LIKE ?
					<sql:param value="%${param.btitle}%"/>
					</sql:query>
					</c:when>
					
					<c:otherwise>
					<sql:query dataSource="${booksdb}" var="SearchResults" scope="request">
					SELECT * FROM Books
					WHERE Reserved = 'N'
					AND BookTitle LIKE ?
					AND Author LIKE ?
					<sql:param value="%${param.btitle}%"/>
					<sql:param value="%${param.bauthor}%"/>
					</sql:query>
					</c:otherwise>
					
				</c:choose>
			
			</c:otherwise>
		</c:choose>
		
		<c:choose>
			<c:when test="${SearchResults.rowCount == 0}">
				<h4 style="color:red">No results found</h4>
			</c:when>
			
			<c:otherwise>
			<div style="width:100%; text-align:center; height:200px">
			<p>
			<table border="1" align="center" width="700">
			<th>ISBN</th>
			<th>Book Title</th>
			<th>Author</th>
			<th>Edition</th>
			<th>Year</th>
			<th>Reserve</th>
			
			<c:set var="rowCount" value="${SearchResults.rowCount}"/>
			<c:set var="perPage" value="5"/>
			
				<c:forEach items="${SearchResults.rows}" var="row" begin="${param.first}" end="${param.first + perPage - 1}">
					<tr>
						<td><c:out value="${row.ISBN}"/></td>
						<td><c:out value="${row.BookTitle}"/></td>
						<td><c:out value="${row.Author}"/></td>
						<td><c:out value="${row.Edition}"/></td>
						<td><c:out value="${row.Year}"/></td>
						<td>
						<c:url value="Book_reservationRequest.jsp" var="B_ReserveR" scope="request">
						<c:param name="reserveLink" value="${row.ISBN}"/>
						</c:url>
						<a href= ${B_ReserveR}/>
						<c:out value="Reserve"/>
						<c:out value="${param.reserveLink}"/>
						</td>
					</tr>
				</c:forEach>
			</table>
			</div>
			</c:otherwise>
		</c:choose>
	<div style="width:99%">
		<div style="width:32%; float:left; text-align:center">
				<c:choose>
					<c:when test="${param.first > 0}">
						<a href="Book_cataquery.jsp?first=<c:out value="${param.first - perPage}"/>"> Previous Page</a>
					</c:when>
					<c:otherwise>
						Previous Page
					</c:otherwise>
				</c:choose>
		</div>
		
		<div style="width:35%; float:left"><br/></div>
		
		<div style="width:32%; float:left; text-align:center; ">
				<c:choose>
					<c:when test="${param.first + perPage < rowCount}">
						<a href="Book_cataquery.jsp?first=<c:out value="${param.first + perPage}"/>">Next Page</a>
					</c:when>
					<c:otherwise>
						Next Page
					</c:otherwise>
				</c:choose>
		</div>
	</div>
		<p>
		<a href="Book_welcome.jsp">Return to Main Page</a>
		</p>
		<c:if test="${param.linkSearch}">
			<p>
			<a href="Book_Search_description.jsp">Return to List</a>
			</p>
		</c:if>
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