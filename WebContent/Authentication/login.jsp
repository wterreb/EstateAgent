<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body>

	<form method="post" action="loginresult.jsp">
	
	    <div style="width:800px; margin:0 auto;">
			<table border="0" cellpadding="3" cellspacing="0">
				<tr valign="middle">
					<td>Username</td>
					<td><input name="username" type="text" value="wernert" size=32></td>
				</tr>
				<tr valign="middle">
					<td>Password</td>
					<td><input name="password" type="password"  value="passwd" size=32></td>
				</tr>
				<tr valign="middle">
					<td>&nbsp;</td>
					<td><input type="submit" value="login">
					</td>
				</tr>
					<tr valign="middle">
					<td>&nbsp;</td>
					<td><a href="passwordreminder.jsp">Forgot password</a><td>
				</tr>
			</table>
		</div>	
	</form>
</body>
</html>