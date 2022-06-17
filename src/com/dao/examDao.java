package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.model.exam;

public class examDao {
	
	Connection con=null;
	PreparedStatement pstate=null;
	ResultSet rs=null;
	int i=0;
	
	public int createExam(exam ex)
	{
		con=DbConnection.getConnection();
		try {
			pstate=con.prepareStatement("insert into exam_schedule values(?,?,?,?,?,?,?)");
			pstate.setInt(1, ex.getExamId());
			pstate.setString(2, ex.getCourse());
			pstate.setDate(3, ex.getStartDate());
			pstate.setString(4, ex.getStartHour());
			pstate.setDate(5, ex.getEndDate());
			pstate.setString(6, ex.getEndHour());
			pstate.setInt(7, ex.getTquestion());
			System.out.println("hello...");
			
			i=pstate.executeUpdate();
			System.out.println(i);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}
	public ResultSet examCount()
	{
		con=DbConnection.getConnection();
		try {
			String str="select count(*) from exam_schedule";
			Statement st=con.createStatement();
			rs=st.executeQuery(str);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	public ResultSet allExams()
	{
		con=DbConnection.getConnection();
		String str="select *from exam_schedule";
		try {
			Statement st=con.createStatement();
			rs=st.executeQuery(str);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	public int deleteExam(int examId)
	{
		con=DbConnection.getConnection();
		try {
			pstate=con.prepareStatement("delete from exam_schedule where examid=?");
			pstate.setInt(1, examId);
			i=pstate.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}
	
	public ResultSet getExamQuestions(int examId)
	{
		con=DbConnection.getConnection();
		try {
			pstate=con.prepareStatement("select total_questions from exam_schedule where examid=?");
			pstate.setInt(1, examId);
			rs=pstate.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	public ResultSet examScheduleInfo(String course)
	{
		con=DbConnection.getConnection();
		try {
			pstate=con.prepareStatement("select *from exam_schedule where course=?");
			pstate.setString(1, course);
			rs=pstate.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
		
	}

}
