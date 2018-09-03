package com.kh.sp.admin.model.service;

import static com.kh.sp.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.sp.admin.model.dao.AdminDao;
import com.kh.sp.admin.model.vo.CheckProject;
import com.kh.sp.admin.model.vo.DetailMember;
import com.kh.sp.admin.model.vo.MemberStatistics;
import com.kh.sp.admin.model.vo.OpenFundingStatistics;
import com.kh.sp.admin.model.vo.SalesStatistics;
import com.kh.sp.admin.model.vo.SuccessFundingStatistics;
import com.kh.sp.board.model.vo.Attachment;
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
	//투자자 등급 변경 요청자 출력 메소드 정태
	public ArrayList<DetailMember> selectInvRankList(int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<DetailMember> rankList = new AdminDao().selectInvRankList(con, currentPage, limit);
		
		close(con);
		
		return rankList;
	}
	//투자자 등급 변경 메소드 정태
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
//펀딩 전체 리스트 카운트 정태
	public int getProjectListCount() {
		Connection con = getConnection();
		
		int listCount = new AdminDao().getProjectListCount(con);
		
		close(con);
		
		return listCount;
	}
	//펀딩 전체 조회 메소드 정태
	public ArrayList<CheckProject> selectAllProject(int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<CheckProject> list = new AdminDao().selectAllProject(con, currentPage, limit);
		
		close(con);
		
		return list;	
	}
	//펀딩 정렬 메소드 정태
	public ArrayList<CheckProject> sortProject(int currentPage, int limit, String sort) {
		Connection con = getConnection();
		ArrayList<CheckProject> list = new AdminDao().sortProject(con, currentPage, limit, sort);
		close(con);
		return list;
		
	}
	//펀딩 검색 리스트 카운트 메소드 정태
	public int searchProjectListCount(String text) {
		Connection con = getConnection();
		
		int searchList = new AdminDao().searchProjectListCount(con, text);
		
		close(con);
		
		return searchList;
	}
	//펀딩 검색 메소드 정태
	public ArrayList<CheckProject> searchProject(int currentPage, int limit, String text) {
		
		Connection con = getConnection();
		ArrayList<CheckProject> list = new AdminDao().searchProject(con, currentPage, limit,text);
		close(con);
		return list;
	}
	//투자자일 때, 회원 상세보기 정태
	public DetailMember selectOneInv(int user_id) {
		Connection con = getConnection();
		DetailMember dm = new AdminDao().selectOneInv(con, user_id);
		close(con);

		return dm;
	}
	public DetailMember selectOneInv2(int user_id) {
		Connection con = getConnection();
		DetailMember dm2 = new AdminDao().selectOneInv2(con, user_id);
		close(con);

		return dm2;
	}
	//사업자일 때, 회원 상세보기 정태
	public DetailMember selectOneEnp(int user_id) {
		Connection con = getConnection();
		DetailMember dm = new AdminDao().selectOneEnp(con, user_id);
		close(con);
		
		return dm;
	}




	
	  	

	//////////////////////////////여기서부터 별림이꺼///////////////////////////////////////
		public ArrayList<SalesStatistics> selectSalesList(String type, String term, int currentPage, int limit) {
			Connection con = getConnection();
			ArrayList<SalesStatistics> list = null;
			
			if(term.equals("month")){
				if(type.equals("all")){
					list = new AdminDao().selectAllSalesMonthList(con,currentPage,limit);
				}else{
					list = new AdminDao().selectSalesTypeMonthList(con,type,currentPage,limit);
				}
				
			}else{
				if(type.equals("all")){
					list = new AdminDao().selectAllSalesYearList(con,currentPage,limit);
				}else{
					list = new AdminDao().selectSalesTypeYearList(con,type,currentPage,limit);
				}
				
			}
			
			close(con);
			return list;
		}

		public ArrayList<OpenFundingStatistics> selectOpenFundingList(String str, int currentPage, int limit) {
			Connection con = getConnection();
			ArrayList<OpenFundingStatistics> list = null;
					
			if(str.equals("month")){
				list = new AdminDao().selectOpenFundingMonthList(con,currentPage,limit);
			}else{
				list = new AdminDao().selectOpenFundingYearList(con,currentPage,limit);
			}	
					
			close(con);
			return list;
		}

		public ArrayList<SuccessFundingStatistics> selectSuccessFundingList(String str, int currentPage, int limit) {
			Connection con = getConnection();
			ArrayList<SuccessFundingStatistics> list = null;
			if(str.equals("month")){
				list = new AdminDao().selectSuccessFundingMonthList(con,currentPage,limit);
			}else{
				list = new AdminDao().selectSuccessFundingYearList(con,currentPage,limit);
			}	
					
			close(con);
			return list;
		}
 
		 
		public ArrayList<MemberStatistics> selectMemberList(String str, int currentPage, int limit) {
			Connection con = getConnection();
			ArrayList<MemberStatistics> list = null;
			
			if(str.equals("date")){
				list = new AdminDao().selectMemberDateList(con,currentPage,limit);
			}else if(str.equals("month")){
				list = new AdminDao().selectMemberMonthList(con,currentPage,limit);
			}else{
				list = new AdminDao().selectMemberYearList(con,currentPage,limit);
			}
			
			close(con);
			return list;
		}
		
		public int getSalesListCount(String term, String type) {
			Connection con = getConnection();
			int listCount = 0;
			if(term == null){
				if(type == null){
					listCount = new AdminDao().getSalesMonthListCount(con);
				}else{
					listCount = new AdminDao().getSalesTypeMonthListCount(con, type);
				}
			}else{
				if(type == null){
					listCount = new AdminDao().getSalesYearListCount(con);
				}else{
					listCount = new AdminDao().getSalesTypeYearListCount(con, type);
				}
				
			}
			 
			close(con);
			return listCount;
		}
		
		public int getOpenFundingListCount(String term) {
			Connection con = getConnection();
			int listCount = 0;
			if(term == null){
				listCount = new AdminDao().getOpenFundingMonthListCount(con);
			}else{
				listCount = new AdminDao().getOpenFundingYearListCount(con);
			}
			close(con);
			return listCount;
		}
		
		public int getSuccessFundingListCount(String term) {
			Connection con = getConnection();
			int listCount = 0;
			if(term == null){
				listCount = new AdminDao().getSuccessFundingMonthListCount(con);
			}else{
				listCount = new AdminDao().getSuccessFundingYearListCount(con);
			}
			
			close(con);
			return listCount;
		}
		
		public int getMemberListCount(String term) {
			Connection con = getConnection();
			int listCount = 0;
			if(term == null){
				listCount = new AdminDao().getMemberDateListCount(con, term);
			}else if(term.equals("month")){
				listCount = new AdminDao().getMemberMonthListCount(con, term);
			}else{
				listCount = new AdminDao().getMemberYearListCount(con, term);
			}
			close(con);
			return listCount;
		}
		public Attachment userDownloadFileAttachment(int num) {
			Connection con = getConnection();
			
			Attachment file = new AdminDao().userDownloadFileAttachment(con, num);
			
			return file;
		}
		public int updateRank2(int userId) {
			Connection con = getConnection();
			int result = new AdminDao().updateRank2(con, userId);
			
			if(result > 0 ){
				commit(con);
			}
			else{
				rollback(con);
			}
			
			return result;
		}
		public int getInvdlineListCount() {
			Connection con = getConnection();
			
			int listCount = new AdminDao().getDlineListCount(con);
			
			close(con);
			  
			return listCount;
		}
		public ArrayList<DetailMember> selectAllDlineList(int currentPage, int limit) {
			Connection con = getConnection();
			
			ArrayList<DetailMember> DlineList = new AdminDao().selectDlineList(con, currentPage, limit);
			
			close(con);
			
			return DlineList;
		
		}
		public int updateDline(int p_Id) {
			Connection con = getConnection();
			int result = new AdminDao().updateDline(con, p_Id);
			
			if(result > 0 ){
				commit(con);
			}
			else{
				rollback(con);
			}
			
			return result;
		}
		public int updateDline2(int p_Id) {
			Connection con = getConnection();
			int result = new AdminDao().updateDline2(con, p_Id);
			
			if(result > 0 ){
				commit(con);
			}
			else{
				rollback(con);
			}
			
			return result;
		}
		public ArrayList<DetailMember> selectAllConfirm(int currentPage, int limit) {
			Connection con = getConnection();
			
			ArrayList<DetailMember> confirmList = new AdminDao().selectConfirmList(con, currentPage, limit);
			
			close(con);
			
			return confirmList;
		
		}
		public int getConfirmListCount() {

		Connection con = getConnection();
		
		int listCount = new AdminDao().getConfirmListCount(con);
		
		close(con);
		  
		return listCount;
	
	}
		public int updateConfirm(int p_Id) {
			Connection con = getConnection();
			int result = new AdminDao().updateConfirm(con, p_Id);
			
			if(result > 0 ){
				commit(con);
			}
			else{
				rollback(con);
			}
			
			return result;
		}
		public int updateConfirm2(int p_Id) {
			Connection con = getConnection();
			int result = new AdminDao().updateConfirm2(con, p_Id);
			
			if(result > 0 ){
				commit(con);
			}
			else{
				rollback(con);
			}
			
			return result;
		}
		public Attachment downloadFileAttachment(int num) {
			// TODO Auto-generated method stub
			return null;
		}
		
}
