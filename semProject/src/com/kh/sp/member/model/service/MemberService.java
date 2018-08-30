package com.kh.sp.member.model.service;

import com.kh.sp.member.model.dao.MemberDao;
import com.kh.sp.member.model.vo.Member;
import static com.kh.sp.common.JDBCTemplate.*;

import java.sql.Connection;

public class MemberService {

	public Member loginCheck(String email, String userPwd) {
		Connection con = getConnection();
		Member loginUser = new MemberDao().loginCheck(con, email, userPwd);
		
		close(con);
		
		return loginUser;
	}

	public int insertMember(Member member) {
		Connection con = getConnection();
		int result = new MemberDao().insertMember(con, member);
		
		if(result > 0){
			commit(con);
			System.out.println("커밋");
		}else{
			rollback(con);
			System.out.println("롤백");
		}
		
		close(con);
		
		return result;
	}

	public Member selectOne(String userName, String phone) {
		Connection con = getConnection();
		
		Member m = new MemberDao().selectOne(con, userName, phone);
		
		if(m != null){
			commit(con);
		}else{
			rollback(con);
		}
		
		close(con);
		
		return m;
	}

	public int updatePassword(String email, String userPwd, int sw) {
		Connection con = getConnection();
		
		int result = new MemberDao().updatePassword(con, email, userPwd, sw);
		
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public int insertSnsMember(Member member) {
		Connection con = getConnection();
		int result = new MemberDao().insertSnsMember(con, member);
		
		if(result > 0){
			commit(con);
			System.out.println("커밋");
		}else{
			rollback(con);
			System.out.println("롤백");
		}
		
		close(con);
		
		return result;
	}

	public Member checkMember(Member m) {
		Connection con = getConnection();
		Member loginUser = new MemberDao().checkMember(con, m);
		
        close(con);
		
		return loginUser;
	}


	public Member checkNickName(String nickName) {
		Connection con = getConnection();
		Member m = new Member();
		m = new MemberDao().checkNickName(con, nickName);
		close(con);
		return m;
	}

	public Member checkBusinessLicenseNo(String businessLicenseNo) {
		Connection con = getConnection();
		Member m = new Member();
		m = new MemberDao().checkBusinessLicenseNo(con, businessLicenseNo);
		close(con);
		return m;
	}

	public Member checkEmail(String email) {
		Connection con = getConnection();
		Member m = new Member();
		m = new MemberDao().checkEmail(con, email);
		close(con);
		return m;
	}

	public Member checkEmailMember(String userEmail) {
		Connection con = getConnection();
		Member m = new Member();
		m = new MemberDao().checkEmailMember(con, userEmail);
		close(con);
		return m;
	}

	public int updateBusinessMember(Member member) {
		Connection con = getConnection();
		int result = new MemberDao().updateBusinessMember(con, member);
		
		if(result > 0){
			commit(con);
			System.out.println("커밋");
		}else{
			rollback(con);
			System.out.println("롤백");
		}
		
		close(con);
		
		return result;
	}

	public int updateInvestorMember(String userId) {
		Connection con = getConnection();
		int result = new MemberDao().updateInvestorMember(con, userId);
		
		if(result > 0){
			commit(con);
			System.out.println("커밋");
		}else{
			rollback(con);
			System.out.println("롤백");
		}
		
		close(con);
		
		return result;
	}
	
	public int updateMember(Member m) {
		Connection con = getConnection();
		int result = 0;
		if(m.getUserPwd() != null) {
			result =  new MemberDao().updateMember(con, m);
		} else {
			result = new MemberDao().updateMember2(con, m);
		}
		
		if(result > 0){
			commit(con);
			System.out.println("커밋");
		}else{
			rollback(con);
			System.out.println("롤백");
		}
		
		close(con);
		
		return result;
	}

	public Member checkUserId(String userId) {
		Connection con = getConnection();
		Member m = new Member();
		m = new MemberDao().checkEmail(con, userId);
		close(con);
		return m;
	}

	public int deleteMember(Member m) {
		Connection con = getConnection();
		
		int result = new MemberDao().deleteMember(con, m);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}



}
