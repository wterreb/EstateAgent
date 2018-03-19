<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Password Reminder</title>
</head>
<body>
	<form method="post" action="passwordreminderresult.jsp">
	    <div style="width:800px; margin:0 auto;">
			<table border="0" cellpadding="3" cellspacing="0">
				<tr valign="middle">
					<td>Username or Email Address</td>
					<td><input name="identifier" type="text" value="wernert" size=32></td>
				</tr>
				<tr valign="middle">
					<td>&nbsp;</td>
					<td><input type="submit" value="Submit">
					</td>
				</tr>
			</table>
		</div>	
	</form>

</body>
</html>