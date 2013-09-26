<%/*******************************************************************
	**	Written by: Anthony Hayden									**
	**	Student No: C11733511										**
	**	Class: DT228/2												**
	**	Description: -Takes in data from "Book_SignUp.jsp"			**
	**				 -Forwards to "Book_login.jsp" on compeletion	**
	**				  Otherwise returns to "Book_SignUp.jsp"		**
	**				 -Compares Username against DB for uniqueness	**	
	**				 -Check password validation						**
	**				 -Check password length & Mobile length/validity**
	**				 -Check other details have been entered			**
	**				 -If all correct, add to database				**
	**																**
	******************************************************************/%>



<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page errorPage="errorPage.jsp" %>

<sql:setDataSource
var="booksdb"
driver="sun.jdbc.odbc.JdbcOdbcDriver"
url="jdbc:odbc:book dB"
scope="session"/>

<sql:query dataSource="${booksdb}" var="user_search" scope="page">
		
		SELECT *
		FROM Users
		WHERE Username = '${param.su_uname}'
		

</sql:query>

<c:if test="${user_search.rowCount != 0}">
	<c:set var="nameTaken" value = "true" scope="request"/>
	<c:set var="errRedirect" value="true" scope="page"/>
</c:if>


<c:if test="${param.su_pwd != param.su_pwd_confirm}">
	<c:set var="pwdmismatch" value = "true" scope="request"/>
	<c:set var="errRedirect" value="true" scope="page"/>
</c:if>


<% 	String password_temp = request.getParameter("su_pwd");
	String mobile_temp = request.getParameter("su_mobile");
	
	if ( password_temp.length() != 6 )
	{
		%><c:set var="errPwdLength" value="true" scope="request"/>
		  <c:set var="errRedirect" value="true" scope="page"/>
		<%
	}

	
	if ( mobile_temp.matches("[0-9]+") == false || mobile_temp.length() != 10)
	{
		%><c:set var="errMobileLength" value="true" scope="request"/>
		  <c:set var="errRedirect" value="true" scope="page"/>
		<%
	}

%>

<c:if test="${empty param.su_fname || empty param.su_sname ||
			  empty param.su_add1 || empty param.su_add2 ||
			  empty param.su_city || empty param.su_phone}">
			  
			<c:set var="errRedirect" value="true"/>
</c:if>

<c:if test="${errRedirect}">
	<jsp:forward page="Book_SignUp.jsp"/>
</c:if>

					 
					<fmt:parseNumber var="phone" integerOnly="true" value="${param.su_phone}" scope="page"/>
					<fmt:parseNumber var="mobile" integerOnly="true" value="${param.su_mobile}" scope="page"/>

					<sql:update dataSource="${booksdb}" var="UserAdd" scope = "page">
					
					INSERT INTO Users
					VALUES ( '${param.su_uname}',
							 '${param.su_pwd}',
							 '${param.su_fname}',
							 '${param.su_sname}',
							 '${param.su_add1}',
							 '${param.su_add2}',
							 '${param.su_city}',
							 '${phone}',
							 '${mobile}' )
	
					</sql:update>
					<jsp:forward page="Book_entry_confirmed.html"/>
