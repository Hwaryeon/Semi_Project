package com.kh.ic.mypage.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.ic.mypage.model.vo.MypageDetail;

import static com.kh.ic.common.JDBCTemplate.*;

public class MypageDetailDao {
	
	private Properties prop = new Properties();
	
	public MypageDetailDao(){
		String fileName = MypageDetailDao.class.getResource("/sql/myPage/myPage-query.properties").getPath();
		//System.out.println("파일이름 : " + fileName);
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<MypageDetail> selectList(Connection con, int userId) {
		ArrayList<MypageDetail> list = new ArrayList<MypageDetail>();
		
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String query = prop.getProperty("showEnrollProject");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userId);//userId
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				MypageDetail mpd = new MypageDetail();
				mpd.setP_name(rset.getString("p_name"));
				//System.out.println("제목 : " + rset.getString("p_name"));
				mpd.setStatus(rset.getString("status"));
				//System.out.println("상태 : " + rset.getString("status"));
				
				list.add(mpd);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return list;
	}

}
