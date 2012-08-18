package satyamtraders.util;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import satyamtraders.jdbc.Service;

public class DBUtils {

	private static String stockItemSnip = "Insert into stockitem(itemname,mrp,vatpercentid,retmarginid,purchaseprice) values(";
	private static String retailerSnip = "Insert into retailer(retailername,address,town_village,registered,tin) values(";

	public static String getInsertSnippetForTable(String table) {
		if (table.equalsIgnoreCase("stockItem")) {
			return stockItemSnip;
		}
		if (table.equalsIgnoreCase("retailer")) {
			return retailerSnip;
		}
		return null;
	}

	public static String getParam(String p, ServletRequest request) {
		return request.getParameter(p);
	}

	public static void insertFromParam(ServletRequest request, ServletResponse response,
			String... data) {
		// fist data item is table name and rest are param names
		String tableName = data[0];
		String params[] = new String[data.length - 1];
		for (int i = 1; i < data.length; i++) {
			params[i - 1] = getParam(data[i], request);
		}
		if (Service.insert(tableName, params) > 0) {
			try {
				response.getWriter()
						.print("Operation Successful! <a href=\"Main.jsp\">Go Home</a>");
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			try {
				response.getWriter().print(
						"Operation Failed! <a href=\"Main.jsp\">Go Home</a>");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	public static String getCurrentDate(){
		SimpleDateFormat sdf=new SimpleDateFormat("dd/MM/yyyy");
		return sdf.format(new Date());
	}
}
