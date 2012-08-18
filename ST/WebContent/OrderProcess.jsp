<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="satyamtraders.jdbc.*,satyamtraders.util.*,satyamtraders.beans.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
body{
	font-family: serif;
}
#company{
	font-family: '"Lucida Sans Unicode","Lucida Grande",sans-serif';
	font-size: 30px;
	font-weight: bolder;
}
table,th,td {
	border: 1px solid black;
	border-collapse: collapse;
}
.total-row {
	border: 1px solid white;
	border-top: 1px solid black;
}
</style>
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
			<table>
				<tr>
					<td colspan="8" style="padding-top: 5px;padding-bottom: 5px;">
						<center>
							<b><u style="font-size: small;">SALE INVOICE</u></b><br><br>
							<span id="company">M/s Satyam Traders</span>
							<br><br><br> Mandi Jwala Ganj, Shamli,<br> Uttar Pradesh -
							247776.<br> Tel: 9412666020, 9412868637, 8445565577
						</center>
					</td>

				</tr>
				<tr>
					<td colspan="5">Customer details go here<br> Customer
						details go here<br> Customer details go here<br>
					</td>
					<td colspan="3">Invoice No. : <br> Dated :
					</td>
				</tr>
				<tr>
					<td colspan="2">
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
							float qn = (Integer.parseInt(quantity));
							Item item = allItems.get(Integer.parseInt(itemId));
							float itemPrice = item.getItemPrice();
							float discount = ((item.getMrp() - itemPrice) / item
									.getMrp()) * 100;
							float vatAmt = (item.getVatPer() / 100) * itemPrice * qn;
							float totalAmt = itemPrice * qn + vatAmt;
				%>
				<tr>
					<td><%=item.getItemName()%></td>
					<td align="center"><%=quantity%></td>
					<td align="center"><%=item.getMrp()%></td>
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
				<tr style="font-weight: bold;" >
					
					<td align="right" class="total-row">Total</td>
					<td class="total-row">1234</td>
					<td class="total-row">pcs.</td>
					<td colspan="5" align="right" class="total-row">334232.33</td>
				</tr>
				<tr><td colspan="8"><center>
							<b><u>DECLARATION</u></b><br>
							We declare that this invoice shows the actual price of the<br> 
							Goods described and that all particulars are true and correct.<br> 
						</center>
					</td></tr>
			</table>
		</form>
	</center>
</body>
</html>