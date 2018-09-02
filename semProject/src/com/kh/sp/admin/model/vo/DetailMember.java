package com.kh.sp.admin.model.vo;
import java.sql.Date;

public class DetailMember implements java.io.Serializable{

		private String fee;
	    private int productCount;		//한 사업자가 개설한 펀딩 수
	    private int finalResult;	//한 사업자가 받은 투자 금액
	    private Date test;			//마감날짜
		private String result; 		//달성률
		private int totalInvest;	//투자자가 투자한 총 금액
		private int count;			//투자한 횟수
		
	    private int userId;
	    private String platformType;
	    private String refreshToken;
	    private String email;
	    private String userPwd;
	    private String userName;
	    private String nickName;
	    private String phone;
	    private String investorGrade;
	    private String investmentLimit;
	    private String businessLicenseNo;
	    private String corporateRegistrationNo;
	    private String corporateName;
	    private String address;
	    private String userClass;
	    private Date enrollDate;
	    private String status;
	    private String pwdStatus;
	    private String platformId;
	    private String gradingStatus;
	    private String b_reason;
	    private Date b_enrollDate;

	   
	    
	    //INVEST_RECORD Table
	    private int ir_iRecordId;
	    private int ir_investId;
	    private String ir_payClass;
	    private Date ir_payDate;
	    
	    //INVESTMENT Table
	    private int i_investId;
	    private int i_userId;
	    private int i_pId;
	    

		
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
	    
	    
	    public DetailMember(){}


	    
	    
	    
		public int getTotalInvest() {
			return totalInvest;
		}





		public void setTotalInvest(int totalInvest) {
			this.totalInvest = totalInvest;
		}





		public int getCount() {
			return count;
		}





		public void setCount(int count) {
			this.count = count;
		}





		public String getFee() {
			return fee;
		}



		public void setFee(String fee) {
			this.fee = fee;
		}



		public int getUserId() {
			return userId;
		}


		public void setUserId(int userId) {
			this.userId = userId;
		}


		public String getPlatformType() {
			return platformType;
		}


		public void setPlatformType(String platformType) {
			this.platformType = platformType;
		}


		public String getRefreshToken() {
			return refreshToken;
		}


		public void setRefreshToken(String refreshToken) {
			this.refreshToken = refreshToken;
		}


		public String getEmail() {
			return email;
		}


		public void setEmail(String email) {
			this.email = email;
		}


		public String getUserPwd() {
			return userPwd;
		}


		public void setUserPwd(String userPwd) {
			this.userPwd = userPwd;
		}


		public String getUserName() {
			return userName;
		}


		public void setUserName(String userName) {
			this.userName = userName;
		}


		public String getNickName() {
			return nickName;
		}


		public void setNickName(String nickName) {
			this.nickName = nickName;
		}


		public String getPhone() {
			return phone;
		}


		public void setPhone(String phone) {
			this.phone = phone;
		}


		public String getInvestorGrade() {
			return investorGrade;
		}


		public void setInvestorGrade(String investorGrade) {
			this.investorGrade = investorGrade;
		}


		public String getInvestmentLimit() {
			return investmentLimit;
		}


		public void setInvestmentLimit(String investmentLimit) {
			this.investmentLimit = investmentLimit;
		}


		public String getBusinessLicenseNo() {
			return businessLicenseNo;
		}


		public void setBusinessLicenseNo(String businessLicenseNo) {
			this.businessLicenseNo = businessLicenseNo;
		}


		public String getCorporateRegistrationNo() {
			return corporateRegistrationNo;
		}


		public void setCorporateRegistrationNo(String corporateRegistrationNo) {
			this.corporateRegistrationNo = corporateRegistrationNo;
		}


		public String getCorporateName() {
			return corporateName;
		}


		public void setCorporateName(String corporateName) {
			this.corporateName = corporateName;
		}


		public String getAddress() {
			return address;
		}


		public void setAddress(String address) {
			this.address = address;
		}


		public String getUserClass() {
			return userClass;
		}


		public void setUserClass(String userClass) {
			this.userClass = userClass;
		}


		public Date getEnrollDate() {
			return enrollDate;
		}


		public void setEnrollDate(Date enrollDate) {
			this.enrollDate = enrollDate;
		}


		public String getStatus() {
			return status;
		}


		public void setStatus(String status) {
			this.status = status;
		}


		public String getPwdStatus() {
			return pwdStatus;
		}


		public void setPwdStatus(String pwdStatus) {
			this.pwdStatus = pwdStatus;
		}


		public String getPlatformId() {
			return platformId;
		}


		public void setPlatformId(String platformId) {
			this.platformId = platformId;
		}


		public String getGradingStatus() {
			return gradingStatus;
		}


		public void setGradingStatus(String gradingStatus) {
			this.gradingStatus = gradingStatus;
		}


		public String getB_reason() {
			return b_reason;
		}


		public void setB_reason(String b_reason) {
			this.b_reason = b_reason;
		}


