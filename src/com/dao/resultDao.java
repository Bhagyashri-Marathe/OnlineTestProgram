package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.model.result;

public class resultDao {
	
	Connection con=null;
	PreparedStatement pstate=null;
	ResultSet rs=null;
	int i=0;
	
	public int insertResult(result r)
	{
		con=DbConnection.getConnection();
		try {
			pstate=con.prepareStatement("insert into exam_result values(?,?,?,?,?,?,?,?)");
			pstate.setInt(1,r.getUserId());
			pstate.setString(2, r.getUserName());
			pstate.setInt(3, r.getExamId());
			pstate.setString(4, r.getCourse());
			pstate.setInt(5, r.getCorrect());
			pstate.setInt(6, r.getIncorrect());
			pstate.setInt(7, r.getTquestions());
			pstate.setString(8, r.getResultStatus());
			i=pstate.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}
	public ResultSet getallresult(String course)
	{
		con=DbConnection.getConnection();
		try {
			pstate=con.prepareStatement("select *from exam_result where course=?");
			pstate.setString(1, course);
			rs=pstate.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	public ResultSet getexamResult(int userId)
	{
		con=DbConnection.getConnection();
		try {
			pstate=con.prepareStatement("select *from exam_result where userId=?");
			pstate.setInt(1, userId);
			rs=pstate.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	   return rs;
	}
	
	public int delete_result(String course)
	{
		con=DbConnection.getConnection();
		try {
			pstate=con.prepareStatement("delete from exam_result where course=?");
			pstate.setString(1, course);
			
			i=pstate.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}
	public ResultSet checkResultRecord(int userId,int examId)
	{
		con=DbConnection.getConnection();
		try {
			pstate=con.prepareStatement("select *from exam_Result where examid=? and userid=?");
			pstate.setInt(1, examId);
			pstate.setInt(2, userId);
			
			rs=pstate.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}

}
