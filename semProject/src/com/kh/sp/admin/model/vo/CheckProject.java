package com.kh.sp.admin.model.vo;

import java.sql.Date;

public class CheckProject implements java.io.Serializable {
	
	private Date test;
	private int result;
	
	
	//MEMBER Table
	private String m_userName;
	
	
	//INVEST_RECORD Table
	private int ir_iRecordId;
	private int ir_investId;
	private String ir_payClass;
	private String ir_price;
	private Date ir_payDate;
	
	//INVESTMENT Table
	private int i_investId;
	private int i_userId;
	private int i_pId;
	
	//P_TYPE Table
	private String pt_pId;
	private String pt_pName;
	private float pt_fees;
	
	//PRODUCT Table
	
	private int p_pId;
	private String p_pCode;
	private int p_userId;
	private String p_pName;
	private int p_openDate;
	private int p_closingAmount;
	private String p_interestRate;
	private int p_repayDate;
	private int p_amount;
	
	//PRODUCT_RECORD Table
	
	private int pr_pRecordId;
	private int pr_pId;
	private Date pr_startDate;
	private String pr_status;
	
	
	public CheckProject(){}



	@Override
	public String toString() {
		return "CheckProject [test=" + test + ", result=" + result + ", m_userName=" + m_userName + ", ir_iRecordId="
				+ ir_iRecordId + ", ir_investId=" + ir_investId + ", ir_payClass=" + ir_payClass + ", ir_price="
				+ ir_price + ", ir_payDate=" + ir_payDate + ", i_investId=" + i_investId + ", i_userId=" + i_userId
				+ ", i_pId=" + i_pId + ", pt_pId=" + pt_pId + ", pt_pName=" + pt_pName + ", pt_fees=" + pt_fees
				+ ", p_pId=" + p_pId + ", p_pCode=" + p_pCode + ", p_userId=" + p_userId + ", p_pName=" + p_pName
				+ ", p_openDate=" + p_openDate + ", p_closingAmount=" + p_closingAmount + ", p_interestRate="
				+ p_interestRate + ", p_repayDate=" + p_repayDate + ", p_amount=" + p_amount + ", pr_pRecordId="
				+ pr_pRecordId + ", pr_pId=" + pr_pId + ", pr_startDate=" + pr_startDate + ", pr_status=" + pr_status
				+ "]";
	}


	public CheckProject(Date test, int result, String m_userName, int ir_iRecordId, int ir_investId, String ir_payClass,
			String ir_price, Date ir_payDate, int i_investId, int i_userId, int i_pId, String pt_pId, String pt_pName,
			float pt_fees, int p_pId, String p_pCode, int p_userId, String p_pName, int p_openDate, int p_closingAmount,
			String p_interestRate, int p_repayDate, int p_amount, int pr_pRecordId, int pr_pId, Date pr_startDate,
			String pr_status) {
		super();
		this.test = test;
		this.result = result;
		this.m_userName = m_userName;
		this.ir_iRecordId = ir_iRecordId;
		this.ir_investId = ir_investId;
		this.ir_payClass = ir_payClass;
		this.ir_price = ir_price;
		this.ir_payDate = ir_payDate;
		this.i_investId = i_investId;
		this.i_userId = i_userId;
		this.i_pId = i_pId;
		this.pt_pId = pt_pId;
		this.pt_pName = pt_pName;
		this.pt_fees = pt_fees;
		this.p_pId = p_pId;
		this.p_pCode = p_pCode;
		this.p_userId = p_userId;
		this.p_pName = p_pName;
		this.p_openDate = p_openDate;
		this.p_closingAmount = p_closingAmount;
		this.p_interestRate = p_interestRate;
		this.p_repayDate = p_repayDate;
		this.p_amount = p_amount;
		this.pr_pRecordId = pr_pRecordId;
		this.pr_pId = pr_pId;
		this.pr_startDate = pr_startDate;
		this.pr_status = pr_status;
	}



	public Date getTest() {
		return test;
	}




	public void setTest(Date test) {
		this.test = test;
	}





