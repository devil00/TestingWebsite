package com;
import com.ConnectionUtils;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Validation
 */
@WebServlet("/Validation")
public class Validation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Validation() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String user= request.getParameter("Email").trim();
		String passwd= request.getParameter("Passwd");
		HttpSession session=request.getSession();
		session.setAttribute("Qorder", new Integer(4));
		session.setAttribute("reject", "");
		Connection conn = null;
		try {
			conn= ConnectionUtils.getConnection();
			RequestDispatcher rd = request.getRequestDispatcher("Randomizer");
			String sql;
			if (user.equals("user1") && passwd.equals("123")){
				session.setAttribute("userId", 1);
				sql="update exam set noa = noa + 1 where id = ?";
				PreparedStatement psmt= conn.prepareStatement(sql);
				psmt.setInt(1, 1);
				psmt.executeUpdate();
				rd.forward(request, response);
			}
			else if(user.equals("user2") &&  passwd.equals("123")){
				session.setAttribute("userId", 2);
				sql="update exam set noa = noa + 1 where id = ?";
				PreparedStatement psmt= conn.prepareStatement(sql);
				psmt.setInt(1, 2);
				psmt.executeUpdate();
				rd.forward(request, response);
			}
			else{
				PrintWriter out= response.getWriter();
				out.println("<div style='background:red;'><center><p>You are not authorized</p></center></div>");
				RequestDispatcher rd1=request.getRequestDispatcher("/index.html");
				rd1.include(request, response);
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
}
