package com.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;

import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.questionDao;
import com.model.question;

/**
 * Servlet implementation class question_bankController
 */
@WebServlet("/question_bankController")
public class question_bankController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public question_bankController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	HttpSession session=request.getSession();
		String questionText=request.getParameter("question");
		String opt1=request.getParameter("opt1");
		String opt2=request.getParameter("opt2");
		String opt3=request.getParameter("opt3");
		String opt4=request.getParameter("opt4");
		int correctOpt=Integer.parseInt(request.getParameter("correct"));
		String course=request.getParameter("course");
		//random question ID generation
		int quesId = 0;
		int i=0;
		ArrayList<Integer> list=new ArrayList<Integer>();
		for(i=1;i<5000;i++) {
			list.add(new Integer(i));
		}
		Collections.shuffle(list);
		for(i=1;i<=2000;i++) {
			quesId=list.get(i);
		}
		
		question qu=new question(quesId, questionText, opt1, opt2, opt3, opt4, correctOpt);
		questionDao qd=new questionDao();
		i=qd.addQuestion(qu, course);
		if(i>0)
		{
			String question_msg="Question saved Successfully.";
			session.setAttribute("question_success", question_msg);
			response.sendRedirect("question_bank.jsp");
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