	public int getResult() {
		return result;
	}


	public void setResult(int result) {
		this.result = result;
	}


	public int getIr_iRecordId() {
		return ir_iRecordId;
	}


	public void setIr_iRecordId(int ir_iRecordId) {
		this.ir_iRecordId = ir_iRecordId;
	}


	public int getIr_investId() {
		return ir_investId;
	}


	public void setIr_investId(int ir_investId) {
		this.ir_investId = ir_investId;
	}


	public String getIr_payClass() {
		return ir_payClass;
	}


	public void setIr_payClass(String ir_payClass) {
		this.ir_payClass = ir_payClass;
	}


	public String getIr_price() {
		return ir_price;
	}


	public void setIr_price(String ir_price) {
		this.ir_price = ir_price;
	}


	public Date getIr_payDate() {
		return ir_payDate;
	}


	public void setIr_payDate(Date ir_payDate) {
		this.ir_payDate = ir_payDate;
	}


	public int getI_investId() {
		return i_investId;
	}


	public void setI_investId(int i_investId) {
		this.i_investId = i_investId;
	}


	public int getI_userId() {
		return i_userId;
	}


	public void setI_userId(int i_userId) {
		this.i_userId = i_userId;
	}


	public int getI_pId() {
		return i_pId;
	}


	public void setI_pId(int i_pId) {
		this.i_pId = i_pId;
	}


	public String getPt_pId() {
		return pt_pId;
	}


	public void setPt_pId(String pt_pId) {
		this.pt_pId = pt_pId;
	}


	public String getPt_pName() {
		return pt_pName;
	}


	public void setPt_pName(String pt_pName) {
		this.pt_pName = pt_pName;
	}


	public float getPt_fees() {
		return pt_fees;
	}


	public void setPt_fees(float pt_fees) {
		this.pt_fees = pt_fees;
	}


	public int getP_pId() {
		return p_pId;
	}


	public void setP_pId(int p_pId) {
		this.p_pId = p_pId;
	}


	public String getP_pCode() {
		return p_pCode;
	}


	public void setP_pCode(String p_pCode) {
		this.p_pCode = p_pCode;
	}


	public int getP_userId() {
		return p_userId;
	}


	public void setP_userId(int p_userId) {
		this.p_userId = p_userId;
	}


	public String getP_pName() {
		return p_pName;
	}


	public void setP_pName(String p_pName) {
		this.p_pName = p_pName;
	}


	public int getP_openDate() {
		return p_openDate;
	}


	public void setP_openDate(int p_openDate) {
		this.p_openDate = p_openDate;
	}


	public int getP_closingAmount() {
		return p_closingAmount;
	}


	public void setP_closingAmount(int p_closingAmount) {
		this.p_closingAmount = p_closingAmount;
	}


	public String getP_interestRate() {
		return p_interestRate;
	}


	public void setP_interestRate(String p_interestRate) {
		this.p_interestRate = p_interestRate;
	}


	public int getP_repayDate() {
		return p_repayDate;
	}


	public void setP_repayDate(int p_repayDate) {
		this.p_repayDate = p_repayDate;
	}


	public int getP_amount() {
		return p_amount;
	}


	public void setP_amount(int p_amount) {
		this.p_amount = p_amount;
	}


	public int getPr_pRecordId() {
		return pr_pRecordId;
	}


	public void setPr_pRecordId(int pr_pRecordId) {
		this.pr_pRecordId = pr_pRecordId;
	}


	public int getPr_pId() {
		return pr_pId;
	}


	public void setPr_pId(int pr_pId) {
		this.pr_pId = pr_pId;
	}


	public Date getPr_startDate() {
		return pr_startDate;
	}


	public void setPr_startDate(Date pr_startDate) {
		this.pr_startDate = pr_startDate;
	}


	public String getPr_status() {
		return pr_status;
	}


	public void setPr_status(String pr_status) {
		this.pr_status = pr_status;
	}


	public String getM_userName() {
		return m_userName;
	}


	public void setM_userName(String m_userName) {
		this.m_userName = m_userName;
	}






	


	
	
}
