package com.controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.examDao;
import com.model.exam;

/**
 * Servlet implementation class exam_schedulerController
 */
@WebServlet("/exam_schedulerController")
public class exam_schedulerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public exam_schedulerController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession(true);
		int flag=0;
		int test=0;
		String course=request.getParameter("course");
		int tquestion=Integer.parseInt(request.getParameter("tquestion"));
		Date startdate = null;
		Date enddate=null;
		try {
			startdate=new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("startdate"));
			enddate=new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("enddate"));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String starthour=request.getParameter("starthour");
		String endhour=request.getParameter("endhour");
		System.out.println("startdate :"+startdate);
		System.out.println("starthour :"+starthour);
		System.out.println("enddate :"+enddate);
		System.out.println("endhour :"+endhour);
		
		boolean b=startdate.after(enddate);
		boolean c=startdate.equals(enddate);
		System.out.println(b);
		if(b)
		{
			test=1;
			System.out.println("hello..in B");
			flag=1;
			String str="Exam Start Date must be earlier than Exam End Date";
			session.setAttribute("date_error", str);
			response.sendRedirect("exam_scheduler.jsp");
			
		}
		if(test!=1)
		{
		if(c&&starthour.equals(endhour))
		{
			test=2;
			flag=1;
			String str="Exam start time must not be equal to Exam end time for same date";
			session.setAttribute("date_error", str);
			response.sendRedirect("exam_scheduler.jsp");
		}
		if(test!=2)
		{
			examDao ed=new examDao();
			ResultSet rs=ed.allExams();
			try {
				while(rs.next())
				{
					if(course.equals(rs.getString(2)))
					{
						test=3;
						System.out.println("hello");
						flag=1;
						String str="please Delete the previous "+course+" exam to create new one.";
						session.setAttribute("date_error", str);
						response.sendRedirect("exam_scheduler.jsp");
					}
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			if(flag==0)
			{
				int examId = 0;
				int i=0;
				ArrayList<Integer> list=new ArrayList<Integer>();
				for(i=1;i<5000;i++) {
					list.add(new Integer(i));
				}
				Collections.shuffle(list);
				for(i=1;i<=2000;i++) {
					examId=list.get(i);
				}
				
				java.sql.Date startsqldate=new java.sql.Date(startdate.getTime());
				java.sql.Date endsqldate=new java.sql.Date(enddate.getTime());
				
				System.out.println("start sql date :"+startsqldate);
				System.out.println("end sql date :"+endsqldate);
				
				exam ex=new exam(examId, course, startsqldate, starthour, endsqldate, endhour,tquestion);
				
				int j=ed.createExam(ex);
				if(j>0)
				{
					String success_msg="Exam Scheduled Sucessfully.";
					session.setAttribute("exam_success", success_msg);
					response.sendRedirect("exam_scheduler.jsp");
				}
				else
				{
					System.out.println("oops...from j");
				}
				

			}
		}
		
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
