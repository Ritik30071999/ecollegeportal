package ecollege.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ecollege.dbtasks.CrudOperation;

import java.sql.*;

/**
 * Servlet implementation class St_EditProfile
 */
@WebServlet("/St_EditProfile")
public class St_EditProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection cn;
	private PreparedStatement ps;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public St_EditProfile() {
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

		HttpSession hs = request.getSession(false);
		String id = (String) hs.getAttribute("sessionkey");

		String email = request.getParameter("txtemail");
		String pass = request.getParameter("txtpass");
		String phone = request.getParameter("txtphone");

		cn = CrudOperation.createConnection();

		try {
			String strupdate = "update studentregistration set email=?, phone=?, password=? where id=?";
			ps = cn.prepareStatement(strupdate);
			ps.setString(1, email);
			ps.setString(2, phone);
			ps.setString(3, pass);
			ps.setString(4, id);
			System.out.println(ps);

			int row = ps.executeUpdate();
			if (row > 0) {
				System.out.println("row updated");
				response.sendRedirect("/ecollege/jsp/studenthome.jsp");
			}

		} catch (SQLException se) {
			System.out.println(se);
		}

	}
}