package com.kh.sp.admin.model.service;

import static com.kh.sp.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.sp.admin.model.dao.AdminDao;
import com.kh.sp.admin.model.vo.OpenFundingStatistics;
import com.kh.sp.admin.model.vo.SalesStatistics;
import com.kh.sp.admin.model.vo.SuccessFundingStatistics;
import com.kh.sp.member.model.vo.Member;


public class AdminService {

	public int getListCount() {
		Connection con = getConnection();
		
		int listCount = new AdminDao().getListCount(con);
		
		close(con);
		
		return listCount;
	}

	public ArrayList<Member> selectList(int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<Member> list = new AdminDao().selectList(con, currentPage, limit);
		
		close(con);
		
		return list;	
	
	}

	public ArrayList<Member> searchAllMember(int currentPage, int limit, String text) {
		Connection con = getConnection();
		ArrayList<Member> list = new AdminDao().searchAllMember(con, currentPage, limit,text);
		close(con);
		return list;
		
	}
	public ArrayList<Member> sortMember(int currentPage, int limit, String sort) {
		Connection con = getConnection();
		ArrayList<Member> list = new AdminDao().sortMember(con, currentPage, limit, sort);
		close(con);
		return list;
		
	}

	
	public Member selectOne(int user_id) {
		Connection con = getConnection();
				
		Member m = new AdminDao().selectOne(con, user_id);
		
		/*if(m != null){
			commit(con);
		}
		else {
			rollback(con);
		}
		
		*/
		close(con);
		
		return m;
	}


	public ArrayList<SalesStatistics> selectSalesList(int num, String str) {
		Connection con = getConnection();
		ArrayList<SalesStatistics> list = new AdminDao().selectSalesList(con,num,str);
		close(con);
		return list;
	}

	public ArrayList<OpenFundingStatistics> selectOpenFundingList(String str) {
		Connection con = getConnection();
		ArrayList<OpenFundingStatistics> list = new AdminDao().selectOpenFundingList(con,str);
		close(con);
		return list;
	}

	public ArrayList<SuccessFundingStatistics> selectSuccessFundingList(String str) {
		Connection con = getConnection();
		ArrayList<SuccessFundingStatistics> list = new AdminDao().selectSuccessFundingList(con,str);
		close(con);
		return list;
	}
}
