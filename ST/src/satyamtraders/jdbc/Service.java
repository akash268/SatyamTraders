package satyamtraders.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import satyamtraders.beans.Item;
import satyamtraders.beans.RetailerMargin;
import satyamtraders.beans.Supplier;
import satyamtraders.beans.Vat;
import satyamtraders.util.DBUtils;

public class Service {
	private Service(){};
	public static Service INSTANCE;
	private static Map<Integer,Float> vatIdMap;
	static{
		INSTANCE=new Service();	
		INSTANCE.connect();
	}
	private Connection con;
	
	//connect to db
	private void connect(){
		String url = "jdbc:mysql://localhost:3306/";
		String dbName = "satyam_traders";
		String driver = "com.mysql.jdbc.Driver";
		String userName = "root"; 
		String password = "";		
		try {
			  Class.forName(driver).newInstance();
			  con = DriverManager.getConnection(url+dbName,userName,password);
			  } catch (Exception e) {
			  e.printStackTrace();
			  }
	}
	
	private Connection getConnection(){
		try {
			if(INSTANCE.con==null || INSTANCE.con.isClosed()){
				INSTANCE.connect();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return INSTANCE.con;
	}
	
	
	//close connection
	private void closeConnection(Connection con){
		try {
			if(con!=null && !con.isClosed()){
				con.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static ArrayList<Vat> getVatCategories(){
		ArrayList<Vat> vatSlabs=new ArrayList<Vat>();
		try {
		ResultSet rs=INSTANCE.fireQuery("Select * from VatTable");
			while(rs.next()){
				vatSlabs.add(new Vat(rs.getFloat("vatPercentage"),rs.getString("vatDesc")));				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vatSlabs;
	}
	public static ArrayList<RetailerMargin> getRetailerMargin(){
		ArrayList<RetailerMargin> margins=new ArrayList<RetailerMargin>();
		try {
			ResultSet rs=INSTANCE.fireQuery("Select * from RetailerMargin");
			while(rs.next()){
				margins.add(new RetailerMargin(rs.getFloat("marginPercentage"),rs.getString("marginDesc")));				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return margins;
	}

	public  ResultSet fireQuery(String query) throws SQLException {
		return getConnection().createStatement().executeQuery(query);
	}
	private  int fireUpdate(String query) throws SQLException {
		return getConnection().createStatement().executeUpdate(query);
	}
	
	public static int insert(String table,String[] values){
		StringBuilder sb=new StringBuilder(DBUtils.getInsertSnippetForTable(table));
		for(int i=0;i<values.length;i++){
			if(i==values.length-1){
			sb.append("'"+values[i]+"')");
			}else{
			sb.append("'"+values[i]+"',");
			}
			}
		try {
			System.out.println(sb.toString());
			return INSTANCE.fireUpdate(sb.toString());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
		}
		
	public static ArrayList<Supplier> getSuppliers(){
		ArrayList<Supplier> suppliers=new ArrayList<Supplier>();
		try {
			ResultSet rs=INSTANCE.fireQuery("Select * from supplier");
				while(rs.next()){
					suppliers.add(new Supplier(rs.getString("SupplierFirmName"),rs.getInt("SupplierID")));				
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		
		return suppliers;
	}
	
	public static ArrayList<Item> getItems(){
		ArrayList<Item> items=new ArrayList<Item>();
		try {
			ResultSet rs=INSTANCE.fireQuery("Select * from stockitem");
				while(rs.next()){
					items.add(new Item(rs.getInt("itemid"),rs.getString("itemname")));				
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return items;
	}
	public static Map<Integer,Item> getAllItemsMap(){
		Map<Integer,Item> itemMap=new HashMap<Integer, Item>();
		try {
			ResultSet rs=INSTANCE.fireQuery("Select * from stockitem");
				while(rs.next()){
					Item item=new Item(rs.getInt("itemid"),rs.getString("itemname"));
					item.setMrp(rs.getFloat("mrp"));
					int vatId = rs.getInt("vatpercentid");					
					item.setVatPer(getVatPercent(vatId));
					item.setSalePrice(rs.getFloat("salePrice"));
					itemMap.put(rs.getInt("itemid"),item);				
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return itemMap;
	}

	private static float getVatPercent(int vatId) {
		System.out.println("getVatPercent call for vatid "+vatId);
		try {
		if(vatIdMap==null){
			vatIdMap=new HashMap<Integer, Float>();
			ResultSet rs=INSTANCE.fireQuery("Select * from vattable");
			while(rs.next()){
				vatIdMap.put(rs.getInt("vatid"), rs.getFloat("vatpercentage"));
			}
		}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return -1;
		}
		return vatIdMap.get(vatId);
	}
	}
	

