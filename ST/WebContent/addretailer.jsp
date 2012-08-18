<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="satyamtraders.beans.*,satyamtraders.jdbc.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Retailer</title>
</head>
<body>
	<center>
		<u>Add Retailer</u>
		<form action="addretailerprocess.jsp">


			<table>

				<tr>
					<td>Retailer Name &nbsp;</td>
					<td><input name="name"></td>
				</tr>
				<tr>
					<td>Address &nbsp;</td>
					<td><textarea rows="4" cols="20" name="address"></textarea></td>
				</tr>
				<tr>
					<td>Town/Village &nbsp;</td>
					<td><input type="text" name="town" /></td>
				<tr>
					<td>Registered &nbsp;</td>
					<td><input type="radio" checked="checked" name="registered" value="N"> No &nbsp; <input
						type="radio" name="registered" value="Y">Yes</td>
				</tr>

				<tr>
					<td>TIN No.</td>
					<td><input name="tin"></td>
				</tr>
				
				</tr>
				
			</table>
			<input type="submit" value="Add Retailer">
		</form>
	</center>


</body>
</html>