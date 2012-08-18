<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"  import="satyamtraders.beans.*,satyamtraders.jdbc.*,satyamtraders.util.*,java.util.*"/>%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<center>
		<u>Add Retailer</u>
	<form action="purchaseinvoice.jsp">

		<table>
		<tr>
		<td>Supplier</td>
		<td><select name="supplier"><%
		ArrayList<Supplier> suppliers=Service.getSuppliers();
		for(Supplier supplier: suppliers){
		%>
		<option value="<%=supplier.getId() %>"><%=supplier.getName() %></option>
		<%
		
		}
		 %></select>
		</tr>
		<tr><td>
		Date (DD/MM/YYYY)
		
		</td>
		<td><input name="date" value=<%=DBUtils.getCurrentDate() %>><td>
		</tr>
		
		</table>
			<input type="submit" value="Proceed to Invoice">
		</form>
	</center>
</body>
</html>