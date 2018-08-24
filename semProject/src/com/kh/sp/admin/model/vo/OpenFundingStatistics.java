package com.kh.sp.admin.model.vo;

import java.sql.Date;

public class OpenFundingStatistics {
	private Date term;
	private int enrollCount;
	private int openCount;
	private int approvalRate;
	private int type1OpenCount;
	private int type2OpenCount;
	private int type3OpenCount;
	
	public OpenFundingStatistics(){}
	
	public OpenFundingStatistics(Date term, int enrollCount, int openCount, int approvalRate, int type1OpenCount,
			int type2OpenCount, int type3OpenCount) {
		super();
		this.term = term;
		this.enrollCount = enrollCount;
		this.openCount = openCount;
		this.approvalRate = approvalRate;
		this.type1OpenCount = type1OpenCount;
		this.type2OpenCount = type2OpenCount;
		this.type3OpenCount = type3OpenCount;
	}

	public Date getTerm() {
		return term;
	}

	public void setTerm(Date term) {
		this.term = term;
	}

	public int getEnrollCount() {
		return enrollCount;
	}

	public void setEnrollCount(int enrollCount) {
		this.enrollCount = enrollCount;
	}

	public int getOpenCount() {
		return openCount;
	}

	public void setOpenCount(int openCount) {
		this.openCount = openCount;
	}

	public int getApprovalRate() {
		return approvalRate;
	}

	public void setApprovalRate(int approvalRate) {
		this.approvalRate = approvalRate;
	}

	public int getType1OpenCount() {
		return type1OpenCount;
	}

	public void setType1OpenCount(int type1OpenCount) {
		this.type1OpenCount = type1OpenCount;
	}

	public int getType2OpenCount() {
		return type2OpenCount;
	}

	public void setType2OpenCount(int type2OpenCount) {
		this.type2OpenCount = type2OpenCount;
	}

	public int getType3OpenCount() {
		return type3OpenCount;
	}

	public void setType3OpenCount(int type3OpenCount) {
		this.type3OpenCount = type3OpenCount;
	}

	@Override
	public String toString() {
		return "OpenFundingStatistics [term=" + term + ", enrollCount=" + enrollCount + ", openCount=" + openCount
				+ ", approvalRate=" + approvalRate + ", type1OpenCount=" + type1OpenCount + ", type2OpenCount="
				+ type2OpenCount + ", type3OpenCount=" + type3OpenCount + "]";
	}
	
	
	

}