		public Date getB_enrollDate() {
			return b_enrollDate;
		}


		public void setB_enrollDate(Date b_enrollDate) {
			this.b_enrollDate = b_enrollDate;
		}


		public int getProductCount() {
			return productCount;
		}


		public void setProductCount(int productCount) {
			this.productCount = productCount;
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


		public int getFinalResult() {
			return finalResult;
		}


		public void setFinalResult(int finalResult) {
			this.finalResult = finalResult;
		}


		public Date getTest() {
			return test;
		}


		public void setTest(Date test) {
			this.test = test;
		}


		public String getResult() {
			return result;
		}


		public void setResult(String result) {
			this.result = result;
		}





		public DetailMember(String fee, int productCount, int finalResult, Date test, String result, int totalInvest,
				int count, int userId, String platformType, String refreshToken, String email, String userPwd,
				String userName, String nickName, String phone, String investorGrade, String investmentLimit,
				String businessLicenseNo, String corporateRegistrationNo, String corporateName, String address,
				String userClass, Date enrollDate, String status, String pwdStatus, String platformId,
				String gradingStatus, String b_reason, Date b_enrollDate, int ir_iRecordId, int ir_investId,
				String ir_payClass, Date ir_payDate, int i_investId, int i_userId, int i_pId, int p_pId, String p_pCode,
				int p_userId, String p_pName, int p_openDate, int p_closingAmount, String p_interestRate,
				int p_repayDate, int p_amount) {
			super();
			this.fee = fee;
			this.productCount = productCount;
			this.finalResult = finalResult;
			this.test = test;
			this.result = result;
			this.totalInvest = totalInvest;
			this.count = count;
			this.userId = userId;
			this.platformType = platformType;
			this.refreshToken = refreshToken;
			this.email = email;
			this.userPwd = userPwd;
			this.userName = userName;
			this.nickName = nickName;
			this.phone = phone;
			this.investorGrade = investorGrade;
			this.investmentLimit = investmentLimit;
			this.businessLicenseNo = businessLicenseNo;
			this.corporateRegistrationNo = corporateRegistrationNo;
			this.corporateName = corporateName;
			this.address = address;
			this.userClass = userClass;
			this.enrollDate = enrollDate;
			this.status = status;
			this.pwdStatus = pwdStatus;
			this.platformId = platformId;
			this.gradingStatus = gradingStatus;
			this.b_reason = b_reason;
			this.b_enrollDate = b_enrollDate;
			this.ir_iRecordId = ir_iRecordId;
			this.ir_investId = ir_investId;
			this.ir_payClass = ir_payClass;
			this.ir_payDate = ir_payDate;
			this.i_investId = i_investId;
			this.i_userId = i_userId;
			this.i_pId = i_pId;
			this.p_pId = p_pId;
			this.p_pCode = p_pCode;
			this.p_userId = p_userId;
			this.p_pName = p_pName;
			this.p_openDate = p_openDate;
			this.p_closingAmount = p_closingAmount;
			this.p_interestRate = p_interestRate;
			this.p_repayDate = p_repayDate;
			this.p_amount = p_amount;
		}





		@Override
		public String toString() {
			return "DetailMember [fee=" + fee + ", productCount=" + productCount + ", finalResult=" + finalResult
					+ ", test=" + test + ", result=" + result + ", totalInvest=" + totalInvest + ", count=" + count
					+ ", userId=" + userId + ", platformType=" + platformType + ", refreshToken=" + refreshToken
					+ ", email=" + email + ", userPwd=" + userPwd + ", userName=" + userName + ", nickName=" + nickName
					+ ", phone=" + phone + ", investorGrade=" + investorGrade + ", investmentLimit=" + investmentLimit
					+ ", businessLicenseNo=" + businessLicenseNo + ", corporateRegistrationNo="
					+ corporateRegistrationNo + ", corporateName=" + corporateName + ", address=" + address
					+ ", userClass=" + userClass + ", enrollDate=" + enrollDate + ", status=" + status + ", pwdStatus="
					+ pwdStatus + ", platformId=" + platformId + ", gradingStatus=" + gradingStatus + ", b_reason="
					+ b_reason + ", b_enrollDate=" + b_enrollDate + ", ir_iRecordId=" + ir_iRecordId + ", ir_investId="
					+ ir_investId + ", ir_payClass=" + ir_payClass + ", ir_payDate=" + ir_payDate + ", i_investId="
					+ i_investId + ", i_userId=" + i_userId + ", i_pId=" + i_pId + ", p_pId=" + p_pId + ", p_pCode="
					+ p_pCode + ", p_userId=" + p_userId + ", p_pName=" + p_pName + ", p_openDate=" + p_openDate
					+ ", p_closingAmount=" + p_closingAmount + ", p_interestRate=" + p_interestRate + ", p_repayDate="
					+ p_repayDate + ", p_amount=" + p_amount + "]";
		}



	

	
	    
	    
	    

	
}
