package com.model;

public class result {
	private int userId;
	private String userName;
	private int examId;
	private String course;
	private int correct;
	private int incorrect;
	private int tquestions;
	private String resultStatus;
	/*public result(int userId, String userName, int examId, String course, int correct, int incorrect, int tquestions) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.examId = examId;
		this.course = course;
		this.correct = correct;
		this.incorrect = incorrect;
		this.tquestions = tquestions;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
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
	public int getCorrect() {
		return correct;
	}
	public void setCorrect(int correct) {
		this.correct = correct;
	}
	public int getIncorrect() {
		return incorrect;
	}
	public void setIncorrect(int incorrect) {
		this.incorrect = incorrect;
	}
	public int getTquestions() {
		return tquestions;
	}
	public void setTquestions(int tquestions) {
		this.tquestions = tquestions;
	}*/
	public result(int userId, String userName, int examId, String course, int correct, int incorrect, int tquestions,
			String resultStatus) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.examId = examId;
		this.course = course;
		this.correct = correct;
		this.incorrect = incorrect;
		this.tquestions = tquestions;
		this.resultStatus = resultStatus;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
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
	public int getCorrect() {
		return correct;
	}
	public void setCorrect(int correct) {
		this.correct = correct;
	}
	public int getIncorrect() {
		return incorrect;
	}
	public void setIncorrect(int incorrect) {
		this.incorrect = incorrect;
	}
	public int getTquestions() {
		return tquestions;
	}
	public void setTquestions(int tquestions) {
		this.tquestions = tquestions;
	}
	public String getResultStatus() {
		return resultStatus;
	}
	public void setResultStatus(String resultStatus) {
		this.resultStatus = resultStatus;
	}
	
	
	
	
	
}

