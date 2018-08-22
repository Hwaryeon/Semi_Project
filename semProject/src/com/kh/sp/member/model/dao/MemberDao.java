package com.kh.sp.member.model.dao;

import static com.kh.sp.common.JDBCTemplate.*;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.sp.member.model.vo.Member;
import com.kh.sp.member.model.dao.MemberDao;

public class MemberDao {
private Properties prop = new Properties();
	// API로그인 구현하면서 insertMember부분 정리하기
    // 메소드 여러개로 쓸것인지 하나로 쓸것인지
    // platform_type, user_class 컬럼 등

	public MemberDao(){
		String fileName = MemberDao.class.getResource("/sql/member/member-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public Member loginCheck(Connection con, String email, String userPwd) {
		Member loginUser = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("loginSelect");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, email);
			pstmt.setString(2, userPwd);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				loginUser = new Member();
				
				loginUser.setUserId(rset.getInt("user_id"));
				loginUser.setPlatformType(rset.getString("platform_type"));
				loginUser.setRefreshToken(rset.getString("refresh_token"));
				loginUser.setEmail(rset.getString("email"));
				loginUser.setUserPwd(rset.getString("user_pwd"));
				loginUser.setUserName(rset.getString("user_name"));
				loginUser.setNickName(rset.getString("nick_name"));
				loginUser.setPhone(rset.getString("phone"));
				loginUser.setAddress(rset.getString("address"));
				loginUser.setInvestorGrade(rset.getString("investor_grade"));
				loginUser.setBusinessLicenseNo(rset.getString("business_license_no"));
				loginUser.setCorporateName(rset.getString("corporate_name"));
				loginUser.setCorporateRegistrationNo(rset.getString("corporate_registration_no"));
				loginUser.setAddress(rset.getString("address"));
				loginUser.setUserClass(rset.getString("user_class"));
				loginUser.setEnrollDate(rset.getDate("enroll_date"));
				loginUser.setStatus(rset.getString("status"));
				loginUser.setPwdStatus(rset.getString("pwd_status"));
				loginUser.setPlatformId(rset.getString("platform_id"));
                 
				System.out.println(loginUser);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return loginUser;
	}

