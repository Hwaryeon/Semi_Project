package com.kh.sp.funding.model.vo;

import java.io.Serializable;

public class ProductType implements Serializable {
	private int pCode;
	private String pName;
	private int p_fees;
	
	public ProductType(){}

	public ProductType(int pCode, String pName, int p_fees) {
		super();
		this.pCode = pCode;
		this.pName = pName;
		this.p_fees = p_fees;
	}

	public int getpCode() {
		return pCode;
	}

	public void setpCode(int pCode) {
		this.pCode = pCode;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public int getP_fees() {
		return p_fees;
	}

	public void setP_fees(int p_fees) {
		this.p_fees = p_fees;
	}

	@Override
	public String toString() {
		return "productType [pCode=" + pCode + ", pName=" + pName + ", p_fees=" + p_fees + "]";
	}
	
	
	
	
}
