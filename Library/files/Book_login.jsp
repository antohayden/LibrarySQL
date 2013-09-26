<%/*******************************************************************
	**	Written by: Anthony Hayden									**
	**	Student No: C11733511										**
	**	Class: DT228/2												**
	**	Description: -Takes in data from "Book_Main.html"			**
	**				 -Forwards to "Book_Welcome.jsp" on compeletion	**
	**				  Otherwise to "Book_Main_Error.html"			**
	**				 -Compares Username & Password against DB		**	
	**																**
	******************************************************************/%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@page errorPage="Login_errorPage.jsp" %>

<sql:setDataSource
var="booksdb"
driver="sun.jdbc.odbc.JdbcOdbcDriver"
url="jdbc:odbc:book dB"
scope="session"/>

		
		<sql:query dataSource="${booksdb}" var="bookresult" 
		scope = "session">
		
		SELECT * FROM Users
		WHERE UserName = ?
		AND Password = ?
		
		<sql:param value="${param.uname}" />
		<sql:param value="${param.pwd}" />
		</sql:query>
		
		<c:choose>
			<c:when test="${bookresult.rowCount == 0}">
				<jsp:forward page="Book_error_Main.html"/>
			</c:when>
			
		<c:otherwise>
		<c:forEach items="${bookresult.rows}" var="row">
			<c:set var="fname" value="${row.FirstName}" scope="session"/>
			<c:set var="uname" value="${row.Username}" scope="session"/>
		</c:forEach>
			<jsp:forward page="Book_welcome.jsp"/>

		</c:otherwise>
		</c:choose>
