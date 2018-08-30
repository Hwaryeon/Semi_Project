package com.kh.sp.myPage.model.vo;

public class MypageDetail {
	private int p_id;//상품아이디
	private int user_id;//유저아이디
	private String p_name;//상품명
	private int invest_id;//투자번호
	private String status;//상태
	private String pay_date;//결제날짜
	private int price;//금액
	private String pay_class;//결제/환불 여부
	
	public MypageDetail(){}

	public MypageDetail(int p_id, int user_id, String p_name, int invest_id, String status, String pay_date, int price, String pay_class) {
		this.p_id = p_id;
		this.user_id = user_id;
		this.p_name = p_name;
		this.invest_id = invest_id;
		this.status = status;
		this.pay_date = pay_date;
		this.price = price;
		this.pay_class = pay_class;
	}

	public int getP_id() {
		return p_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public String getP_name() {
		return p_name;
	}

	public int getInvest_id() {
		return invest_id;
	}

	public String getStatus() {
		return status;
	}

	public void setP_id(int p_id) {
		this.p_id = p_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public void setInvest_id(int invest_id) {
		this.invest_id = invest_id;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getPay_date() {
		return pay_date;
	}

	public void setPay_date(String pay_date) {
		this.pay_date = pay_date;
	}

	public int getPrice() {
		return price;
	} 

	public void setPrice(int price) {
		this.price = price;
	}

	public String getPay_class() {
		return pay_class;
	}

	public void setPay_class(String pay_class) {
		this.pay_class = pay_class;
	}
	
	
	
	
}