	public int insertMember(Connection con, Member m) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = prop.getProperty("insertMember");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, m.getEmail());
			pstmt.setString(2, "email");
			pstmt.setString(3, m.getUserPwd());
			pstmt.setString(4, m.getPhone());
			pstmt.setString(5, m.getUserName());
			pstmt.setString(6, m.getNickName());
			pstmt.setString(7, m.getBusinessLicenseNo());
			pstmt.setString(8, m.getCorporateRegistrationNo());
			pstmt.setString(9, m.getCorporateName());
			if(m.getBusinessLicenseNo() == ""){
				pstmt.setString(10, "general");
			}else{
				pstmt.setString(10, "business");
			}
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public Member selectOne(Connection con, String userName, String phone) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member m = null;
		
		String query = prop.getProperty("selectOne");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userName);
			pstmt.setString(2, phone);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				m = new Member();
				m.setUserId(rset.getInt("user_id"));
				m.setPlatformType(rset.getString("platform_type"));
				m.setRefreshToken(rset.getString("refresh_token"));
				m.setEmail(rset.getString("email"));
				m.setUserPwd(rset.getString("user_pwd"));
				m.setUserName(rset.getString("user_name"));
				m.setNickName(rset.getString("nick_name"));
				m.setPhone(rset.getString("phone"));
				m.setAddress(rset.getString("address"));
				m.setInvestorGrade(rset.getString("investor_grade"));
				m.setBusinessLicenseNo(rset.getString("business_license_no"));
				m.setCorporateName(rset.getString("corporate_name"));
				m.setCorporateRegistrationNo(rset.getString("corporate_registration_no"));
				m.setAddress(rset.getString("address"));
				m.setUserClass(rset.getString("user_class"));
				m.setEnrollDate(rset.getDate("enroll_date"));
				m.setStatus(rset.getString("status"));
				m.setPwdStatus(rset.getString("pwd_status"));
				m.setPlatformId(rset.getString("platform_id"));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return m;
	}

	public int updatePassword(Connection con, String email, String userPwd, int sw) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updatePassword");
		
		try {
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, userPwd);
				if(sw == 0){
					pstmt.setString(2, "T");
				}else{
					pstmt.setString(2, "NT");
				}
				
				pstmt.setString(3, email);
				result = pstmt.executeUpdate();
	
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int insertSnsMember(Connection con, Member m) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = prop.getProperty("insertSnsMember");
		
		try {
			
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, m.getEmail());
			pstmt.setString(2, m.getPlatformType());
			pstmt.setString(3, m.getRefreshToken());
			pstmt.setString(4, m.getNickName());
			pstmt.setString(5, "general");
			pstmt.setString(6, m.getPlatformId());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public Member checkMember(Connection con, Member m) {
		Member loginUser = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("checkMember");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, m.getPlatformId());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				loginUser = new Member();
				
				loginUser.setUserId(rset.getInt("user_id"));
				loginUser.setPlatformType(rset.getString("platform_type"));
				loginUser.setRefreshToken(rset.getString("refresh_token"));
				loginUser.setEmail(rset.getString("email"));
				loginUser.setUserPwd(rset.getString("user_pwd"));
				loginUser.setUserName(rset.getString("user_name"));
				loginUser.setNickName(rset.getString("nick_name"));
				loginUser.setPhone(rset.getString("phone"));
				loginUser.setAddress(rset.getString("address"));
				loginUser.setInvestorGrade(rset.getString("investor_grade"));
				loginUser.setBusinessLicenseNo(rset.getString("business_license_no"));
				loginUser.setCorporateName(rset.getString("corporate_name"));
				loginUser.setCorporateRegistrationNo(rset.getString("corporate_registration_no"));
				loginUser.setAddress(rset.getString("address"));
				loginUser.setUserClass(rset.getString("user_class"));
				loginUser.setEnrollDate(rset.getDate("enroll_date"));
				loginUser.setStatus(rset.getString("status"));
				loginUser.setPwdStatus(rset.getString("pwd_status"));
				loginUser.setPlatformId(rset.getString("platform_id"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return loginUser;
	}


	public Member checkNickName(Connection con, String nickName) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member m = null;
		
		String qeury = prop.getProperty("checkNickName");
		
		try {
			pstmt = con.prepareStatement(qeury);
			pstmt.setString(1, nickName);
			
            rset = pstmt.executeQuery();
			
			if(rset.next()){
				m = new Member();
				
				m.setUserId(rset.getInt("user_id"));
				m.setPlatformType(rset.getString("platform_type"));
				m.setRefreshToken(rset.getString("refresh_token"));
				m.setEmail(rset.getString("email"));
				m.setUserPwd(rset.getString("user_pwd"));
				m.setUserName(rset.getString("user_name"));
				m.setNickName(rset.getString("nick_name"));
				m.setPhone(rset.getString("phone"));
				m.setAddress(rset.getString("address"));
				m.setInvestorGrade(rset.getString("investor_grade"));
				m.setBusinessLicenseNo(rset.getString("business_license_no"));
				m.setCorporateName(rset.getString("corporate_name"));
				m.setCorporateRegistrationNo(rset.getString("corporate_registration_no"));
				m.setAddress(rset.getString("address"));
				m.setUserClass(rset.getString("user_class"));
				m.setEnrollDate(rset.getDate("enroll_date"));
				m.setStatus(rset.getString("status"));
				m.setPwdStatus(rset.getString("pwd_status"));
				m.setPlatformId(rset.getString("platform_id"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return m;
	}

	public Member checkBusinessLicenseNo(Connection con, String businessLicenseNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member m = null;
		String qeury = prop.getProperty("checkBusinessLicenseNo");
		
		try {
			pstmt = con.prepareStatement(qeury);
			pstmt.setString(1, businessLicenseNo);
			
            rset = pstmt.executeQuery();
			
			if(rset.next()){
				m = new Member();
				
				m.setUserId(rset.getInt("user_id"));
				m.setPlatformType(rset.getString("platform_type"));
				m.setRefreshToken(rset.getString("refresh_token"));
				m.setEmail(rset.getString("email"));
				m.setUserPwd(rset.getString("user_pwd"));
				m.setUserName(rset.getString("user_name"));
				m.setNickName(rset.getString("nick_name"));
				m.setPhone(rset.getString("phone"));
				m.setAddress(rset.getString("address"));
				m.setInvestorGrade(rset.getString("investor_grade"));
				m.setBusinessLicenseNo(rset.getString("business_license_no"));
				m.setCorporateName(rset.getString("corporate_name"));
				m.setCorporateRegistrationNo(rset.getString("corporate_registration_no"));
				m.setAddress(rset.getString("address"));
				m.setUserClass(rset.getString("user_class"));
				m.setEnrollDate(rset.getDate("enroll_date"));
				m.setStatus(rset.getString("status"));
				m.setPwdStatus(rset.getString("pwd_status"));
				m.setPlatformId(rset.getString("platform_id"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return m;
	}

	public Member checkEmail(Connection con, String email) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member m = null;
		String qeury = prop.getProperty("checkEmail");
		
		try {
			pstmt = con.prepareStatement(qeury);
			pstmt.setString(1, email);
			
            rset = pstmt.executeQuery();
			
			if(rset.next()){
				m = new Member();
				
				m.setUserId(rset.getInt("user_id"));
				m.setPlatformType(rset.getString("platform_type"));
				m.setRefreshToken(rset.getString("refresh_token"));
				m.setEmail(rset.getString("email"));
				m.setUserPwd(rset.getString("user_pwd"));
				m.setUserName(rset.getString("user_name"));
				m.setNickName(rset.getString("nick_name"));
				m.setPhone(rset.getString("phone"));
				m.setAddress(rset.getString("address"));
				m.setInvestorGrade(rset.getString("investor_grade"));
				m.setBusinessLicenseNo(rset.getString("business_license_no"));
				m.setCorporateName(rset.getString("corporate_name"));
				m.setCorporateRegistrationNo(rset.getString("corporate_registration_no"));
				m.setAddress(rset.getString("address"));
				m.setUserClass(rset.getString("user_class"));
				m.setEnrollDate(rset.getDate("enroll_date"));
				m.setStatus(rset.getString("status"));
				m.setPwdStatus(rset.getString("pwd_status"));
				m.setPlatformId(rset.getString("platform_id"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return m;
	}

	public Member checkEmailMember(Connection con, String userEmail) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member m = null;
		String qeury = prop.getProperty("checkEmailMember");
		
		try {
			pstmt = con.prepareStatement(qeury);
			pstmt.setString(1, userEmail);
			
            rset = pstmt.executeQuery();
			
			if(rset.next()){
				m = new Member();
				
				m.setUserId(rset.getInt("user_id"));
				m.setPlatformType(rset.getString("platform_type"));
				m.setRefreshToken(rset.getString("refresh_token"));
				m.setEmail(rset.getString("email"));
				m.setUserPwd(rset.getString("user_pwd"));
				m.setUserName(rset.getString("user_name"));
				m.setNickName(rset.getString("nick_name"));
				m.setPhone(rset.getString("phone"));
				m.setAddress(rset.getString("address"));
				m.setInvestorGrade(rset.getString("investor_grade"));
				m.setBusinessLicenseNo(rset.getString("business_license_no"));
				m.setCorporateName(rset.getString("corporate_name"));
				m.setCorporateRegistrationNo(rset.getString("corporate_registration_no"));
				m.setAddress(rset.getString("address"));
				m.setUserClass(rset.getString("user_class"));
				m.setEnrollDate(rset.getDate("enroll_date"));
				m.setStatus(rset.getString("status"));
				m.setPwdStatus(rset.getString("pwd_status"));
				m.setPlatformId(rset.getString("platform_id"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return m;
	}

	public int updateBusinessMember(Connection con, Member m) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = prop.getProperty("updateBusinessMember");
		
		try {
			
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, m.getBusinessLicenseNo());
			pstmt.setString(2, m.getCorporateRegistrationNo());
			pstmt.setString(3, m.getCorporateName());
			pstmt.setInt(4, m.getUserId());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateInvestorMember(Connection con, String userId) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = prop.getProperty("updateInvestorMember");
		
		try {
			
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, userId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int updateMember(Connection con, Member m) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "";
		if(m.getPlatformType().equals("email") && (m.getUserPwd() != null)) {	
			query = prop.getProperty("updateMember1");
			
			try {
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, m.getNickName());//닉네임 set
				pstmt.setString(2, m.getUserPwd());//비밀번호 set
				pstmt.setString(3, m.getPhone());//전화번호 set
				pstmt.setInt(4, m.getUserId());//where절
				
				result = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
		}
		
		else {
			query = prop.getProperty("updateMember2");
			
			try {
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, m.getNickName());//닉네임 set
				pstmt.setString(2, m.getPhone());//전화번호 set
				pstmt.setInt(3, m.getUserId());//where절
				
				result = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
		}
		return result;
	}

	
}
