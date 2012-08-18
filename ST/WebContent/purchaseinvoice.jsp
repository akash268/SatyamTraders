<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="satyamtraders.jdbc.*,satyamtraders.util.*,satyamtraders.beans.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript" src="jquery-1.7.2.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$.getJSON('/ST/Items', function(data) {
			items = data;
			console.log('items: ' + items);
		});
	});

	function addRows() {

		var table = document.getElementById('itemTable');

		var rowCount = table.rows.length - 1;

		for ( var i = rowCount; i <= rowCount + 5; i++) {
			var row = table.insertRow(i);

			var cell1 = row.insertCell(0);
			var itemList = document.createElement("select");
			itemList.name = 'item' + i;
			$.each(items, function(index, item) {
				var option = new Option(item.itemName, item.itemId);
				if ($.browser.msie) {
					itemList.add(option);
				}

				else {

					itemList.add(option, null);

				}
			});

			cell1.appendChild(itemList);

			var cell2 = row.insertCell(1);

			cell2.innerHTML = "<input name=qty"+i+" value=0>";

		}

	}
</script>
</head>
<body>
	<center>
		<u>Purchase Invoice</u> <br>
		<br>
		<table id="itemTable">
			<thead>
				<tr>
					<td align="center">Item</td>
					<td align="center">Quantity</td>
				</tr>
			</thead>
			<%
				for (int i = 1; i <= 5; i++) {
			%>
			<tr>
				<td><select name="item<%=i%>">
						<%
							ArrayList<Item> items = Service.getItems();
								for (Item item : items) {
						%>
						<option value="<%=item.getItemId()%>"><%=item.getItemName()%></option>
						<%
							}
						%>
				</select></td>
				<td><input name="qty<%=i%>" value="0"></td>
			</tr>
			<%
				}
			%>
			<tr>
				<td></td>
				<td></td>
			</tr>
		</table>
		<button id="add" onclick="addRows()">Add More Items</button>
	</center>
	<%
		session.setAttribute("supplierId", request.getParameter("supplier"));
		session.setAttribute("date", request.getParameter("date"));
	%>
</body>
</html>