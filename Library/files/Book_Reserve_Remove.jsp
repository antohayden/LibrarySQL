<%/*******************************************************************
	**	Written by: Anthony Hayden									**
	**	Student No: C11733511										**
	**	Class: DT228/2												**
	**	Description: -Takes Data from "Book_My_Reserved.jsp"		**
	**				 -Removes selected (by ISBN) book reservation	**
	**				  from DB										**
	**				 -Updates Books Table to set as not reserved	**
	**			     -Forwards to "Boook_My_Reserved.jsp"			**
	**																**
	******************************************************************/%>

<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>				
<%@page errorPage="errorPage.jsp" %>
			
				<sql:update dataSource="${booksdb}" var="BookRemove" scope = "page">
		
						DELETE from Reservations
						WHERE '${param.DeleteLink}'=Reservations.ISBN

				</sql:update>
						
				<sql:update dataSource="${booksdb}" var="BoookRemove" scope = "page">
		
						UPDATE Books
						SET Reserved = 'N'
						WHERE ISBN = '${param.DeleteLink}'
		
				</sql:update>
				
				<jsp:forward page="Book_My_Reserved.jsp"/>