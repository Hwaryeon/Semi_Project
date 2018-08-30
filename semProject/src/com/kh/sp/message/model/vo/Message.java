package com.kh.sp.message.model.vo;

import java.io.Serializable;
import java.sql.Date;


public class Message implements Serializable{

	private int msg_id;
	private String title;
	private String msg;
	private int user_id;
	private int receive_id;
	private Date send_date;
	private Date read_date;
	private String readYN;
	
	private String receive_UserName;
	private String receive_Nickname;
	
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
	
	
	public Message(String title, String msg, int user_id, int receive_id){
		this.title = title;
		this.msg = msg;
		this.user_id = user_id;
		this.receive_id = receive_id;
	}
	
	public Message(int msg_id, String title, String msg, int user_id, int receive_id, Date send_date, String readYN) {
		super();
		this.msg_id = msg_id;
		this.title = title;
		this.msg = msg;
		this.user_id = user_id;
		this.receive_id = receive_id;
		this.send_date = send_date;
		this.readYN = readYN;
	}

	public Message(int msg_id, String title, String msg, int user_id, int receive_id, Date send_date, Date read_date,
			String readYN) {
		super();
		this.msg_id = msg_id;
		this.title = title;
		this.msg = msg;
		this.user_id = user_id;
		this.receive_id = receive_id;
		this.send_date = send_date;
		this.read_date = read_date;
		this.readYN = readYN;
	}
	
	public Message(int msg_id, String title, String msg, int user_id, int receive_id, Date send_date, Date read_date,
			String readYN, String receive_UserName, String receive_Nickname) {
		super();
		this.msg_id = msg_id;
		this.title = title;
		this.msg = msg;
		this.user_id = user_id;
		this.receive_id = receive_id;
		this.send_date = send_date;
		this.read_date = read_date;
		this.readYN = readYN;
		this.receive_UserName = receive_UserName;
		this.receive_Nickname = receive_Nickname;
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

	public int getReceive_id() {
		return receive_id;
	}

	public void setReceive_id(int receive_id) {
		this.receive_id = receive_id;
	}

	public Date getSend_date() {
		return send_date;
	}

	public void setSend_date(Date send_date) {
		this.send_date = send_date;
	}

	public String getReadYN() {
		return readYN;
	}

	public void setReadYN(String readYN) {
		this.readYN = readYN;
	}

	public Date getRead_date() {
		return read_date;
	}

	public void setRead_date(Date read_date) {
		this.read_date = read_date;
	}

	public String getReceive_UserName() {
		return receive_UserName;
	}

	public void setReceive_UserName(String receive_UserName) {
		this.receive_UserName = receive_UserName;
	}

	public String getReceive_Nickname() {
		return receive_Nickname;
	}

	public void setReceive_Nickname(String receive_Nickname) {
		this.receive_Nickname = receive_Nickname;
	}

	@Override
	public String toString() {
		return "Message [msg_id=" + msg_id + ", title=" + title + ", msg=" + msg + ", user_id=" + user_id
				+ ", receive_id=" + receive_id + ", send_date=" + send_date + ", read_date=" + read_date + ", readYN="
				+ readYN + ", receive_UserName=" + receive_UserName + ", receive_Nickname=" + receive_Nickname + "]";
	}

	
	
}
