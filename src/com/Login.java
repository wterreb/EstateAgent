package com;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Login {

	
	private String firstname;
	private String lastname;
	private String username;
	private String password;
	private String dbpassword;
	private String email;
	private String isadmin;
	private String isValidated = "false";
	private String userNameExist = "false";
	private String emailExist = "false";
	
	String _DB_URL = "localhost:5432/postgres";

	
	public void setFirstname(String fname) {
		firstname = fname;		
	}
	
	public String getFirstname() {
		return firstname;		
	}
	
	public void setLastname(String lname) {
		lastname = lname;		
	}
	
	public String getLastname() {
		return lastname;		
	}
	
	public void setUsername(String uname) {
		username = uname;		
	}
	
	public String getUsername() {
		return username;		
	}
	
	private void setActualPassword(String pword) {
		dbpassword = pword;		
	}
	
	
	public void setPassword(String pword) {
		password = pword;		
	}
	
	public String getPassword() {
		return password;		
	}
	
	public void setEmail(String mail) {
		email = mail;		
	}
	
	public String getEmail() {
		return email;		
	}
	
	public void setIsAdmin(String iadmin) {
		isadmin = iadmin;		
	}
	
	public String getIsAdmin() {
		return isadmin;		
	}
	
	public String getIsValidated() {
	    return isValidated;
    }
	
	private void setIsValidated(String val) {
		isValidated = val;
	}

	
	private String findInDb(String fieldId, String contents) {
		String retVal = null;
    	Connection connection = null;
    	Statement statement = null;
    	ResultSet resultSet = null;
		String _sql_query = " SELECT " + fieldId + " FROM public.users  WHERE " + fieldId + " like \'" + contents + "\'";
		
		try {
			connection = DriverManager.getConnection("jdbc:postgresql://" + _DB_URL);
	        connection.setAutoCommit(false);
	        statement = connection.createStatement();
	        resultSet = statement.executeQuery(_sql_query);
			
	        int i = 0;
	        while ( resultSet.next() ) {    
	        	i++;
	        	retVal = resultSet.getString(i);
	        }
		} catch (SQLException e) {
    			// TODO Auto-generated catch block
    			e.printStackTrace();
		} finally {
			try {
		    	 if (resultSet != null) {
		    		 resultSet.close();
		    	 }
		    	 if (statement != null) {
		    		 statement.close();
		    	 }
		    	 if (connection != null) {
		    		 connection.close();
		    	 }
			 } catch(SQLException e) {
	    		 e.printStackTrace();
	    	 }
	     }    
        return retVal;
	}
	
	public String doesEmailExist(String emailAddress ) {
		String dbval = "false";
		emailExist = dbval;
		dbval = findInDb("email", emailAddress);
		if (dbval != null ) {
			if (dbval.equals(emailAddress)) {
				emailExist = "true";
			}
		}
		return emailExist;
	}
	
	public String doesUsernameExist(String usernme ) {
		String dbval = "false";
		userNameExist = dbval;
		dbval = findInDb("username", usernme);
		if (dbval != null ) {
			if (dbval.equals(usernme)) {
				userNameExist = "true";
			}
		}	
		return userNameExist;
	}
	
	public void lookup() throws SQLException {
    	Connection connection = null;
    	Statement statement = null;
    	ResultSet resultSet = null;

    	try {
    		String _sql_query = "SELECT * FROM users WHERE username LIKE '" + getUsername() + "'";
    		//String _DB_URL = "localhost:5432/postgres";
    		connection = DriverManager.getConnection("jdbc:postgresql://" + _DB_URL);
            connection.setAutoCommit(false);
            statement = connection.createStatement();
            resultSet = statement.executeQuery(_sql_query);
    		
            while (resultSet.next()) {
	    	     setUsername(resultSet.getString("username"));
	    	     setFirstname(resultSet.getString("firstname"));
	    	     setLastname(resultSet.getString("lastname"));
	    	     setActualPassword(resultSet.getString("password"));
	    	    // setEmail(resultSet.getString(email));      //  Add this to the database!
	    	     setIsAdmin(resultSet.getString("isadmin"));
	    	     
	    	     if ( password.equals(dbpassword) )
	    	     {
	    	    	 System.out.println("LOGIN SUCCESSFULL");
	    	    	 setIsValidated("true");
	    	    	 
	    	     }
	    	     else {
	    	    	 System.out.println("LOGIN FAILED");
	    	    	 setIsValidated("false");
	    	     }

    		} 
    	}
    	catch (SQLException e) {
    			// TODO Auto-generated catch block
    			e.printStackTrace();
		} finally {
	    	 if (resultSet != null) {
	    		 resultSet.close();
	    	 }
	    	 if (statement != null) {
	    		 statement.close();
	    	 }
	    	 if (connection != null) {
	    		 connection.close();
	    	 }
	     }    
    }
}