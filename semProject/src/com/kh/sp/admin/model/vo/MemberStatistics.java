package com.kh.sp.admin.model.vo;

public class MemberStatistics  implements java.io.Serializable{
     private String term;
     private int memberCount;
     private int emailMemberCount;
     private int kakaoMemberCount;
     private int naverMemberCount;
     
     public MemberStatistics(){}

	public MemberStatistics(String term, int memberCount, int emailMemberCount, int kakaoMemberCount,
			int naverMemberCount) {
		super();
		this.term = term;
		this.memberCount = memberCount;
		this.emailMemberCount = emailMemberCount;
		this.kakaoMemberCount = kakaoMemberCount;
		this.naverMemberCount = naverMemberCount;
	}

	public String getTerm() {
		return term;
	}

	public void setTerm(String term) {
		this.term = term;
	}

	public int getMemberCount() {
		return memberCount;
	}

	public void setMemberCount(int memberCount) {
		this.memberCount = memberCount;
	}

	public int getEmailMemberCount() {
		return emailMemberCount;
	}

	public void setEmailMemberCount(int emailMemberCount) {
		this.emailMemberCount = emailMemberCount;
	}

	public int getKakaoMemberCount() {
		return kakaoMemberCount;
	}

	public void setKakaoMemberCount(int kakaoMemberCount) {
		this.kakaoMemberCount = kakaoMemberCount;
	}

	public int getNaverMemberCount() {
		return naverMemberCount;
	}

	public void setNaverMemberCount(int naverMemberCount) {
		this.naverMemberCount = naverMemberCount;
	}

	@Override
	public String toString() {
		return "MemberStatistics [term=" + term + ", memberCount=" + memberCount + ", emailMemberCount="
				+ emailMemberCount + ", kakaoMemberCount=" + kakaoMemberCount + ", naverMemberCount=" + naverMemberCount
				+ "]";
	}
     
     
     
}
