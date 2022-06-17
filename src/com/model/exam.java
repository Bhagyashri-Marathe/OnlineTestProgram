package com.model;

import java.sql.Date;

public class exam {
	
	private int examId;
	private String course;
	private Date startDate;
	private String startHour;
	private Date endDate;
	private String endHour;
	private int tquestion;
	public exam(int examId, String course, Date startDate, String startHour, Date endDate, String endHour,
			int tquestion) {
		super();
		this.examId = examId;
		this.course = course;
		this.startDate = startDate;
		this.startHour = startHour;
		this.endDate = endDate;
		this.endHour = endHour;
		this.tquestion = tquestion;
	}
	public int getExamId() {
		return examId;
	}
	public void setExamId(int examId) {
		this.examId = examId;
	}
	public String getCourse() {
		return course;
	}
	public void setCourse(String course) {
		this.course = course;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public String getStartHour() {
		return startHour;
	}
	public void setStartHour(String startHour) {
		this.startHour = startHour;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public String getEndHour() {
		return endHour;
	}
	public void setEndHour(String endHour) {
		this.endHour = endHour;
	}
	public int getTquestion() {
		return tquestion;
	}
	public void setTquestion(int tquestion) {
		this.tquestion = tquestion;
	}
	
	
}
