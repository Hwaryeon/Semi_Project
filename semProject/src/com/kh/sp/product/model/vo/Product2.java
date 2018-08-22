package com.kh.sp.product.model.vo;

public class Product2 implements java.io.Serializable{
	private int pid;
	private String pCode;
	private String UserId;
	private String pName;
	private String interestRate;
	private String pPreparation;
	private String pIntroduction;
	private String pPlan;
	private int purpose;
	private int present;
	private String proPlan;
	private String img;
	private String pno;
	private String shortintro;
	
	

	public Product2 (){}
	
	public Product2(int pid, String pCode, String userId, String pName, String interestRate, String pPreparation,
			String pIntroduction, String pPlan, int purpose, int present, String proPlan, String img, String pno,
			String shortintro) {
		super();
		this.pid = pid;
		this.pCode = pCode;
		this.UserId = userId;
		this.pName = pName;
		this.interestRate = interestRate;
		this.pPreparation = pPreparation;
		this.pIntroduction = pIntroduction;
		this.pPlan = pPlan;
		this.purpose = purpose;
		this.present = present;
		this.proPlan = proPlan;
		this.img = img;
		this.pno = pno;
		this.shortintro = shortintro;
	}

	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getpCode() {
		return pCode;
	}
	public void setpCode(String pCode) {
		this.pCode = pCode;
	}
	public String getUserId() {
		return UserId;
	}
	public void setUserId(String userId) {
		UserId = userId;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public String getInterestRate() {
		return interestRate;
	}
	public void setInterestRate(String interestRate) {
		this.interestRate = interestRate;
	}
	public String getpPreparation() {
		return pPreparation;
	}
	public void setpPreparation(String pPreparation) {
		this.pPreparation = pPreparation;
	}
	public String getpIntroduction() {
		return pIntroduction;
	}
	public void setpIntroduction(String pIntroduction) {
		this.pIntroduction = pIntroduction;
	}
	public String getpPlan() {
		return pPlan;
	}
	public void setpPlan(String pPlan) {
		this.pPlan = pPlan;
	}
	public int getPurpose() {
		return purpose;
	}
	public void setPurpose(int purpose) {
		this.purpose = purpose;
	}
	public int getPresent() {
		return present;
	}
	public void setPresent(int present) {
		this.present = present;
	}
	public String getProPlan() {
		return proPlan;
	}
	public void setProPlan(String proPlan) {
		this.proPlan = proPlan;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getPno() {
		return pno;
	}
	public void setPno(String pno) {
		this.pno = pno;
	}
	public String getShortintro() {
		return shortintro;
	}

	public void setShortintro(String shortintro) {
		this.shortintro = shortintro;
	}

	@Override
	public String toString() {
		return "Product [pid=" + pid + ", pCode=" + pCode + ", UserId=" + UserId + ", pName=" + pName
				+ ", interestRate=" + interestRate + ", pPreparation=" + pPreparation + ", pIntroduction="
				+ pIntroduction + ", pPlan=" + pPlan + ", purpose=" + purpose + ", present=" + present + ", proPlan="
				+ proPlan + ", img=" + img + ", pno=" + pno + ", shortintro=" + shortintro + "]";
	}
	
}
