package com.kh.sp.main.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.sp.board.model.vo.Board;
import com.kh.sp.main.model.dao.MainDao;

import static com.kh.sp.common.JDBCTemplate.*;

public class MainService {

	public ArrayList<Board> startMain() {
		
		Connection con = getConnection();
		
		ArrayList<Board> list = new MainDao().startMain(con);
		
		close(con);
		
		return list;
	}

}
