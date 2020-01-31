package ecollege.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ecollege.dbtasks.CrudOperation;

import java.sql.*;

/**
 * Servlet implementation class News
 */
@WebServlet("/News")
public class News extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection con;
	private PreparedStatement psnews;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public News() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String usertitle = request.getParameter("txttitle");
		String usertext = request.getParameter("txtarea");
		con = CrudOperation.createConnection();
		java.util.Date dt = new java.util.Date();
		long t = dt.getTime();
		java.sql.Date sd = new java.sql.Date(t);
		try {
			String sql = "insert into news(title, text, date)values(?,?,?)";
			psnews = con.prepareStatement(sql);
			psnews.setString(1, usertitle);
			psnews.setString(2, usertext);
			psnews.setDate(3, sd);
			int rw = psnews.executeUpdate();
			if (rw > 0) {
				System.out.println("row inserted successfully");
			}
		} catch (SQLException se) {
			System.out.println(se);
		}
	
 	}

}
