package com.kh.sp.admin.model.service;

import static com.kh.sp.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.sp.admin.model.dao.AdminDao;
import com.kh.sp.admin.model.vo.MemberStatistics;
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
	public int getBlackListCount() {
		Connection con = getConnection();
		
		int blackListCount = new AdminDao().getBlackListCount(con);
		
		close(con);
		
		return blackListCount;
	}
	//회원 전체 조회 메소드
	public ArrayList<Member> selectList(int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<Member> list = new AdminDao().selectList(con, currentPage, limit);
		
		close(con);
		
		return list;	
	
	}
	//회원 검색
	public ArrayList<Member> searchAllMember(int currentPage, int limit, String text) {
		Connection con = getConnection();
		ArrayList<Member> list = new AdminDao().searchAllMember(con, currentPage, limit,text);
		close(con);
		return list;
		
	}
	//회원 정렬 메소드
	public ArrayList<Member> sortMember(int currentPage, int limit, String sort) {
		Connection con = getConnection();
		ArrayList<Member> list = new AdminDao().sortMember(con, currentPage, limit, sort);
		close(con);
		return list;
		
	}

	
	//회원 상세 조회
	public Member selectOne(int user_id) {
		Connection con = getConnection();
				
		Member m = new AdminDao().selectOne(con, user_id);
		
		close(con);
		
		return m;
	}

	//블랙리스트 전체 조회
	public ArrayList<Member> selectBlackList(int currentPage, int limit) {

		Connection con = getConnection();
		System.out.println("서비스도 안와?");
		ArrayList<Member> blackList = new AdminDao().selectBlackList(con, currentPage, limit);
		
		close(con);
		
		return blackList;	
	}
	//회원 검색 카운트
	public int searchMemberListCount(String text) {
	Connection con = getConnection();
		
		int searchList = new AdminDao().searchMemberListCount(con, text);
		
		close(con);
		
		return searchList;
	}
	//블랙리스트 카운트
	public int blackListCount(String text) {
		Connection con = getConnection();
		
		int listCount = new AdminDao().blackListCount(con, text);
		
		close(con);
		
		return listCount;
	}
	//블랙리스트 검색
	public ArrayList<Member> searchBlackMember(int currentPage, int limit, String text) {
		Connection con = getConnection();
		ArrayList<Member> blackList = new AdminDao().searchBlackMember(con, currentPage, limit, text);
		close(con);
		return blackList;
		
		}


	public int insertBlackList(String text, int userId) {

		Connection con = getConnection();
		
		int result = new AdminDao().insertBlackList(con, text, userId);
		
		if(result>0){
			commit(con);
		}else{
			rollback(con);
		}
		
		close(con);
		return result;
	}
	public int getInvRankListCount() {
		Connection con = getConnection();
		
		int listCount = new AdminDao().getInvRankListCount(con);
		
		close(con);
		
		return listCount;
	}
	
	public ArrayList<Member> selectInvRankList(int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<Member> rankList = new AdminDao().selectInvRankList(con, currentPage, limit);
		
		close(con);
		
		return rankList;
	}
	public int updateRank(int userId) {
		Connection con = getConnection();
		int result = new AdminDao().updateRank(con, userId);
		
		if(result > 0 ){
			commit(con);
		}
		else{
			rollback(con);
		}
		
		return result;
	}



	
	  	

	//////////////////////////////여기서부터 별림이꺼///////////////////////////////////////
		public ArrayList<SalesStatistics> selectSalesList(String type, String term, int currentPage, int limit) {
			Connection con = getConnection();
			ArrayList<SalesStatistics> list = new AdminDao().selectSalesList(con,type,term,currentPage,limit);
			close(con);
			return list;
		}

		public ArrayList<OpenFundingStatistics> selectOpenFundingList(String str, int currentPage, int limit) {
			Connection con = getConnection();
			ArrayList<OpenFundingStatistics> list = new AdminDao().selectOpenFundingList(con,str,currentPage,limit);
			close(con);
			return list;
		}

		public ArrayList<SuccessFundingStatistics> selectSuccessFundingList(String str, int currentPage, int limit) {
			Connection con = getConnection();
			ArrayList<SuccessFundingStatistics> list = new AdminDao().selectSuccessFundingList(con,str,currentPage,limit);
			close(con);
			return list;
		}

		public ArrayList<MemberStatistics> selectMemberList(String str, int currentPage, int limit) {
			Connection con = getConnection();
			ArrayList<MemberStatistics> list = new AdminDao().selectMemberList(con,str,currentPage,limit);
			close(con);
			return list;
		}
		public int getSalesListCount(String term, String type) {
			Connection con = getConnection();
			int listCount = new AdminDao().getSalesListCount(con, term, type);
			close(con);
			return listCount;
		}
		public int getOpenFundingListCount(String term) {
			Connection con = getConnection();
			int listCount = new AdminDao().getOpenFundingListCount(con, term);
			close(con);
			return listCount;
		}
		public int getSuccessFundingListCount(String term) {
			Connection con = getConnection();
			int listCount = new AdminDao().getSuccessFundingListCount(con, term);
			close(con);
			return listCount;
		}
		public int getMemberListCount(String term) {
			Connection con = getConnection();
			int listCount = new AdminDao().getMemberListCount(con, term);
			close(con);
			return listCount;
		}
	
	

}
