package com.kh.sp.message.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.sp.board.model.vo.Board;
import com.kh.sp.member.model.dao.MemberDao;
import com.kh.sp.message.model.vo.Message;

import static com.kh.sp.common.JDBCTemplate.*;

public class MessageDao {
	private Properties prop = new Properties();

	public MessageDao(){
		String fileName = MessageDao.class.getResource("/sql/message/message-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public int sendMessage(Connection con, Message m) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("sendMessage");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, 999);
			pstmt.setInt(2, m.getUser_id());
			pstmt.setString(3, m.getTitle());
			pstmt.setString(4, m.getMsg());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		
		
		return result;
	}
	public Message readMessage(Connection con, int msgId) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Message m = null;
		
		String query = prop.getProperty("readMessage");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, msgId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				m = new Message();
				
				m.setMsg_id(rset.getInt("msg_id"));
				m.setTitle(rset.getString("title"));
				m.setMsg(rset.getString("content"));
				m.setUser_id(rset.getInt("send_id"));
				m.setReceive_id(rset.getInt("receive_id"));
				m.setSend_date(rset.getDate("send_date"));
				m.setReadYN(rset.getString("readyn"));
				m.setReceive_UserName(rset.getString("user_name"));
				m.setReceive_Nickname(rset.getString("nick_name"));
				
				System.out.println("m: " + m);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
			close(rset);
		}
		
		
		
		return m;
	}
	public int deleteMsg(Connection con, String msgId) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteMsg");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(msgId));
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		
		
		return result;
	}
	public int getListCount(Connection con, int user_id) {
		
		PreparedStatement pstmt = null;
		
		int result= 0;
		
		ResultSet rset = null;
		
		String query = prop.getProperty("listCount");
		
		try {
			
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, user_id);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(rset);
		}
		
		
		return result;
	}
	public ArrayList<Message> listMsg(Connection con, int currentPage, int limit, int user_id) {
		
		ArrayList<Message> list = new ArrayList<Message>();
		
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String query = prop.getProperty("listMsg");
		
		try {
			pstmt = con.prepareStatement(query);
			int startRow = (currentPage -1 ) * limit + 1;
			int endRow = startRow + limit - 1;
			
			pstmt.setInt(1, user_id);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				
				Message m = new Message();
				
				m.setMsg_id(rset.getInt("msg_id"));
				m.setTitle(rset.getString("title"));
				m.setMsg(rset.getString("content"));
				m.setUser_id(rset.getInt("send_id"));
				m.setReceive_id(rset.getInt("receive_id"));
				m.setSend_date(rset.getDate("send_date"));
				m.setRead_date(rset.getDate("read_date"));
				m.setReadYN(rset.getString("readyn"));
				m.setReceive_UserName(rset.getString("user_name"));
				m.setReceive_Nickname(rset.getString("nick_name"));
				
				
				list.add(m);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
			close(rset);
		}
		
		return list;
		
		
	}
	public int checkMessage(Connection con, int id) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("checkMessage");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, id);
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
		return result;
	}
	public int reWriteMsg(Connection con, Message m) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("reWriteMsg");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, m.getReceive_id());
			pstmt.setInt(2, m.getUser_id());
			pstmt.setString(3, m.getTitle());
			pstmt.setString(4, m.getMsg());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		
		
		return result;
	}
	public int readYMessage(Connection con, int msgId) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("readYMessage");
		
		try {
			
			System.out.println("msgId : " + msgId);
			
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, msgId);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		
		return result;
	}
	
	public int getListCount2(Connection con, int user_id) {
		PreparedStatement pstmt = null;
		
		int result= 0;
		
		ResultSet rset = null;
		
		String query = prop.getProperty("listCount2");
		
		try {
			
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, user_id);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(rset);
		}
		
		
		return result;
	}
	public ArrayList<Message> listMsg2(Connection con, int currentPage, int limit, int user_id) {
		ArrayList<Message> list = new ArrayList<Message>();
		
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String query = prop.getProperty("listMsg2");
		
		try {
			pstmt = con.prepareStatement(query);
			int startRow = (currentPage -1 ) * limit + 1;
			int endRow = startRow + limit - 1;
			
			pstmt.setInt(1, user_id);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				
				Message m = new Message();
				
				m.setMsg_id(rset.getInt("msg_id"));
				m.setTitle(rset.getString("title"));
				m.setMsg(rset.getString("content"));
				m.setUser_id(rset.getInt("send_id"));
				m.setReceive_id(rset.getInt("receive_id"));
				m.setSend_date(rset.getDate("send_date"));
				m.setRead_date(rset.getDate("read_date"));
				m.setReadYN(rset.getString("readyn"));
				m.setReceive_UserName(rset.getString("user_name"));
				m.setReceive_Nickname(rset.getString("nick_name"));
				
				list.add(m);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
			close(rset);
		}
		
		return list;
	}

}
