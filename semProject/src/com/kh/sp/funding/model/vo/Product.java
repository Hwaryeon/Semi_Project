package com.kh.sp.funding.model.vo;

import java.io.Serializable;

public class Product implements Serializable{

	private int p_id;
	private String p_code; // 마감 종류
	private int user_id;
	private String p_name;
	private String feeType;	// 수수료
	private String content;
	private String cAmount ;
	private String p_prepar;
	private String p_intro;
	private String p_plan;
	
	public Product(){}

	public Product(String p_code, int user_id, String p_name, String feeType, String content, String cAmount) {
		super();
		this.p_code = p_code;
		this.user_id = user_id;
		this.p_name = p_name;
		this.feeType = feeType;
		this.content = content;
		this.cAmount = cAmount;
	}
	
	public Product(int p_id, String p_code, int user_id, String p_name, String feeType, String content, String cAmount,
			String p_prepar, String p_intro, String p_plan) {
		super();
		this.p_id = p_id;
		this.p_code = p_code;
		this.user_id = user_id;
		this.p_name = p_name;
		this.feeType = feeType;
		this.content = content;
		this.cAmount = cAmount;
		this.p_prepar = p_prepar;
		this.p_intro = p_intro;
		this.p_plan = p_plan;
	}

	public int getP_id() {
		return p_id;
	}

	public void setP_id(int p_id) {
		this.p_id = p_id;
	}

	public String getP_code() {
		return p_code;
	}

	public void setP_code(String p_code) {
		this.p_code = p_code;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public String getFeeType() {
		return feeType;
	}

	public void setFeeType(String feeType) {
		this.feeType = feeType;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getcAmount() {
		return cAmount;
	}

	public void setcAmount(String cAmount) {
		this.cAmount = cAmount;
	}

	public String getP_prepar() {
		return p_prepar;
	}

	public void setP_prepar(String p_prepar) {
		this.p_prepar = p_prepar;
	}

	public String getP_intro() {
		return p_intro;
	}

	public void setP_intro(String p_intro) {
		this.p_intro = p_intro;
	}

	public String getP_plan() {
		return p_plan;
	}

	public void setP_plan(String p_plan) {
		this.p_plan = p_plan;
	}

	@Override
	public String toString() {
		return "Product [p_id=" + p_id + ", p_code=" + p_code + ", user_id=" + user_id + ", p_name=" + p_name
				+ ", feeType=" + feeType + ", content=" + content + ", cAmount=" + cAmount + ", p_prepar=" + p_prepar
				+ ", p_intro=" + p_intro + ", p_plan=" + p_plan + "]";
	}
	

	
	
	
}
