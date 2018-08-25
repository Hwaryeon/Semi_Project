package com.kh.sp.admin.model.dao;

import static com.kh.sp.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.sp.admin.model.vo.MemberStatistics;
import com.kh.sp.admin.model.vo.OpenFundingStatistics;
import com.kh.sp.admin.model.vo.SalesStatistics;
import com.kh.sp.admin.model.vo.SuccessFundingStatistics;
import com.kh.sp.member.model.vo.Member;

public class AdminDao {
	private Properties prop = new Properties();

	public AdminDao(){
		String fileName = AdminDao.class.getResource("/sql/admin/admin-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	public int getListCount(Connection con) {
		Statement stmt = null;
		int listCount = 0;
		ResultSet rset = null;

		String query = prop.getProperty("listCount");

		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);

			if(rset.next()) {
				listCount = rset.getInt(1);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(stmt);
			close(rset);

		}


		return listCount;
	}

	public ArrayList<Member> selectList(Connection con, int currentPage, int limit) {
		ArrayList<Member> list = null;

		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = prop.getProperty("selectAllMember");

		try {
			pstmt = con.prepareStatement(query);

			int startRow = (currentPage -1) * limit + 1;
			int endRow = startRow + limit -1;

			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rset = pstmt.executeQuery();

			list = new ArrayList<Member>();

			while(rset.next()){
				Member m = new Member();

				m.setUserId(rset.getInt("user_Id"));
				m.setUserClass(rset.getString("user_Class"));
				m.setUserName(rset.getString("user_Name"));
				m.setNickName(rset.getString("nick_Name"));
				m.setEmail(rset.getString("email"));
				m.setPhone(rset.getString("phone"));

				list.add(m);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
			close(rset);
		}


		return list;
	}

	public ArrayList<Member> searchAllMember(Connection con, int currentPage, int limit, String text) {
		ArrayList<Member> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = prop.getProperty("searchAllMember");
		System.out.println("제발 여기까진 와주라");
		try {
			pstmt= con.prepareStatement(query);

			int startRow = (currentPage -1) * limit + 1;
			int endRow = startRow + limit -1;

			pstmt.setString(1, text);
			pstmt.setString(2, text);
			pstmt.setString(3, text);
			pstmt.setString(4, text);
			pstmt.setString(5, text);
			pstmt.setString(6, text);
			pstmt.setInt(7, startRow);
			pstmt.setInt(8, endRow);

			list = new ArrayList<Member>();
			rset = pstmt.executeQuery();
			while(rset.next()){
				Member m = new Member();

				m.setUserId(rset.getInt("user_Id"));
				m.setUserClass(rset.getString("user_Class"));
				m.setUserName(rset.getString("user_Name"));
				m.setNickName(rset.getString("nick_Name"));
				m.setEmail(rset.getString("email"));
				m.setPhone(rset.getString("phone"));

				list.add(m);
			};

		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
			close(rset);
		}
		System.out.println("리스트는~" + list);

		return list;
	}
	public ArrayList<Member> sortMember(Connection con, int currentPage, int limit, String sort) {

		ArrayList<Member> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query1 = prop.getProperty("sortUser_id");
		String query2 = prop.getProperty("sortUser_class");
		String query3 = prop.getProperty("sortUser_name");
		String query4 = prop.getProperty("sortNick_name");
		String query5 = prop.getProperty("sortEmail");
		String query6 = prop.getProperty("sortPhone");


		System.out.println("출력좀되라");
		System.out.println("여기출력되는거 맞아?");
		System.out.println(sort);

		try {


			if(sort.equals("user_id")){
				pstmt = con.prepareStatement(query1);
			}else if(sort.equals("user_class")){
				pstmt = con.prepareStatement(query2);
			}else if(sort.equals("user_name")){
				pstmt = con.prepareStatement(query3);
			}else if(sort.equals("nickname")){
				pstmt = con.prepareStatement(query4);
			}else if(sort.equals("email")){
				pstmt = con.prepareStatement(query5);
			}else if(sort.equals("phone")){
				pstmt = con.prepareStatement(query6);
			}
			int startRow = (currentPage -1) * limit + 1;
			int endRow = startRow + limit -1;

			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rset = pstmt.executeQuery();

			list = new ArrayList<Member>();

			while(rset.next()){

				Member m = new Member();

				m.setUserId(rset.getInt("user_Id"));
				m.setUserClass(rset.getString("user_Class"));
				m.setUserName(rset.getString("user_Name"));
				m.setNickName(rset.getString("nick_Name"));
				m.setEmail(rset.getString("email"));
				m.setPhone(rset.getString("phone"));

				list.add(m);
			};


		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}


		System.out.println("list 가져왔어요" + list);
		return list;

	}



	public Member selectOne(Connection con, int user_id) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		Member m = null;
		
		String query = prop.getProperty("selectOneMember");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, user_id);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member();
				
