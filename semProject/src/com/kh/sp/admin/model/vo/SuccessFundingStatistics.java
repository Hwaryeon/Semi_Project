package com.kh.sp.admin.model.vo;

import java.sql.Date;

public class SuccessFundingStatistics  implements java.io.Serializable{
    private String term;
    private int endCount;
    private int successCount;
    private int successRate;
    private int type1SuccessCount;
    private int type1SuccessRate;
    private int type2SuccessCount;
    private int type2SuccessRate;
    private int type3SuccessCount;
    private int type3SuccessRate;
    
    public SuccessFundingStatistics(){}

	public SuccessFundingStatistics(String term, int endCount, int successCount, int successRate, int type1SuccessCount,
			int type1SuccessRate, int type2SuccessCount, int type2SuccessRate, int type3SuccessCount,
			int type3SuccessRate) {
		super();
		this.term = term;
		this.endCount = endCount;
		this.successCount = successCount;
		this.successRate = successRate;
		this.type1SuccessCount = type1SuccessCount;
		this.type1SuccessRate = type1SuccessRate;
		this.type2SuccessCount = type2SuccessCount;
		this.type2SuccessRate = type2SuccessRate;
		this.type3SuccessCount = type3SuccessCount;
		this.type3SuccessRate = type3SuccessRate;
	}

	public String getTerm() {
		return term;
	}

	public void setTerm(String term) {
		this.term = term;
	}

	public int getEndCount() {
		return endCount;
	}

	public void setEndCount(int endCount) {
		this.endCount = endCount;
	}

	public int getSuccessCount() {
		return successCount;
	}

	public void setSuccessCount(int successCount) {
		this.successCount = successCount;
	}

	public int getSuccessRate() {
		return successRate;
	}

	public void setSuccessRate(int successRate) {
		this.successRate = successRate;
	}

	public int getType1SuccessCount() {
		return type1SuccessCount;
	}

	public void setType1SuccessCount(int type1SuccessCount) {
		this.type1SuccessCount = type1SuccessCount;
	}

	public int getType1SuccessRate() {
		return type1SuccessRate;
	}

	public void setType1SuccessRate(int type1SuccessRate) {
		this.type1SuccessRate = type1SuccessRate;
	}

	public int getType2SuccessCount() {
		return type2SuccessCount;
	}

	public void setType2SuccessCount(int type2SuccessCount) {
		this.type2SuccessCount = type2SuccessCount;
	}

	public int getType2SuccessRate() {
		return type2SuccessRate;
	}

	public void setType2SuccessRate(int type2SuccessRate) {
		this.type2SuccessRate = type2SuccessRate;
	}

	public int getType3SuccessCount() {
		return type3SuccessCount;
	}

	public void setType3SuccessCount(int type3SuccessCount) {
		this.type3SuccessCount = type3SuccessCount;
	}

	public int getType3SuccessRate() {
		return type3SuccessRate;
	}

	public void setType3SuccessRate(int type3SuccessRate) {
		this.type3SuccessRate = type3SuccessRate;
	}

	@Override
	public String toString() {
		return "SuccessFundingStatistics [term=" + term + ", endCount=" + endCount + ", successCount=" + successCount
				+ ", successRate=" + successRate + ", type1SuccessCount=" + type1SuccessCount + ", type1SuccessRate="
				+ type1SuccessRate + ", type2SuccessCount=" + type2SuccessCount + ", type2SuccessRate="
				+ type2SuccessRate + ", type3SuccessCount=" + type3SuccessCount + ", type3SuccessRate="
				+ type3SuccessRate + "]";
	}

    
}
