<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="login"  class="com.Login" scope= "session"> 
    </jsp:useBean>
    
    <% 
	// Get parameters from Login request
	String useridentifier = request.getParameter("identifier");	
	%>

	<%
	     String foundUser = "false";
		 if ( useridentifier != null ) {
			 if ( useridentifier.contains("@") ) {
				 foundUser = login.doesEmailExist(useridentifier);
			 }
			 else {
				 foundUser = login.doesUsernameExist(useridentifier);
			 } 
		 }
	%>
	
	<% if (foundUser == "true") { %>
		<p>Check your email for instructions to reset your password</p>
	<% } else  { %>
		<p>Could not find your username or email on our database</p>
	<% } %>
	
</body>
</html>