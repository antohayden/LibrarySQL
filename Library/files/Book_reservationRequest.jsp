<%/*******************************************************************
	**	Written by: Anthony Hayden									**
	**	Student No: C11733511										**
	**	Class: DT228/2												**
	**	Description: -Check Book has not been reserved				**
	**				 -Forward to "Book_Welcome.jsp" is it is		**
	**				 -Input reservation request to reservation table**
	**				 -Update Reservations table						**
	**			     -Update Books table marking reserved book		**
	**				 -Forward to "Book_My_reserved" on completion	**
	**																**
	******************************************************************/%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn" %>
<%@ page import="java.util.*" %>
<%@page errorPage="errorPage.jsp" %>

		<c:set var="reserveLink_temp" value="${param.reserveLink}" scope="page"/>
		<c:set var="reserveLink" value="${fn:substringBefore( reserveLink_temp,'/')} " scope="page"/>
		
		<sql:query dataSource="${booksdb}" var="bookcheck" scope="page">
				
				SELECT * FROM Books
				WHERE ISBN = '${reserveLink}'
				AND Reserved = 'N'
				
		</sql:query>
		
		<c:choose>
			<c:when test="${bookcheck.rowCount == 0}">
				<c:set var="cannotReserve" value="true" scope="request"/>
				<jsp:forward page="Book_welcome.jsp"/>
			</c:when>
			
			<c:otherwise>
			
			<fmt:formatDate var="now" pattern="dd-MMM-yyyy" value="<%= new java.util.Date() %>" />
		
			<sql:update dataSource="${booksdb}" var="bookresult" scope = "page">
		
					INSERT INTO Reservations
					( UserName, ISBN, ReservedDate )
					VALUES ( ?, ?, ? )
		
			<sql:param value="${uname}" />
			<sql:param value="${reserveLink}" />
			<sql:param value="${now}" />
		

			</sql:update>
		
			<sql:update dataSource="${booksdb}" var="bookresult" scope = "page">
		
					UPDATE Books
					SET Reserved = 'Y'
					WHERE ISBN = '${reserveLink}'
		
			</sql:update>
		
			<jsp:forward page="Book_My_Reserved.jsp"/>
			</c:otherwise>
		</c:choose>
		
