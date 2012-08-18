package satyamtraders.servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import satyamtraders.beans.Item;
import satyamtraders.jdbc.Service;
import satyamtraders.util.DBUtils;

/**
 * Servlet implementation class ItemsServlet
 */
@WebServlet(description = "provides a json representation of all items in database", urlPatterns = { "/ItemsServlet" })
public class ItemsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ItemsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Item> items = Service.getItems();
		StringBuilder sb=new StringBuilder("[");
		for(int i=0;i<items.size();i++){
			Item item=items.get(i);
			sb.append("{\"label\":"+"\""+item.getItemName()+"\""+",\"value\":"+"\""+item.getItemId()+"\"}");
			if(i<items.size()-1)
				sb.append(",");
		}
		sb.append("]");
		response.getWriter().write(sb.toString());
	
		}
		
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
