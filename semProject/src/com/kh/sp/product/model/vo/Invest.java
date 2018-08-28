package com.kh.sp.product.model.vo;

public class Invest implements java.io.Serializable{
	String investId; 
	int userId;
	int pId;
	int price;
	
	
	
	public Invest() {}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getInvestId() {
		return investId;
	}
	public void setInvestId(String investId) {
		this.investId = investId;
	}
	public int getUserId() {
		return userId;
	}
	public Invest(String investId, int userId, int pId, int price) {
		super();
		this.investId = investId;
		this.userId = userId;
		this.pId = pId;
		this.price = price;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getpId() {
		return pId;
	}
	public void setpId(int pId) {
		this.pId = pId;
	}
	@Override
	public String toString() {
		return "Invest [investId=" + investId + ", userId=" + userId + ", pId=" + pId + ", price=" + price + "]";
	}
	
	
}
