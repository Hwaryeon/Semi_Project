package com.kh.sp.product.model.vo;

import java.sql.Date;

public class InvestRecord {
	int recordId;
	int investId;
	String payClass;
	int price;
	Date payDate;
	String Status;
	
	public InvestRecord() {}
	
	public int getRecordId() {
		return recordId;
	}
	public void setRecordId(int recordId) {
		this.recordId = recordId;
	}
	public int getInvestId() {
		return investId;
	}
	public void setInvestId(int investId) {
		this.investId = investId;
	}
	public String getPayClass() {
		return payClass;
	}
	public void setPayClass(String payClass) {
		this.payClass = payClass;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public Date getPayDate() {
		return payDate;
	}
	public void setPayDate(Date payDate) {
		this.payDate = payDate;
	}
	public String getStatus() {
		return Status;
	}
	public void setStatus(String status) {
		Status = status;
	}
	@Override
	public String toString() {
		return "InvestRecord [recordId=" + recordId + ", investId=" + investId + ", payClass=" + payClass + ", price="
				+ price + ", payDate=" + payDate + ", Status=" + Status + "]";
	}
	public InvestRecord(int recordId, int investId, String payClass, int price, Date payDate, String status) {
		super();
		this.recordId = recordId;
		this.investId = investId;
		this.payClass = payClass;
		this.price = price;
		this.payDate = payDate;
		this.Status = status;
	}
	
	
}
