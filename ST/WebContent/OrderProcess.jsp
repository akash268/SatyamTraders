<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="satyamtraders.jdbc.*,satyamtraders.util.*,satyamtraders.beans.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Satyam traders</title>
</head>
<body>
	<%
		Map<Integer, Item> allItems = Service.getAllItemsMap();
	%>
	<center>
		<u></u>
		<form>
			<table border="1">
				<tr>
					<th>Item</th>
					<th>Quantity</th>
					<th>MRP</th>
					<th>VAT %</th>
					<th>Discount</th>
					<th>Price</th>
					<th>VAT Amt.</th>
					<th>Total Amount</th>
				</tr>
				<%
					int i = 1;
					String itemId = null;
					do {
						itemId = request.getParameter("item" + i);
						String quantity = request.getParameter("quantity" + i);
						
						if (itemId != null && quantity != null && !itemId.equals("")
								&& !quantity.equals("")) {
							float qn=(Integer.parseInt(quantity));
							Item item=allItems.get(Integer.parseInt(itemId));
							float itemPrice=item.getItemPrice();
							float discount=((item.getMrp()-itemPrice)/item.getMrp())*100;
							float vatAmt=(item.getVatPer()/100)*itemPrice*qn;
							float totalAmt=itemPrice*qn+vatAmt;
				%>
				<tr>
					<td><%=
							item.getItemName()%></td>
					<td align="center"><%=quantity%></td>
					<td align="center"><%=item.getMrp() %></td>
					<td align="center"><%=item.getVatPer()%>%</td>
					<td align="center"><%=discount%>%</td>
					<td align="center"><%=itemPrice%></td>
					<td align="center"><%=vatAmt%></td>
					<td align="center"><%=totalAmt%></td>
				</tr>
				<%
					}
						i++;
					} while (itemId != null);
				%>

			</table>
		</form>
	</center>
</body>
</html>