package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.examDao;
import com.dao.questionDao;
import com.dao.resultDao;

/**
 * Servlet implementation class delete_examController
 */
@WebServlet("/delete_examController")
public class delete_examController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public delete_examController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		String course=request.getParameter("course");
		System.out.println(course);
		String examId=request.getParameter("examId");
		int eno=Integer.parseInt(examId);
		System.out.println(eno);
		resultDao rsd=new resultDao();
		int i=rsd.delete_result(course);
		if(i>0)
		{
			System.out.println("result deleted successfully");
		}
		
		examDao ed=new examDao();
		i=ed.deleteExam(eno);
		if(i>0)
		{
			String delete_msg="Exam Deleted Sucessfully.";
			session.setAttribute("exam_delete", delete_msg);
			response.sendRedirect("exam_scheduler.jsp");
		}
	
		questionDao qd=new questionDao();
		i=qd.truncate_table(course);
		if(i>0)
		{
			System.out.println("table truncated successfully..");
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
