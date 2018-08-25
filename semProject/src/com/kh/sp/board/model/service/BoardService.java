package com.kh.sp.board.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.sp.board.model.dao.BoardDao;
import com.kh.sp.board.model.vo.Attachment;
import com.kh.sp.board.model.vo.Board;
import com.kh.sp.board.model.vo.PageNP;

import static com.kh.sp.common.JDBCTemplate.getConnection;
import static com.kh.sp.common.JDBCTemplate.*;

public class BoardService {

	public int insertBoard(Board board) {

		Connection con = getConnection();

		/*System.out.println("연결확인 : " + con);*/

		int result = new BoardDao().insertBoard(con, board);

		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}

		close(con);

		return result;
	}

	public ArrayList<Board> allBoard(int currentPage, int limit) {

		ArrayList<Board> list = new ArrayList<Board>();

		Connection con = getConnection();

		list = new BoardDao().allBoard(con, currentPage, limit);

		close(con);


		return list;
	}

	public Board detailBoard(int wNum, int type) {

		Connection con = getConnection();

		Board b = new BoardDao().detailBoard(con, wNum, type);

		commit(con);

		close(con);

		return b;
	}

	public int updateBoard(Board b) {

		Connection con = getConnection();

		int result = new BoardDao().updateBoard(con, b);

		if(result >0){
			commit(con);
		}else{
			rollback(con);
		}
		close(con);

		return result;
	}

	public int deleteBoard(int wNo) {

		Connection con = getConnection();

		int result = new BoardDao().deleteBoard(con, wNo);

		if(result > 0){

			new BoardDao().deleteAtt(con, wNo);

			commit(con);
		}else{
			rollback(con);
		}

		close(con);

		return result;
	}

	public int getListCount() {
		Connection con = getConnection();

		int count = new BoardDao().getListCount(con);

		close(con);

		return count;
	}

	public int getSearchListCount(String search) {
		Connection con = getConnection();

		int count = new BoardDao().getSearchListCount(con, search);

		close(con);

		return count;
	}

	public ArrayList<Board> searchBoard(int currentPage, int limit, String search) {
		ArrayList<Board> list = new ArrayList<Board>();

		Connection con = getConnection();

		list = new BoardDao().searchBoard(con, currentPage, limit, search);

		close(con);


		return list;
	}

	public PageNP npBoard(int wNum) {

		Connection con = getConnection();

		PageNP np = new BoardDao().npBoard(con, wNum);

		close(con);

		return np;
	}

	public int insertAttachment(Board board, ArrayList<Attachment> fileList, int count, int uId) {

		int result= 0;
		Connection con = getConnection();

		//게시물생성
		int result1 = new BoardDao().insertBoard(con, board);

		if(count != 3){

			if(result1 > 0 ){
				//최근발생한 시퀀스값을 가지고온다
				int bid = new BoardDao().selectCurrval(con);

				// 하나의 게시물에 여러 첨부파일이 들어가면  하나의 게시물에 대한 번호만을 가지고 있어야하므로
				for(int i=0; i<fileList.size(); i++){
					System.out.println("insert 파일리스트");
					fileList.get(i).setBid(bid);
				}
			}

			//첨부파일 DB저장
			int result2 = new BoardDao().insertAttachment(con, fileList, uId);

			if(result1 >0 && result2 >0){
				commit(con);	
				result = 1;
			}else{
				rollback(con);
			}
		}else{
			if(result1 >0){
				commit(con);
				result = 1;
			}else{
				rollback(con);
			}
		}
		close(con);

		return result;
	}

	public int updateAttachment(int wNo, ArrayList<Attachment> fileList, int count, int uId) {

		int result= 0;
		Connection con = getConnection();

		if(count != 3){

			// 하나의 게시물에 여러 첨부파일이 들어가면  하나의 게시물에 대한 번호만을 가지고 있어야하므로
			for(int i=0; i<fileList.size(); i++){
				System.out.println("update 파일리스트");
				fileList.get(i).setBid(wNo);
			}

			//첨부파일 DB저장
			result = new BoardDao().insertAttachment(con, fileList, uId);

			if(result > 0){
				commit(con);
			}else{
				rollback(con);
			}
			System.out.println("첨부파일 업데이트됨");

		}
		
		if(count == 3){
			result = 1;
		}
		
		close(con);

		return result;
	}

	public HashMap<String, Object> selectOneAttachment(String num) {
		Connection con = getConnection();

		HashMap<String, Object> hmap = null;

		hmap = new BoardDao().selectAttachmentMap(con, num);

		close(con);

		return hmap;
	}

	public Attachment downloadAttachment(int num) {
		Connection con = getConnection();

		Attachment file = new BoardDao().downloadAttachment(con, num);

		close(con);

		return file;
	}

	public int deleteAtt(int wNo) {

		Connection con = getConnection();

		int result = new BoardDao().deleteAtt(con, wNo);

		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}

		close(con);

		return result;
	}

	public int insertText(String wNo, String text) {

		Connection con = getConnection();

		int result = new BoardDao().insertText(con, wNo, text);

		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}

		close(con);

		return result;
	}



}
