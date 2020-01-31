package ecollege.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ecollege.dbtasks.CrudOperation;
import java.sql.*;

/**
 * Servlet implementation class StudentRegistration
 */
@WebServlet("/StudentRegistration")
public class StudentRegistration extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection con;
	private PreparedStatement pssr, pslogin;
	private ResultSet rs;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public StudentRegistration() {
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
		// response.getWriter().append("Served at: ").append(request.getContextPath());

		/*
		 * response.setContentType("text/html"); PrintWriter out = response.getWriter();
		 * String id = request.getParameter("studentid"); if (id.equals("scott")) {
		 * out.println("userid already exists"); }
		 */

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		// String userid = request.getParameter("txtuserid");
		String id = request.getParameter("studentid");
		con = CrudOperation.createConnection();
		String strsql = "select * from studentregistration where id=?";
		try {
			pslogin = con.prepareStatement(strsql);
			rs = CrudOperation.getData(strsql, id);
			if (rs.next()) {
				out.println("userid already exists");
			}
		} catch (SQLException se) {
			System.out.println(se);
		}

		// rs = CrudOperation.getData(strsql, userid);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userid = request.getParameter("txtuserid");
		String userpass = request.getParameter("txtuserpass");
		String username = request.getParameter("txtusername");
		String useremail = request.getParameter("txtuseremail");
		String userphone = request.getParameter("txtuserphone");
		String usercourse = request.getParameter("cmbcourse");
		String usergender = request.getParameter("gender");

		con = CrudOperation.createConnection();

		try {
			con.setAutoCommit(false);
			String strinsert = "insert into login values(?,?,?)";
			pslogin = con.prepareStatement(strinsert);
			pslogin.setString(1, userid);
			pslogin.setString(2, userpass);
			pslogin.setString(3, "student");
			int row1 = pslogin.executeUpdate();

			String sql = "insert into studentregistration(id, password, name, email, phone, gender, course)values(?,?,?,?,?,?,?)";
			pssr = con.prepareStatement(sql);
			pssr.setString(1, userid);
			pssr.setString(2, userpass);
			pssr.setString(3, username);
			pssr.setString(4, useremail);
			pssr.setString(5, userphone);
			pssr.setString(6, usergender);
			pssr.setString(7, usercourse);
			// System.out.println(pssr);
			int rw = pssr.executeUpdate();

			if (rw > 0 && row1 > 0) {
				con.commit();
				System.out.println("row inserted successfully");
				response.sendRedirect("/ecollege/jsp/index.jsp");
			}
		} catch (SQLException se) {
			System.out.println(se);
		} finally {
			try {
				if (pssr != null)
					pssr.close();
				if (pslogin != null)
					pslogin.close();
			} catch (SQLException se) {
				System.out.println(se);
			}
		}

	}

}
