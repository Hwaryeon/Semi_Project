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
		Connection con = getConnection();
		
		ArrayList<MypageDetail> list = new ArrayList<MypageDetail>();
		if(userClass.equals("investor")){
			list = new MypageDetailDao().selectList(con, userId, currentPage, limit, userClass);
		}
		else {
			list = new MypageDetailDao().selectList2(con, userId, currentPage, limit, userClass);
		}
		close(con);
		
		return list;
	}

	public int insertAttachment(ArrayList<Attachment> fileList, int userid, int ptype) {
		Connection con = getConnection();
		
		int result = new MypageDetailDao().insertAttachment(con, fileList, userid, ptype);
		int result2 = new MypageDetailDao().updateGradingStatus(con, userid);
		int finalresult;
		if(result > 0 && result2 > 0) {
			commit(con);
			finalresult = 1;
		}
		else {
			rollback(con);
			finalresult = 0;
		}
		close(con);
		return finalresult;
	}

	public int getListCount(int userid, String userclass) {
		Connection con = getConnection();
		int count = 0;
		if(userclass.equals("investor")) {
			count = new MypageDetailDao().getListCount(con, userid, userclass);
		} else {
			count = new MypageDetailDao().getListCount2(con, userid, userclass);
		}

		close(con);

		return count;
	}

	public int getListCountPayment(int userId, String userClass) {
		Connection con = getConnection();
		int count = 0;
		if(userClass.equals("investor")) {
			count = new MypageDetailDao().getListCountPayment(con, userId, userClass);
		} else {
			count = new MypageDetailDao().getListCountPayment2(con, userId, userClass);
		}
		close(con);
		return count;
	}

	public ArrayList<MypageDetail> selectListPayment(int userId, int currentPage, int limit, String userClass) {
		Connection con = getConnection();
		ArrayList<MypageDetail> list = new ArrayList<MypageDetail>();
		if(userClass.equals("investor")) {
			list = new MypageDetailDao().selectListPayment(con, userId, currentPage, limit, userClass);
		} else {
			list = new MypageDetailDao().selectListPayment2(con, userId, currentPage, limit, userClass);
		}
		
		close(con); 
		
		return list;
	}

}
