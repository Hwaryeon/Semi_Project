package com.kh.sp.board.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Board implements Serializable {
	
	private int wNo; 		// 글번호
	private String title;	// 글제목
	private String text;	// 글내용
	private String bType;
	private String aText;
	private int fileNum;
	private Date rDate;		// 등록일자
	private int pView;
	private int pId;
	private int uId;		// 작성자 아이디
	
	private String noticeYn;	// 공지사항여부
	private String noticeType;	// 글타입
	
	
	public Board(){}
	
	public Board(String title, String text, int uId, String noticeYn, String noticeType) {
		super();
		this.title = title;
		this.text = text;
		this.uId = uId;
		this.noticeYn = noticeYn;
		this.noticeType = noticeType;
	}
	
	public Board(int wNo, String title, String text, int uId, String noticeYn, String noticeType) {
		super();
		this.wNo = wNo;
		this.title = title;
		this.text = text;
		this.uId = uId;
		this.noticeYn = noticeYn;
		this.noticeType = noticeType;
	}

	public Board(int wNo, String title, String text, Date rDate, int uId, String noticeYn, String noticeType) {
		super();
		this.wNo = wNo;
		this.title = title;
		this.text = text;
		this.rDate = rDate;
		this.uId = uId;
		this.noticeYn = noticeYn;
		this.noticeType = noticeType;
	}


	public Board(int wNo, String title, String text, String bType, String aText, int fileNum, Date rDate, int pView,
			int pId, int uId, String noticeYn, String noticeType) {
		super();
		this.wNo = wNo;
		this.title = title;
		this.text = text;
		this.bType = bType;
		this.aText = aText;
		this.fileNum = fileNum;
		this.rDate = rDate;
		this.pView = pView;
		this.pId = pId;
		this.uId = uId;
		this.noticeYn = noticeYn;
		this.noticeType = noticeType;
	}


	public int getwNo() {
		return wNo;
	}


	public void setwNo(int wNo) {
		this.wNo = wNo;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getText() {
		return text;
	}


	public void setText(String text) {
		this.text = text;
	}


	public String getbType() {
		return bType;
	}


	public void setbType(String bType) {
		this.bType = bType;
	}


	public String getaText() {
		return aText;
	}


	public void setaText(String aText) {
		this.aText = aText;
	}


	public int getFileNum() {
		return fileNum;
	}


	public void setFileNum(int fileNum) {
		this.fileNum = fileNum;
	}


	public Date getrDate() {
		return rDate;
	}


	public void setrDate(Date rDate) {
		this.rDate = rDate;
	}


	public int getpView() {
		return pView;
	}


	public void setpView(int pView) {
		this.pView = pView;
	}


	public int getpId() {
		return pId;
	}


	public void setpId(int pId) {
		this.pId = pId;
	}


	public int getuId() {
		return uId;
	}


	public void setuId(int uId) {
		this.uId = uId;
	}


	public String getNoticeYn() {
		return noticeYn;
	}


	public void setNoticeYn(String noticeYn) {
		this.noticeYn = noticeYn;
	}


	public String getNoticeType() {
		return noticeType;
	}


	public void setNoticeType(String noticeType) {
		this.noticeType = noticeType;
	}


	@Override
	public String toString() {
		return "Board [wNo=" + wNo + ", title=" + title + ", text=" + text + ", bType=" + bType + ", aText=" + aText
				+ ", fileNum=" + fileNum + ", rDate=" + rDate + ", pView=" + pView + ", pId=" + pId + ", uId=" + uId
				+ ", noticeYn=" + noticeYn + ", noticeType=" + noticeType + "]";
	}
	
	
	

}
