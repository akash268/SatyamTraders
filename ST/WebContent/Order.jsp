<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="satyamtraders.jdbc.*,satyamtraders.util.*,satyamtraders.beans.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript" src="jquery-1.7.2.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.8.22.custom.min.js"></script>

<link rel="STYLESHEET" type="text/css"
	href="style/jquery-ui-1.8.22.custom.css">
<script type="text/javascript">
	$(document).ready(function() {
		
		//create 10 item table rows
		
		//fetch json containing item array with label and value for each item
		$.getJSON("Items", function(itemArray) {
			items = [];
			data=itemArray;
			$.each(itemArray, function(id, item) {
				items.push(item.label);
			});
			
			addRows(10);
			
		});
		
	});
	
	
	
	function addRows(number){
		
		rowCount=0;//no of rows in item table
		
		table=$('#itemTable');
		//check if table exists or not
		if(table.length==0 ) {//if not
			table = $('<table></table>').attr('id', 'itemTable');//create table with id itemTable
			$('#itemsDiv').append(table);//append table to div
		}else{
			rowCount=$('#itemTable tr').length;//count the number of rows in itemTable
		}
		
		//append 'number' more rows in itemTable 
		for(var i=1; i<=number; i++){
			//row template
		    var row = $('<tr><td>Item'+(i+rowCount)+' </td><td><input id="item_auto'+(i+rowCount)+'" style="width: 200px;">'+
		    '</td><td><input id="item'+(i+rowCount)+'" name="item'+(i+rowCount)+'" ></td><td>Quantity</td>'+
		    '<td><input id="quantity" name="quantity'+(i+rowCount)+'"></td><td><button type="button" onclick="addRows(1)">+</button></td></tr>');
		    table.append(row);
		    
		    //set up hidden input field for each new row as an autocomplete field
		    $("#item_auto"+(i+rowCount)).autocomplete({
				source : items,
				select : function(event, ui) {
					//find the label of item selected
					u = ui;
					selected=u.item.label;
					
					//find the value corresponding to the label selected in item array
					index=$.inArray(selected,items);
					item_Id=data[index].value;
					
					//find rowId
					var pattern = /[0-9]+/g;
					matches = $(this).attr('id').match(pattern);
					rowId=parseInt(matches[0]);
					
					//set the corresponding hidden field of the row with correct id					
					$("#item"+rowId)[0].value=item_Id;
			}
		});
	}
		}
</script>
</head>
<body>
	<center>
		<u></u>
		<form action="OrderProcess.jsp">
			<div id="itemsDiv"></div>
			<button type="submit">Make a Sale</button>
		</form>
	</center>
</body>
</html>