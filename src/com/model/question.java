package com.model;

public class question {
	private int quesId;
	private String questionText;
	private String opt1;
	private String opt2;
	private String opt3;
	private String opt4;
	private int correctOpt;
	public question(int quesId, String questionText, String opt1, String opt2, String opt3, String opt4,
			int correctOpt) {
		super();
		this.quesId = quesId;
		this.questionText = questionText;
		this.opt1 = opt1;
		this.opt2 = opt2;
		this.opt3 = opt3;
		this.opt4 = opt4;
		this.correctOpt = correctOpt;
	}
	public int getQuesId() {
		return quesId;
	}
	public void setQuesId(int quesId) {
		this.quesId = quesId;
	}
	public String getQuestionText() {
		return questionText;
	}
	public void setQuestionText(String questionText) {
		this.questionText = questionText;
	}
	public String getOpt1() {
		return opt1;
	}
	public void setOpt1(String opt1) {
		this.opt1 = opt1;
	}
	public String getOpt2() {
		return opt2;
	}
	public void setOpt2(String opt2) {
		this.opt2 = opt2;
	}
	public String getOpt3() {
		return opt3;
	}
	public void setOpt3(String opt3) {
		this.opt3 = opt3;
	}
	public String getOpt4() {
		return opt4;
	}
	public void setOpt4(String opt4) {
		this.opt4 = opt4;
	}
	public int getCorrectOpt() {
		return correctOpt;
	}
	public void setCorrectOpt(int correctOpt) {
		this.correctOpt = correctOpt;
	}
	
	
	
}
