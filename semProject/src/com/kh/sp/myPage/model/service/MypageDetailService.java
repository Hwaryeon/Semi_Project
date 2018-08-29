package com.kh.sp.myPage.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.sp.board.model.dao.BoardDao;
import com.kh.sp.board.model.vo.Attachment;
import com.kh.sp.member.model.vo.Member;
import com.kh.sp.myPage.model.dao.MypageDetailDao;
import com.kh.sp.myPage.model.vo.MypageDetail;
import static com.kh.sp.common.JDBCTemplate.*;

public class MypageDetailService {

	public ArrayList<MypageDetail> selectList(int userId, int currentPage, int limit, String userClass) {
		
		//System.out.println("Service currentPage : " + currentPage);
		Connection con = getConnection();
		
		
		ArrayList<MypageDetail> list = new MypageDetailDao().selectList(con, userId, currentPage, limit, userClass);
		
		close(con);
		
		return list;
	}

	public int insertAttachment(ArrayList<Attachment> fileList, int userid, int ptype) {
		Connection con = getConnection();
		
		int result = new MypageDetailDao().insertAttachment(con, fileList, userid, ptype);
		
		if(result > 0) {
			commit(con);
		}
		else {
			rollback(con);
		}
		close(con);
		return result;
	}

	public int getListCount(int userid, String userclass) {
		Connection con = getConnection();

		int count = new MypageDetailDao().getListCount(con, userid, userclass);

		close(con);

		return count;
	}

	public int getListCountPayment(int userId, String userClass) {
		Connection con = getConnection();
		
		int count = new MypageDetailDao().getListCountPayment(con, userId, userClass);
		
		close(con);
		
		return count;
	}

	public ArrayList<MypageDetail> selectListPayment(int userId, int currentPage, int limit, String userClass) {
		Connection con = getConnection();
		
		
		ArrayList<MypageDetail> list = new MypageDetailDao().selectListPayment(con, userId, currentPage, limit, userClass);
		
		close(con);
		
		return list;
	}

}
