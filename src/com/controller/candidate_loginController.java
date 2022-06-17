package com.controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.studentDao;

/**
 * Servlet implementation class candidate_loginController
 */
@WebServlet("/candidate_loginController")
public class candidate_loginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public candidate_loginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uname=request.getParameter("uname");
		String password=request.getParameter("pass");
		System.out.println(uname+" "+password);
		HttpSession session=request.getSession();
		studentDao sd=new studentDao();
		ResultSet rs=sd.validateStudent(uname, password);
		
		try {
			if(rs.next())
			{
				if(rs.getInt(8)==0)
				{
					sd.loginUpdateStatus(rs.getInt(1));
					session.setAttribute("loginUserId", rs.getInt(1));
					session.setAttribute("loginUserName", rs.getString(2));
					session.setAttribute("loginUserCourse", rs.getString(7));
					session.setAttribute("login", "true");
					response.sendRedirect("student_dashboard.jsp");
				}
				else
				{
					String str="Your Last session was not properly Logged Out..!!\nContact To TechnoGenix Support Team";
					session.setAttribute("error", "true");
					session.setAttribute("loginError", str);
					response.sendRedirect("candidate_login.jsp");
					
				}
				
			}
			else
			{
				String str="invalid credentials...try again";
				session.setAttribute("error", "true");
				session.setAttribute("err_msg",str );
				response.sendRedirect("candidate_login.jsp");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
