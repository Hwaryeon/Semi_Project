package com.kh.ic.mypage.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.ic.mypage.model.dao.MypageDetailDao;
import com.kh.ic.mypage.model.vo.MypageDetail;
import static com.kh.ic.common.JDBCTemplate.*;

public class MypageDetailService {

	public ArrayList<MypageDetail> selectList(int userId) {
		ArrayList<MypageDetail> list = new ArrayList<MypageDetail>();
		
		Connection con = getConnection();
		
		list = new MypageDetailDao().selectList(con, userId);
		
		close(con);
		
		return list;
	}

}
