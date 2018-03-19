<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Result</title>
</head>
<body>
	<jsp:useBean id="login"  class="com.Login" scope= "session"> 
    </jsp:useBean>

	<% 
	// Get parameters from Login request
	String uname = request.getParameter("username");
	String pword = request.getParameter("password");	
	%>
	
	<%
		 if ( uname != null ) {
			    
		    	 login.setUsername(uname);
		    	 login.setPassword(pword);
		    	 login.lookup();
	    		 if ( login.getIsValidated() == "true" ) {
	    			out.print("<b>LOGIN SUCCESSFULL</b>");
	    			
	    		 }
	    		 else {
	    			out.print("<b>LOGIN FAILED</b>");
	    			out.print("<br>");
	    			out.print("Please log in again");
	    			
	    	     }
		 }
	     if ( login.getIsValidated() == "true" ) 
	     {
     %>
    	 <br>Welcome  <%= login.getFirstname() %> <%= login.getLastname() %>   	
	 <%
	    	response.setHeader("Refresh", "3;url=/MyFirstJSP/button.jsp"); 
	      } else {
	    	response.setHeader("Refresh", "3;url=login.jsp");	  	
          }
     %>

</body>
</html>