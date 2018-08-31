package com.kh.sp.board.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import com.kh.sp.board.model.vo.Attachment;
import com.kh.sp.board.model.vo.Board;
import com.kh.sp.board.model.vo.PageNP;

import static com.kh.sp.common.JDBCTemplate.*;

public class BoardDao {

	private Properties prop = new Properties();

	public BoardDao(){
		String fileName = BoardDao.class.getResource("/sql/board/board-query.properties").getPath();
		//System.out.println(fileName);

		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
 
	public int insertBoard(Connection con, Board board) {

		int result = 0;

		PreparedStatement pstmt = null;
		
		String query = prop.getProperty("insertBoard");
		
		try {
			
			pstmt = con.prepareStatement(query);
			/*pstmt.setInt(1, board.getwNo());*/
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getText());
			//3번 공지사항
			pstmt.setString(3, "3");
			pstmt.setString(4, board.getaText());
			pstmt.setInt(5, board.getFileNum());
			pstmt.setInt(6, board.getpView());
			pstmt.setInt(7, board.getpId());
			pstmt.setInt(8, board.getuId());
			pstmt.setString(9, board.getNoticeYn());
			pstmt.setString(10, board.getNoticeType());
			
			result = pstmt.executeUpdate();
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Board> allBoard(Connection con, int currentPage, int limit) {

		ArrayList<Board> list = new ArrayList<Board>();
		
		/*Statement stmt = null;*/
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String query = prop.getProperty("allBoard");
		
		try {
			pstmt = con.prepareStatement(query);
			int startRow = (currentPage -1 ) * limit + 1;
			int endRow = startRow + limit - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				
				Board b = new Board();
				b.setwNo(rset.getInt("writting_no"));
				b.setTitle(rset.getString("title"));
				b.setText(rset.getString("text"));
				b.setbType(rset.getString("board_type"));
				b.setaText(rset.getString("answer_text"));
				b.setFileNum(rset.getInt("file_num"));
				b.setrDate(rset.getDate("regist_date"));
				b.setpView(rset.getInt("page_view"));
				b.setpId(rset.getInt("p_id"));
				b.setuId(rset.getInt("user_id"));
				b.setNoticeYn(rset.getString("noticeyn"));
				b.setNoticeType(rset.getString("NOTICETYPE"));
				
				list.add(b);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
			close(rset);
		}
		
		return list;
	}

	public Board detailBoard(Connection con, int wNum, int type) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Board b = new Board();
		
		PreparedStatement pstmt2 = null;
		int result = 0;
		
		String query = prop.getProperty("detailBoard");
		String query2 = prop.getProperty("increaseView");
		
		
		try {
			
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, wNum);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				
				b.setwNo(rset.getInt("writting_no"));
				b.setTitle(rset.getString("title"));
				b.setText(rset.getString("text"));
				b.setbType(rset.getString("board_type"));
				b.setaText(rset.getString("answer_text"));
				b.setFileNum(rset.getInt("file_num"));
				b.setrDate(rset.getDate("regist_date"));
				b.setpView(rset.getInt("page_view")+1);
				b.setpId(rset.getInt("p_id"));
				b.setuId(rset.getInt("user_id"));
				b.setNoticeYn(rset.getString("noticeyn"));
				b.setNoticeType(rset.getString("NOTICETYPE"));
			}
			
			if(type == 0){
				pstmt2 = con.prepareStatement(query2);
				pstmt2.setInt(1, b.getpView());
				pstmt2.setInt(2, b.getwNo());
				result = pstmt2.executeUpdate();
			}
			
			if(result > 0){
				System.out.println("조회수 증가");
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
			close(rset);
		}
		
		return b;
	}


