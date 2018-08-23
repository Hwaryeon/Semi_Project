package com.kh.ic.mypage.model.vo;

public class MypageDetail {
	private int p_id;//상품아이디
	private int user_id;//유저아이디
	private String p_name;//상품명
	private int invest_id;//투자번호
	private String status;//상태
	
	public MypageDetail(){}

	public MypageDetail(int p_id, int user_id, String p_name, int invest_id, String status) {
		this.p_id = p_id;
		this.user_id = user_id;
		this.p_name = p_name;
		this.invest_id = invest_id;
		this.status = status;
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
	
	
	
	
}
