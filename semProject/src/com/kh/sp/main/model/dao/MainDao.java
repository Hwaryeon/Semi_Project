package com.kh.sp.main.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.sp.board.model.dao.BoardDao;
import com.kh.sp.board.model.vo.Board;

import static com.kh.sp.common.JDBCTemplate.*;

public class MainDao {
	
	private Properties prop = new Properties();
	
	public MainDao(){
		String fileName = MainDao.class.getResource("/sql/main/main-query.properties").getPath();
		//System.out.println(fileName);

		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	

	public ArrayList<Board> startMain(Connection con) {
		
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = new ArrayList<Board>();
		Board b = null;
		
		String query = prop.getProperty("mianNotice");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			while(rset.next()){
				b = new Board();
				b.setwNo(rset.getInt("writting_no"));
				b.setTitle(rset.getString("title"));
				b.setNoticeYn(rset.getString("noticeyn"));
				b.setNoticeType(rset.getString("noticetype"));
				
				list.add(b);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(stmt);
			close(rset);
		}
		
		
		
		return list;
	}

}