	public int updateBoard(Connection con, Board b) {

		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String query = prop.getProperty("updateBoard");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, b.getTitle());
			pstmt.setString(2, b.getText());
			pstmt.setString(3, b.getNoticeYn());
			pstmt.setString(4, b.getNoticeType());
			pstmt.setInt(5, b.getwNo());
			
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return result;
	}

	public int deleteBoard(Connection con, int wNo) {
		
		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String query = prop.getProperty("deleteBoard");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, wNo);
			
			result = pstmt.executeUpdate();
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		
		
		return result;
	}

	public int getListCount(Connection con) {
		
		Statement stmt = null;
		int result= 0;
		
		ResultSet rset = null;
		
		String query = prop.getProperty("listCount");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			while(rset.next()){
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(stmt);
			close(rset);
		}
		
		
		return result;
	}

	public int getSearchListCount(Connection con, String search) {
		int result= 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("searchlistCount");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, search);
			rset = pstmt.executeQuery();
			
			
			while(rset.next()){
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
			close(rset);
		}
		
		
		return result;
	}

	public ArrayList<Board> searchBoard(Connection con, int currentPage, int limit, String search) {
		ArrayList<Board> list = new ArrayList<Board>();
		
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String query = prop.getProperty("searchBoard");
		
		try {
			pstmt = con.prepareStatement(query);
			int startRow = (currentPage -1 ) * limit + 1;
			int endRow = startRow + limit - 1;
			pstmt.setString(1, search);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				
				Board b = new Board();
				b.setwNo(rset.getInt("writting_no"));
				b.setTitle(rset.getString("title"));
				b.setText(rset.getString("text"));
				b.setbType(rset.getString("board_type"));
				b.setaText(rset.getString("answer_text"));
				b.setFileNum(rset.getInt("file_num"));
				b.setrDate(rset.getDate("regist_date"));
				b.setpView(rset.getInt("page_view"));
				b.setpId(rset.getInt("p_id"));
				b.setuId(rset.getInt("user_id"));
				b.setNoticeYn(rset.getString("noticeyn"));
				b.setNoticeType(rset.getString("NOTICETYPE"));
				
				list.add(b);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
			close(rset);
		}
		
		return list;
	}

	public PageNP npBoard(Connection con, int wNum) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		PageNP np = null;
		
		String query = prop.getProperty("npBoard");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, wNum);
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				
				np = new PageNP();
				np.setbNum(rset.getInt("writting_no"));
				np.setNext_bNum(rset.getInt("next_writting_no"));
				np.setNext_title(rset.getString("next_title"));
				np.setPrev_bNum(rset.getInt("prev_writting_no"));
				np.setPrev_title(rset.getString("prev_title"));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
			close(rset);
		}
		
		
		return np;
	}

	public int selectCurrval(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int bid=0;
		
		String query = prop.getProperty("selectCurrval");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()){
				bid = rset.getInt("currval");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(stmt);
			close(rset);
		}
		
		return bid;
	}

	public int insertAttachment(Connection con, ArrayList<Attachment> fileList, int uId) {
		int result = 0;
		PreparedStatement pstmt = null;

		String query = prop.getProperty("insertAttachment");
		
		try {
			
			for(int i=0; i < fileList.size(); i++){
				
				
				System.out.println("fileList " + i + " : " + fileList.get(i));
				
				pstmt = con.prepareStatement(query);
				pstmt.setInt(1, fileList.get(i).getBid());
				pstmt.setString(2, fileList.get(i).getOriginName());
				pstmt.setString(3, fileList.get(i).getChangeName());
				pstmt.setString(4, fileList.get(i).getFilePath());

				int level = 0;
			/*	if(i == 0){
					level = 0;
				}else{
					level = 1;
				}*/
				
				pstmt.setInt(5, level);
				pstmt.setInt(6, uId);
				
				result += pstmt.executeUpdate();
				
			}
			
			System.out.println("오류3");
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		
		return result;
	}

	public HashMap<String, Object> selectAttachmentMap(Connection con, String num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		HashMap<String, Object> hmap = null;
		
		ArrayList<Attachment> list = null;
		Attachment at = null;
		
		int count = 0;
		
		String query = prop.getProperty("selectAttachmentOne");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(num));
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Attachment>();
			while(rset.next()){
				
				count++;
				at = new Attachment();
				at.setFid(rset.getInt("fid"));
				at.setBid(rset.getInt("bid"));
				at.setOriginName(rset.getString("origin_name"));
				at.setChangeName(rset.getString("change_name"));
				at.setFilePath(rset.getString("file_path"));
				at.setUploadDate(rset.getDate("upload_date"));
				
				list.add(at);
			}
			
			if(count > 0){
			
				hmap = new HashMap<String, Object>();
				
				hmap.put("attachment", list);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}
		
		
		return hmap;
	}

	public Attachment downloadAttachment(Connection con, int num) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		Attachment file = null;
		
		String query = prop.getProperty("downloadAttachment");
		
		try { 
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, num);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				file = new Attachment();
				
				file.setFid(rset.getInt("fid"));
				file.setBid(rset.getInt("bid"));
				file.setOriginName(rset.getString("origin_name"));
				file.setChangeName(rset.getString("change_name"));
				file.setFilePath(rset.getString("file_path"));
				file.setUploadDate(rset.getDate("upload_date"));
				file.setFileLevel(rset.getInt("file_level"));
				file.setDownloadCount(rset.getInt("download_count"));
				file.setStatus(rset.getString("status"));
				
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
			close(rset);
		}
		
		
		
		return file;
		
		
	}

	public int deleteAtt(Connection con, int wNo) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteAttachment");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, wNo);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		
		
		return result;
	}

	public int insertText(Connection con, String wNo, String text) {
		
		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String query = prop.getProperty("insertText");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, text);
			pstmt.setInt(2, Integer.parseInt(wNo));
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		
		return result;
	}

}
