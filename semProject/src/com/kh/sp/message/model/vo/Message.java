package com.kh.sp.message.model.vo;

import java.io.Serializable;

public class Message implements Serializable{

	private int msg_id;
	private String title;
	private String msg;
	private int user_id;
	
	public Message(){}
	
	public Message(String title, String msg, int user_id) {
		super();
		this.title = title;
		this.msg = msg;
		this.user_id = user_id;
	}

	public Message(int msg_id, String title, String msg, int user_id) {
		super();
		this.msg_id = msg_id;
		this.title = title;
		this.msg = msg;
		this.user_id = user_id;
	}

	public int getMsg_id() {
		return msg_id;
	}

	public void setMsg_id(int msg_id) {
		this.msg_id = msg_id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	@Override
	public String toString() {
		return "Message [msg_id=" + msg_id + ", title=" + title + ", msg=" + msg + ", user_id=" + user_id + "]";
	}
	
}
