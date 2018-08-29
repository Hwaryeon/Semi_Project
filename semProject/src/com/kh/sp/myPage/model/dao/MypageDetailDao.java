package com.kh.sp.myPage.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.sp.board.model.vo.Attachment;
import com.kh.sp.myPage.model.vo.MypageDetail;

import static com.kh.sp.common.JDBCTemplate.*;

public class MypageDetailDao {

	private Properties prop = new Properties();

	public MypageDetailDao() {
		String fileName = MypageDetailDao.class.getResource("/sql/myPage/myPage-query.properties").getPath();
		// System.out.println("파일이름 : " + fileName);
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<MypageDetail> selectList(Connection con, int userId, int currentPage, int limit,
			String userClass) {
		ArrayList<MypageDetail> list = new ArrayList<MypageDetail>();

		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String query = "";
		if (userClass.equals("investor")) 
			query = prop.getProperty("showEnrollProject");
		else
			query = prop.getProperty("showCreateProject");
			
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userId);// userId
			System.out.println("currentPage : " + currentPage);
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			System.out.println("startRow : " + startRow);
			System.out.println("endRow : " + endRow);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				MypageDetail mpd = new MypageDetail();
				mpd.setP_name(rset.getString("p_name"));
				mpd.setStatus(rset.getString("status"));
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

	public int insertAttachment(Connection con, ArrayList<Attachment> fileList, int userid, int ptype) {
		int result = 0;
		PreparedStatement pstmt = null;

		String query = prop.getProperty("insertUserRankingAttachment");

		try {
			for (int i = 0; i < fileList.size(); i++) {
				System.out.println("fileList " + i + " : " + fileList.get(i));

				pstmt = con.prepareStatement(query);
				pstmt.setString(1, fileList.get(i).getOriginName());
				pstmt.setString(2, fileList.get(i).getChangeName());
				pstmt.setString(3, fileList.get(i).getFilePath());
				pstmt.setInt(4, ptype);
				pstmt.setInt(5, userid);

				result = pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int getListCount(Connection con, int userId, String userclass) {
		PreparedStatement pstmt = null;
		int result = 0;

		ResultSet rset = null;

		String query = "";
		
		if(userclass.equals("investor"))
			query = prop.getProperty("listCount");
		else
			query = prop.getProperty("listCount2");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userId);
			rset = pstmt.executeQuery();

			while (rset.next()) {
				result = rset.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return result;
	}

	public int getListCountPayment(Connection con, int userId, String userClass) {
		PreparedStatement pstmt = null;
		int result = 0;

		ResultSet rset = null;

		String query = "";
		
		if(userClass.equals("investor"))
			query = prop.getProperty("listCountPayment");
		else
			query = prop.getProperty("listCountPayment2");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userId);
			rset = pstmt.executeQuery();

			while (rset.next()) {
				result = rset.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return result;
	}

	public ArrayList<MypageDetail> selectListPayment(Connection con, int userId, int currentPage, int limit,
			String userClass) {
		ArrayList<MypageDetail> list = new ArrayList<MypageDetail>();

		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String query = "";
		if (userClass.equals("investor")) 
			query = prop.getProperty("investPaymentBackground");
		else
			query = prop.getProperty("businessPaymentBackground");
			
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userId);// userId
			//System.out.println("currentPage : " + currentPage);
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			//System.out.println("startRow : " + startRow);
			//System.out.println("endRow : " + endRow);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				MypageDetail mpd = new MypageDetail(); 
				mpd.setP_name(rset.getString("p_name"));
				mpd.setPay_date(rset.getString("pay_date").substring(0, 10));
				mpd.setPrice(rset.getInt("price"));
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
