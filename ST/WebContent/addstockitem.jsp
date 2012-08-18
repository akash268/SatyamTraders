<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="satyamtraders.beans.*,satyamtraders.jdbc.*,java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Stock Item</title>
</head>
<body>
	<center>
		<u>Add Stock Item</u>
		<form action="addstockitemprocess.jsp">


			<table>
				
				<tr>
					<td>Item Name &nbsp;</td>
					<td><input name="itemname" ></td>
				</tr>
				<tr>
					<td>MRP &nbsp;</td>
					<td><input name="mrp"></td>
				</tr>
				<tr>
					<td>Vat &nbsp;</td>
					<%
						ArrayList<Vat> vatSlabs = Service.getVatCategories();

						for (int i = 0; i < vatSlabs.size(); i++) {
							if (i == 0) {
					%>
					<td><input type="radio" name="vat"
						value=<%=vatSlabs.get(i).getVatPercentage()%>
						checked="checked" ><%=vatSlabs.get(i).getVatDesc()%></td>
					<%
						} else {
					%>
				
				<tr>
					<td>&nbsp;</td>
					<td><input type="radio" name="vat"
						value=<%=vatSlabs.get(i).getVatPercentage()%>
						><%=vatSlabs.get(i).getVatDesc()%></td>
				</tr>
				<%
					}
					}
				%>
				<tr>
					<td>Retailer Margin &nbsp;</td>
					<%
						ArrayList<RetailerMargin> margins = Service.getRetailerMargin();

						for (int i = 0; i < margins.size(); i++) {
							if (i == 0) {
					%>
					<td><input type="radio" name="retMargin"
						value="<%=margins.get(i).getRetailerMargin()%>" 
						checked="checked"><%=margins.get(i).getRetailerDesc()%></td>
					<%
						} else {
					%>
				
				<tr>
					<td>&nbsp;</td>
					<td><input type="radio" name="retMargin"
						value=<%=margins.get(i).getRetailerMargin()%>
						><%=margins.get(i).getRetailerDesc()%></td>
				</tr>
				<%
					}
					}
				%>
				</tr>
				<tr>
					<td>Purchase Price</td>
					<td><input type="text" name="price"></td>
				</tr>

			</table>
			<input type="submit" value="Add Item">
		</form>
	</center>
</body>
</html>