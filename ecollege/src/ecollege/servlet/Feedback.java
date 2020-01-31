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
 * Servlet implementation class Feedback
 */
@WebServlet("/Feedback")
public class Feedback extends HttpServlet {
	private static final long serialVersionUID = 1L;
            private Connection con;
            private PreparedStatement psfeedback;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Feedback() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username=request.getParameter("txtname");
		String userarea=request.getParameter("txtarea");
		String useremail=request.getParameter("txtemail");
		
		//System.out.println(username+userarea+useremail);
		
		con = CrudOperation.createConnection();
		try {
			String sql = "insert into feedback(username, email, message)values(?,?,?)";
			psfeedback = con.prepareStatement(sql); //pass to DBMS query compile and will store in buffer
			psfeedback.setString(1, username);
			psfeedback.setString(2, useremail);
			psfeedback.setString(3, userarea);
			System.out.println(psfeedback);
		    int rw = psfeedback.executeUpdate();  //to fire insert update delete query
			
			if(rw > 0) {
				System.out.println("row inserted successfully");
			}
			
		} catch(SQLException se) {
			System.out.println(se);
		}
    
	}

}
