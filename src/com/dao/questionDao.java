package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;


import com.model.question;

public class questionDao {
	
	Connection con=null;
	PreparedStatement pstate=null;
	ResultSet rs=null;
	int i=0;
	
	public int addQuestion(question qu,String course)
	{
		System.out.println("in dao...."+course);
		con=DbConnection.getConnection();
		try {
			pstate=con.prepareStatement("insert into "+course+" values(?,?,?,?,?,?,?)");
			pstate.setInt(1, qu.getQuesId());
			pstate.setString(2, qu.getQuestionText());
			pstate.setString(3, qu.getOpt1());
			pstate.setString(4, qu.getOpt2());
			pstate.setString(5, qu.getOpt3());
			pstate.setString(6, qu.getOpt4());
			pstate.setInt(7, qu.getCorrectOpt());
			
			i=pstate.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}
	
	public int addExcelQuestion(List<question> queslist,String course)
	{
		
		Connection con=DbConnection.getConnection();
		for (question qu : queslist) {
			try {
				pstate=con.prepareStatement("insert into "+course+" values(?,?,?,?,?,?,?)");
				pstate.setInt(1, qu.getQuesId());
				pstate.setString(2, qu.getQuestionText());
				pstate.setString(3, qu.getOpt1());
				pstate.setString(4, qu.getOpt2());
				pstate.setString(5, qu.getOpt3());
				pstate.setString(6, qu.getOpt4());
				pstate.setInt(7, qu.getCorrectOpt());
				
				i=pstate.executeUpdate();
				System.out.println(i);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return i;
	}
	public int truncate_table(String course)
	{
		con=DbConnection.getConnection();
		try {
			pstate=con.prepareStatement("truncate table "+course);
			i=pstate.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
		
	}
	public ResultSet exam_questions(String course)
	{
		con=DbConnection.getConnection();
		String str="select *from "+course+" order by dbms_random.value";
		try {
			Statement st=con.createStatement();
			rs=st.executeQuery(str);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	/*public ResultSet getCorrectAns(int questionId,String course)
	{
		Connection con=null;
		System.out.println("hello...in exam dao");
		con=DbConnection.getConnection();
		try {
			
			pstate=con.prepareStatement("select correct_option from "+course+" where question_id=?");
			pstate.setInt(1, questionId);
			rs=pstate.executeQuery();
			
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return rs;
	}*/
	
	public ResultSet getCorrectAns(String course)
	{
		
		System.out.println("hello...in exam dao");
		con=DbConnection.getConnection();
		try {
			String str="select *from "+course;
			Statement st=con.createStatement();
			rs=st.executeQuery(str);
			
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return rs;
	}
}
