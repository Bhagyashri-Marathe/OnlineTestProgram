package com.controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.studentDao;
import com.model.candidate;

import examPortal.verify.send.SendMail;
import examPortal.verify.send.SendOtp;

/**
 * Servlet implementation class candidate_regController
 */
@WebServlet("/candidate_regController")
public class candidate_regController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public candidate_regController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 *
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		//RequestDispatcher rd=request.getRequestDispatcher("candidate_reg.jsp");
		int flag=0;
		
		String fname=request.getParameter("fname");
		String lname=request.getParameter("lname");
		String name=fname+" "+lname;
		String email=request.getParameter("email");
		String mobno=request.getParameter("mobno");
		String course=request.getParameter("course");
		String dob=request.getParameter("dob");
		
		int temp=0;
		studentDao sd=new studentDao();
		ResultSet rs=sd.students();
		try {
			while(rs.next())
			{
				if(email.equals(rs.getString(3)))
				{
					temp=1;
					flag=1;
					session.setAttribute("flag", flag);
					String email_msg="Candidate already registered with this email ID";
					session.setAttribute("regmsg", email_msg);
					/*RequestDispatcher dd = request.getRequestDispatcher("candidate_reg.jsp");
					dd.forward(request, response);*/
					response.sendRedirect("candidate_reg.jsp");
				}
				if(temp!=1)
				{
					if(mobno.equals(rs.getString(5)))
					{
						flag=1;
						session.setAttribute("flag", flag);
						String mobno_msg="Mobile Number already Registered";
						session.setAttribute("regmsg",mobno_msg);
//						RequestDispatcher dd = request.getRequestDispatcher("candidate_reg.jsp");
//						dd.forward(request, response);
						response.sendRedirect("candidate_reg.jsp");
					}
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
			SendMail se=new SendMail();
			String password=se.generateRandomPassword();
			/*final String subject = "Login Credential For TechnoGenix Institute";
			final String messg = "Dear "+fname+"\t"+lname+",\n"
					+ "Welcome To MyMoney Portal.\nMyMoney portal is a platform which you can perform transaction i.e. Send money,recharge,withdrawl,deposit etc.\n"
					+ "Accordingly, we are sending you Username & Password to access the our portal and perform the transactions.\n\n"
					+ "Username = "+email+"\n"
					+"Password = "+password+"\n\n"
					+"Regards,\n"
					+"technoGenix Team";
			int i=se.sendEmail(email, password,messg,subject);*/
			
			SendOtp so=new SendOtp();
			String msg=fname+","
					+ "Welcome to TechnoGenix Institute\nUsername : "+email+"\npassword : "+password;
			
			so.sendSms(msg, mobno);
			
			//random question ID generation
			int regId = 0;
			int i;
			ArrayList<Integer> list=new ArrayList<Integer>();
			for(i=1;i<5000;i++) {
				list.add(new Integer(i));
			}
			Collections.shuffle(list);
			for(i=1;i<=2000;i++) {
				regId=list.get(i);
			}
			
			candidate cd=new candidate(regId, name, email, password, mobno, dob, course);
			int j=sd.createStudent(cd);
			if(j>0)
			{
				String success_msg="Candidate Registered Successfully.";
				session.setAttribute("success", success_msg);
//				RequestDispatcher dd = request.getRequestDispatcher("candidate_reg.jsp");
//				dd.forward(request, response);
				response.sendRedirect("candidate_reg.jsp");
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
