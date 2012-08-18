package satyamtraders.util;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import satyamtraders.beans.Item;
import satyamtraders.jdbc.Service;

public class Test {
	
	private static Map<Integer,Float> vatIdMap;
	public static void main(String[] args) {
		System.out.println(getVatPercent(0));
	}
	private static float getVatPercent(int vatId) {
		try {
		if(vatIdMap==null){
			vatIdMap=new HashMap<Integer, Float>();
			ResultSet rs=Service.INSTANCE.fireQuery("Select * from vattable");
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
