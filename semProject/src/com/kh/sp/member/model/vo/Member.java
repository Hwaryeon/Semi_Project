package com.kh.sp.member.model.vo;

import java.sql.Date;


public class Member implements java.io.Serializable{
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
    private String userClass;
    private Date enrollDate;
    private String status;
    private String pwdStatus;
    private String platformId;
    private String gradingStatus;
	
    public Member(){}

    
	public Member(int userId, String platformType, String refreshToken, String email, String userPwd, String userName,
			String nickName, String phone, String investorGrade, String investmentLimit, String businessLicenseNo,
			String corporateRegistrationNo, String corporateName, String userClass, Date enrollDate, String status,
			String pwdStatus, String platformId, String gradingStatus) {
		super();
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
		this.userClass = userClass;
		this.enrollDate = enrollDate;
		this.status = status;
		this.pwdStatus = pwdStatus;
		this.platformId = platformId;
		this.gradingStatus = gradingStatus;
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


	@Override
	public String toString() {
		return "Member [userId=" + userId + ", platformType=" + platformType + ", refreshToken=" + refreshToken
				+ ", email=" + email + ", userPwd=" + userPwd + ", userName=" + userName + ", nickName=" + nickName
				+ ", phone=" + phone + ", investorGrade=" + investorGrade + ", investmentLimit=" + investmentLimit
				+ ", businessLicenseNo=" + businessLicenseNo + ", corporateRegistrationNo=" + corporateRegistrationNo
				+ ", corporateName=" + corporateName + ", userClass=" + userClass + ", enrollDate=" + enrollDate
				+ ", status=" + status + ", pwdStatus=" + pwdStatus + ", platformId=" + platformId + ", gradingStatus="
				+ gradingStatus + "]";
	}


}
