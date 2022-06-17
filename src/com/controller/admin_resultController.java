package com.controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.resultDao;
import com.model.result;

import question.upload.excelsheet.resultPdf;

/**
 * Servlet implementation class admin_resultController
 */
@WebServlet("/admin_resultController")
public class admin_resultController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public admin_resultController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String course=request.getParameter("course");
		HttpSession session=request.getSession();
		String UserName=(String)session.getAttribute("loginUserName");
		List<result>rlist=new LinkedList<result>();
		resultDao rd=new resultDao();
		ResultSet rs=rd.getallresult(course);
		try {
			while(rs.next())
			{
				result r= new result(rs.getInt(1),rs.getString(2), rs.getInt(3), rs.getString(4), rs.getInt(5), rs.getInt(6), rs.getInt(7),rs.getString(8));
				rlist.add(r);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ServletContext sc=request.getServletContext();
		sc.setAttribute("rl", rlist);
		request.setAttribute("resultList", rlist);
		RequestDispatcher rds=request.getRequestDispatcher("admin_result.jsp");
		rds.forward(request, response);
		
	}
	
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
