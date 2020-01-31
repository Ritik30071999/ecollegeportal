package ecollege.servlet;

import java.io.IOException;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ecollege.dbtasks.CrudOperation;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection cn;
	PreparedStatement pslogin;
	ResultSet rslogin;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Login() {
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

		String userid = request.getParameter("txtuserid");

		String userpass = request.getParameter("txtuserpass");

		System.out.println(userid + userpass);

		cn = CrudOperation.createConnection();

		String strsql = "select * from login where userid=? and userpass=?";

		try {
			pslogin = cn.prepareStatement(strsql);
			pslogin.setString(1, userid);
			pslogin.setString(2, userpass);
			System.out.println(pslogin);
			rslogin = pslogin.executeQuery(); // user to fire select query and it returns resultset

			if (rslogin.next()) {
				
				HttpSession hs = request.getSession(); //create a new session
				hs.setAttribute("sessionkey", userid);
				
				String utype = rslogin.getString("usertype");
				hs.setAttribute("sessiontype", utype);
				
				if (utype.equals("admin"))
					response.sendRedirect("/ecollege/jsp/adminhome.jsp");
				if (utype.equals("student"))
					response.sendRedirect("/ecollege/jsp/studenthome.jsp");
				if (utype.equals("recruiter"))
					response.sendRedirect("/ecollege/jsp/recruiterhome.jsp");
				/*
				 * if (userid.equals("scott") && userpass.equals("precursor")) {
				 * response.sendRedirect("/ecollege/jsp/userhome.jsp");
				 */
			} else {
				/* response.sendRedirect("/ecollege/jsp/login.jsp"); */
				String message = "invalid userid or password";
				request.setAttribute("msg", message);
				RequestDispatcher rd = request.getRequestDispatcher("/jsp/login.jsp");
				rd.forward(request, response);

			}

		} catch (SQLException se) {
			System.out.println(se);
		} finally {
			try {
				if (rslogin != null)
					rslogin.close();
				if (pslogin != null)
					pslogin.close();
			} catch (SQLException se) {
				System.out.println(se);
			}
		}
	}
}