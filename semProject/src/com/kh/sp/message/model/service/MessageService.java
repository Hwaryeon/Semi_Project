package com.kh.sp.message.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.sp.board.model.dao.BoardDao;
import com.kh.sp.board.model.vo.Board;
import com.kh.sp.message.model.dao.MessageDao;
import com.kh.sp.message.model.vo.Message;

import static com.kh.sp.common.JDBCTemplate.*;

public class MessageService {

	public int sendMessage(Message m) {
		
		Connection con = getConnection();
		
		int result = new MessageDao().sendMessage(con, m);
		
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public Message readMessage(int msgId) {
		
		Connection con = getConnection();
		
		Message m = new MessageDao().readMessage(con, msgId);
		
		if(m != null){
			int result = new MessageDao().readYMessage(con, msgId);
			
			if(result > 0){
				commit(con);
			}else{
				rollback(con);
			}
			
		}
		
		close(con);
		
		return m;
	}

	public int deleteMsg(String msgId) {
		
		Connection con = getConnection();
		
		int result = new MessageDao().deleteMsg(con, msgId);
		
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public int getListCount(int user_id) {
		
		Connection con = getConnection();

		int count = new MessageDao().getListCount(con, user_id);

		close(con);

		return count;
		
	}

	public ArrayList<Message> listMsg(int currentPage, int limit, int user_id) {
		
		ArrayList<Message> list = new ArrayList<Message>();

		Connection con = getConnection();

		list = new MessageDao().listMsg(con, currentPage, limit, user_id);

		close(con);

		return list;
	}

	public int checkMessage(int id) {
		
		Connection con = getConnection();
		
		int result = new MessageDao().checkMessage(con, id);
		
		close(con);
		
		return result;
	}

	public int reWriteMsg(Message m) {
		
		Connection con = getConnection();
		
		int result = new MessageDao().reWriteMsg(con, m);
		
		close(con);
		
		return result;
	}

}
