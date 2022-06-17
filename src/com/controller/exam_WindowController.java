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

import com.dao.examDao;
import com.dao.questionDao;
import com.dao.resultDao;
import com.model.result;

/**
 * Servlet implementation class exam_WindowController
 */
@WebServlet("/exam_WindowController")
public class exam_WindowController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public exam_WindowController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		HttpSession session=request.getSession();
		String userName=(String)session.getAttribute("loginUserName");
		int userId=(int)session.getAttribute("loginUserId");
		int examId=(int)session.getAttribute("loginUserExamId");
		String course=(String)session.getAttribute("loginUserCourse");
		int tquestions=0;
		int correct=0;
		int incorrect=0;
		examDao ed=new examDao();
		ResultSet rs=ed.getExamQuestions(examId);
		try {
			if(rs.next())
			{
				tquestions=rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		int x=Integer.parseInt(request.getParameter("question1_id"));
		System.out.println(x);


		int unattempt=0;
		questionDao qd=new questionDao();
		rs=qd.getCorrectAns(course);
		/*for(int i=1;i<=tquestions;i++)
		{
			int option=0;
			int questionId=Integer.parseInt(request.getParameter("question"+i+"_id"));
			String s_option=request.getParameter("question"+i+"_option");

			if(s_option==null)
			{
				unattempt++;

			}
			else
			{
				int k=Integer.parseInt(s_option);
				option=k;
			}*/

		try {
			while(rs.next())
			{
				for(int i=1;i<=tquestions;i++)
				{
					int option=0;
					int questionId=Integer.parseInt(request.getParameter("question"+i+"_id"));
					String s_option=request.getParameter("question"+i+"_option");

					if(s_option==null)
					{
						unattempt++;

					}
					else
					{
						int k=Integer.parseInt(s_option);
						option=k;
					}
					if(rs.getInt(1)==questionId)
					{
						System.out.println(i+"="+option);
						if(option==rs.getInt(7))
						{
							correct++;
						}
						else
						{
							incorrect++;
						}
					}
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//System.out.println("question id= "+questionId+" option= "+option+"\n");

		/* rs=qd.getCorrectAns(questionId, course);
			 try {
				if(rs.next())
				 {
					System.out.println(i+"="+option);
						if(option==rs.getInt(1))
						 {
							 correct++;
						 }
						 else
						 {
							 incorrect++;
						 }

				 }
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}*/



		//}
		System.out.println(unattempt);

		int cutoff=tquestions/2;
		String resultStatus=null;

		if(correct>cutoff)
		{
			resultStatus="PASS";
		}
		else
		{
			resultStatus="FAIL";
		}

		result r=new result(userId,userName, examId, course, correct, incorrect, tquestions,resultStatus);

		resultDao rd=new resultDao();
		int i=rd.insertResult(r);
		if(i>0)
		{
			System.out.println("result successfully saved");
			response.sendRedirect("student_dashboard.jsp");
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
