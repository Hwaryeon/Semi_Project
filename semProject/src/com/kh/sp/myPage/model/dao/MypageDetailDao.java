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

//マイページのDataBase Access Object
public class MypageDetailDao {

	private Properties prop = new Properties();

	public MypageDetailDao() {
		//クエリー文を読む
		String fileName = MypageDetailDao.class.getResource("/sql/myPage/myPage-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	//参加しているプロジェクトのListを照会
	public ArrayList<MypageDetail> selectList(Connection con, int userId, int currentPage, int limit, String userClass) {
		ArrayList<MypageDetail> list = new ArrayList<MypageDetail>();

		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("showEnrollProject");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userId);// userId
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
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
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return list;
	}

	//作ったプロジェクトのListを照会
	public ArrayList<MypageDetail> selectList2(Connection con, int userId, int currentPage, int limit, String userClass) {
		ArrayList<MypageDetail> list = new ArrayList<MypageDetail>();

		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("showCreateProject");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userId);// userId
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
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
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return list;
	}
	//投資者格付け申請用の書類を提出するDataBase Access Object
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
				
				if(i==0){
					pstmt.setInt(4, 5);
				}else{
					pstmt.setInt(4, 6);
				}
				
				pstmt.setInt(5, ptype);
				pstmt.setInt(6, userid);

				result = pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}
	
	//書類を確認した後投資者等級を変えるmethod
	public int updateGradingStatus(Connection con, int userid) {
		int result = 0;
		PreparedStatement pstmt = null;

		String query = prop.getProperty("updateGradingStatus");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userid);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	//リストの数をcount（投資者）
	public int getListCount(Connection con, int userId, String userclass) {
		PreparedStatement pstmt = null;
		int result = 0;

		ResultSet rset = null;

		String query = prop.getProperty("listCount");

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
	
	//リストの数をcount(事業者)
	public int getListCount2(Connection con, int userId, String userclass) {
		PreparedStatement pstmt = null;
		int result = 0;

		ResultSet rset = null;

		String query = prop.getProperty("listCount2");

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

	//投資者の決済内約の数をcount
	public int getListCountPayment(Connection con, int userId, String userClass) {
		PreparedStatement pstmt = null;
		int result = 0;

		ResultSet rset = null;

		String query = prop.getProperty("listCountPayment");
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
	
	//事業者の決済内約の数をcount
	public int getListCountPayment2(Connection con, int userId, String userClass) {
		PreparedStatement pstmt = null;
		int result = 0;

		ResultSet rset = null;

		String query = prop.getProperty("listCountPayment2");

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

	//投資者の決済内約をDBから出す。
	public ArrayList<MypageDetail> selectListPayment(Connection con, int userId, int currentPage, int limit,
			String userClass) {
		ArrayList<MypageDetail> list = new ArrayList<MypageDetail>();

		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("investPaymentBackground");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userId);// userId
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				MypageDetail mpd = new MypageDetail();
				mpd.setP_name(rset.getString("p_name"));
				mpd.setPay_date(rset.getString("pay_date").substring(0, 10));
				mpd.setPrice(rset.getInt("price"));
				mpd.setPay_class(rset.getString("pay_class"));
				list.add(mpd);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return list;
	}

	//事業者の決済内約をDBから出す。
	public ArrayList<MypageDetail> selectListPayment2(Connection con, int userId, int currentPage, int limit,
			String userClass) {
		ArrayList<MypageDetail> list = new ArrayList<MypageDetail>();

		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("businessPaymentBackground");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userId);// userId
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
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
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return list;
	}
}
