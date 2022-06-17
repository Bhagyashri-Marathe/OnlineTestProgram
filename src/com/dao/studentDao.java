package com.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.model.candidate;

public class studentDao {
	Connection con=null;
	PreparedStatement pstate=null;
	int i=0;
	ResultSet rs=null;
	public int createStudent(candidate cd)
	{
		System.out.println("hello....inside dao");
		con=DbConnection.getConnection();
		try {
			pstate=con.prepareStatement("insert into exam_student values (?,?,?,?,?,?,?,default)");
			pstate.setInt(1, cd.getRegId());
			pstate.setString(2, cd.getName());
			pstate.setString(3, cd.getEmail());
			pstate.setString(4, cd.getPassword());
			pstate.setString(5, cd.getMobno());
			pstate.setString(6,cd.getDob());
			pstate.setString(7, cd.getCourse());
			
			
			i=pstate.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		
		}
		return i;
	}
	public ResultSet validateStudent(String uname,String pass)
	{
		System.out.println("in dao "+uname+" "+pass);
		con=DbConnection.getConnection();
		try {
			PreparedStatement pstate=con.prepareStatement("select *from exam_student where email=? and password=?");
			pstate.setString(1, uname);
			pstate.setString(2, pass);
			rs=pstate.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	public int loginUpdateStatus(int userId)
	{
		con=DbConnection.getConnection();
		try {
			pstate=con.prepareStatement("update  exam_student set login_status=? where regid=?");
			pstate.setInt(1, 1);
			pstate.setInt(2, userId);
			i=pstate.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}
	
	public int logoutUpdateStatus(int userId)
	{
		con=DbConnection.getConnection();
		try {
			pstate=con.prepareStatement("update exam_student set login_status=? where regid=?");
			pstate.setInt(1, 0);
			pstate.setInt(2, userId);
			i=pstate.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}
	public ResultSet students()
	{
		con=DbConnection.getConnection();
		String str="select *from exam_student";
		try {
			Statement st=con.createStatement();
			rs=st.executeQuery(str);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	
	public ResultSet reg_studentCount()
	{
		con=DbConnection.getConnection();
		try {
			String str="select count(*) from exam_student";
			Statement st=con.createStatement();
			rs=st.executeQuery(str);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	public ResultSet allCandidate(String course)
	{
		con=DbConnection.getConnection();
		try {
			pstate=con.prepareStatement("select *from exam_student where course=?");
			pstate.setString(1, course);
			rs=pstate.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	
	public ResultSet loginCandData(int userId)
	{
		con=DbConnection.getConnection();
		try {
			pstate=con.prepareStatement("select *from exam_student where regid=?");
			pstate.setInt(1, userId);
			rs = pstate.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
}
