package com.kh.sp.board.model.vo;

import java.io.Serializable;

public class PageNP implements Serializable {

	private int bNum;
	private int next_bNum;
	private String next_title;
	private int prev_bNum;
	private String prev_title;
	
	public PageNP(){}
	
	public PageNP(int bNum, int next_bNum, String next_title, int prev_bNum, String prev_title) {
		super();
		this.bNum = bNum;
		this.next_bNum = next_bNum;
		this.next_title = next_title;
		this.prev_bNum = prev_bNum;
		this.prev_title = prev_title;
	}

	public int getbNum() {
		return bNum;
	}
	public void setbNum(int bNum) {
		this.bNum = bNum;
	}
	public int getNext_bNum() {
		return next_bNum;
	}
	public void setNext_bNum(int next_bNum) {
		this.next_bNum = next_bNum;
	}
	public String getNext_title() {
		return next_title;
	}
	public void setNext_title(String next_title) {
		this.next_title = next_title;
	}
	public int getPrev_bNum() {
		return prev_bNum;
	}
	public void setPrev_bNum(int prev_bNum) {
		this.prev_bNum = prev_bNum;
	}
	public String getPrev_title() {
		return prev_title;
	}
	public void setPrev_title(String prev_title) {
		this.prev_title = prev_title;
	}

	@Override
	public String toString() {
		return "PageNP [bNum=" + bNum + ", next_bNum=" + next_bNum + ", next_title=" + next_title + ", prev_bNum="
				+ prev_bNum + ", prev_title=" + prev_title + "]";
	}

	
	
	
}
