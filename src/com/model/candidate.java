package com.model;

import java.util.Date;

public class candidate {
	private int regId;
	private String name;
	private String email;
	private String password;
	private String mobno;
	private String dob;
	private String course;
	public candidate(int regId, String name, String email, String password, String mobno, String dob, String course) {
		super();
		this.regId = regId;
		this.name = name;
		this.email = email;
		this.password = password;
		this.mobno = mobno;
		this.dob = dob;
		this.course = course;
	}
	public int getRegId() {
		return regId;
	}
	public void setRegId(int regId) {
		this.regId = regId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getMobno() {
		return mobno;
	}
	public void setMobno(String mobno) {
		this.mobno = mobno;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public String getCourse() {
		return course;
	}
	public void setCourse(String course) {
		this.course = course;
	}
	
	
}
