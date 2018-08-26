package com.kh.sp.message.model.service;

import java.sql.Connection;

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
		
		close(con);
		
		return m;
	}

}