				m.setUserId(rset.getInt("user_id"));
				m.setUserClass(rset.getString("user_class"));
				m.setUserName(rset.getString("user_name"));
				m.setNickName(rset.getString("nick_name"));
				m.setEmail(rset.getString("email"));
				m.setPhone(rset.getString("phone"));
				m.setEnrollDate(rset.getDate("enroll_date"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		System.out.println("객체 m 은 ? = " + m);
		return m;
	}


	public ArrayList<SalesStatistics> selectSalesList(Connection con, int num, String str) {
		ArrayList<SalesStatistics> list = new ArrayList<SalesStatistics>();
		SalesStatistics result = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = null;
		
		if(num == 0){
			if(str.equals("date")){
			    query = prop.getProperty("selectAllSalesDate");
			}else if(str.equals("month")){
				query = prop.getProperty("selectAllSalesMonth");
			}else{
				query = prop.getProperty("selectAllSalesYear");
			}
		}else if(num == 1){
			if(str.equals("date")){
			    query = prop.getProperty("selectType1SalesDate");
			}else if(str.equals("month")){
				query = prop.getProperty("selectType1SalesMonth");
			}else{
				query = prop.getProperty("selectType1SalesYear");
			}
		}else if(num == 2){
			if(str.equals("date")){
			    query = prop.getProperty("selectType2SalesDate");
			}else if(str.equals("month")){
				query = prop.getProperty("selectType2SalesMonth");
			}else{
				query = prop.getProperty("selectType2SalesYear");
			}
		}else if(num == 3){
			if(str.equals("date")){
			    query = prop.getProperty("selectType3SalesDate");
			}else if(str.equals("month")){
				query = prop.getProperty("selectType3SalesMonth");
			}else{
				query = prop.getProperty("selectType3SalesYear");
			}
		}
		
		try {
			pstmt = con.prepareStatement(query);
			
			
			
			
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				result = new SalesStatistics();
				
				result.setTerm(rset.getString(""));
				result.setPaymentCount(rset.getInt(""));
				result.setPaymentPrice(rset.getInt(""));
				result.setRefundCount(rset.getInt(""));
				result.setFailCount(rset.getInt(""));
				result.setCancelCount(rset.getInt(""));
				result.setPaymentPercentage(rset.getInt(""));
				result.setPaymentCompletePrice(rset.getInt(""));
				result.setNetSales(rset.getInt(""));
				
				list.add(result);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		
		return list;
	}

	public ArrayList<OpenFundingStatistics> selectOpenFundingList(Connection con, String str) {
		ArrayList<OpenFundingStatistics> list = new ArrayList<OpenFundingStatistics>();
		OpenFundingStatistics result = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = null;
		
		if(str.equals("month")){
			query = prop.getProperty("selectOpenFundingMonth");
		}else{
			query = prop.getProperty("selectOpenFundingYear");
		}
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, "펀딩등록");
			pstmt.setString(2, "펀딩승인");
			pstmt.setString(3, "펀딩승인");
			pstmt.setString(4, "펀딩등록");
			pstmt.setString(5, "펀딩등록");
			pstmt.setString(6, "펀딩승인");
			pstmt.setString(7, "펀딩승인");
			pstmt.setString(8, "펀딩승인");
			
            rset = pstmt.executeQuery();
			
			while(rset.next()){
				result = new OpenFundingStatistics();
				
				result.setTerm(rset.getString("term"));
				result.setEnrollCount(rset.getInt("enroll_count"));
				result.setOpenCount(rset.getInt("open_count"));
				result.setApprovalRate(rset.getInt("approval_rate"));
				result.setType1OpenCount(rset.getInt("type1_open_count"));
				result.setType2OpenCount(rset.getInt("type2_open_count"));
				result.setType3OpenCount(rset.getInt("type3_open_count"));
				
				list.add(result);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return list;
	}

	public ArrayList<SuccessFundingStatistics> selectSuccessFundingList(Connection con, String str) {
		ArrayList<SuccessFundingStatistics> list = new ArrayList<SuccessFundingStatistics>();
		SuccessFundingStatistics result = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = null;
		
		if(str.equals("month")){
			query = prop.getProperty("selectSuccessFundingMonth");
		}else{
			query = prop.getProperty("selectSuccessFundingYear");
		}
		
		try {
			pstmt = con.prepareStatement(query);
			
			
			
            rset = pstmt.executeQuery();
			
			while(rset.next()){
				result = new SuccessFundingStatistics();
				result.setTerm(rset.getString(""));
				result.setEndCount(rset.getInt(""));
				result.setSuccessCount(rset.getInt(""));
				result.setSuccessRate(rset.getInt(""));
				result.setType1SuccessCount(rset.getInt(""));
				result.setType1SuccessRate(rset.getInt(""));
				result.setType2SuccessCount(rset.getInt(""));
				result.setType2SuccessRate(rset.getInt(""));
				result.setType3SuccessCount(rset.getInt(""));
				result.setType3SuccessRate(rset.getInt(""));
				
				list.add(result);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return list;
	}

	public ArrayList<MemberStatistics> selectMemberList(Connection con, String str) {
		ArrayList<MemberStatistics> list = new ArrayList<MemberStatistics>();
		MemberStatistics result = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = null;
		
		if(str.equals("date")){
			query = prop.getProperty("selectMemberDate");
		}else if(str.equals("month")){
			query = prop.getProperty("selectMemberMonth");
		}else{
			query = prop.getProperty("selectMemberYear");
		}
		
		try {
			pstmt = con.prepareStatement(query);
			
            rset = pstmt.executeQuery();
			
			while(rset.next()){
				result = new MemberStatistics();
				
				result.setTerm(rset.getString("term"));
				result.setMemberCount(rset.getInt("member_count"));
				result.setEmailMemberCount(rset.getInt("email_member_count"));
				result.setKakaoMemberCount(rset.getInt("kakao_member_count"));
				result.setNaverMemberCount(rset.getInt("naver_member_count"));
				
				list.add(result);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return list;
	}

}

