package com.kh.sp.project.model.vo;

import java.sql.Date;

public class Application implements java.io.Serializable{
	private int pId;
	private Date processingDate;
	private Date applicationDate;
	private String dlineCode;
	private String projectPlan;
	private String projectIntro;
	private String projectPrepare;
	private String intro;
	private String titleImg;
	private int amount;
	
	
	public Application(int pId, Date processingDate, Date applicationDate, String dlineCode, String projectPlan,
			String projectIntro, String projectPrepare, String intro, String titleImg, int amount) {
		super();
		this.pId = pId;
		this.processingDate = processingDate;
		this.applicationDate = applicationDate;
		this.dlineCode = dlineCode;
		this.projectPlan = projectPlan;
		this.projectIntro = projectIntro;
		this.projectPrepare = projectPrepare;
		this.intro = intro;
		this.titleImg = titleImg;
		this.amount = amount;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public Application(int pId, Date processingDate, Date applicationDate, String dlineCode, String projectPlan,
			String projectIntro, String projectPrepare, String intro, String titleImg) {
		super();
		this.pId = pId;
		this.processingDate = processingDate;
		this.applicationDate = applicationDate;
		this.dlineCode = dlineCode;
		this.projectPlan = projectPlan;
		this.projectIntro = projectIntro;
		this.projectPrepare = projectPrepare;
		this.intro = intro;
		this.titleImg = titleImg;
	}
	public String getTitleImg() {
		return titleImg;
	}
	public void setTitleImg(String titleImg) {
		this.titleImg = titleImg;
	}
	public Application() {}
	public int getpId() {
		return pId;
	}
	public void setpId(int pId) {
		this.pId = pId;
	}
	public Date getProcessingDate() {
		return processingDate;
	}
	public void setProcessingDate(Date processingDate) {
		this.processingDate = processingDate;
	}
	public Date getApplicationDate() {
		return applicationDate;
	}
	public void setApplicationDate(Date applicationDate) {
		this.applicationDate = applicationDate;
	}
	public String getDlineCode() {
		return dlineCode;
	}
	public void setDlineCode(String dlineCode) {
		this.dlineCode = dlineCode;
	}
	public String getProjectPlan() {
		return projectPlan;
	}
	public void setProjectPlan(String projectPlan) {
		this.projectPlan = projectPlan;
	}
	public String getProjectIntro() {
		return projectIntro;
	}
	public void setProjectIntro(String projectIntro) {
		this.projectIntro = projectIntro;
	}
	public String getProjectPrepare() {
		return projectPrepare;
	}
	public void setProjectPrepare(String projectPrepare) {
		this.projectPrepare = projectPrepare;
	}
	
	@Override
	public String toString() {
		return "Application [pId=" + pId + ", processingDate=" + processingDate + ", applicationDate=" + applicationDate
				+ ", dlineCode=" + dlineCode + ", projectPlan=" + projectPlan + ", projectIntro=" + projectIntro
				+ ", projectPrepare=" + projectPrepare + ", intro=" + intro + ", titleImg=" + titleImg + ", amount="
				+ amount + "]";
	}
	
	
	
}
