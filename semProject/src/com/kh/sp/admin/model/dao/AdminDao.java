package com.kh.sp.admin.model.dao;

import static com.kh.sp.common.JDBCTemplate.*;

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
	public int getBlackListCount(Connection con) {
		Statement stmt = null;
		int blackListCount = 0;
		ResultSet rset = null;

		String query = prop.getProperty("blackListCount");

		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);

			if(rset.next()) {
				blackListCount = rset.getInt(1);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(stmt);
			close(rset);

		}


		return blackListCount;
	}


	//회원 전체 조회 메소드
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

	public ArrayList<Member> selectBlackList(Connection con, int currentPage, int limit) {
		ArrayList<Member> blackList = null;

		System.out.println("이게 안나오면 이상하지");
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		System.out.println("여기 오나 ?");
		String query = prop.getProperty("blackSelectAll");

		try {
			pstmt = con.prepareStatement(query);

			int startRow = (currentPage -1) * limit + 1;
			int endRow = startRow + limit -1;

			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rset = pstmt.executeQuery();

			blackList = new ArrayList<Member>();

			while(rset.next()){
				Member m = new Member();

				m.setUserId(rset.getInt("user_Id"));
				m.setUserClass(rset.getString("user_Class"));
				m.setUserName(rset.getString("user_Name"));
				m.setCorporateName(rset.getString("corporate_Name"));
				m.setB_reason(rset.getString("reason"));
				m.setB_enrollDate(rset.getDate("enroll_Date"));

				blackList.add(m);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
			close(rset);
		}

		System.out.println(blackList);
		return blackList;
	}

	public int searchMemberListCount (Connection con, String text) {
		PreparedStatement pstmt = null;
		int searchList = 0;
		ResultSet rset = null;

		String query = prop.getProperty("searchMemberListCount");

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setString(1, text);
			pstmt.setString(2, text);
			pstmt.setString(3, text);
			pstmt.setString(4, text);
			pstmt.setString(5, text);
			pstmt.setString(6, text);

			rset = pstmt.executeQuery();

			if(rset.next()) {
				searchList = rset.getInt(1);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
			close(rset);

		}


		return searchList;
	}


	public int insertBlackList(Connection con, String blackText, int userId) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateBlackList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userId);
			pstmt.setString(2, blackText);
			
			result = pstmt.executeUpdate();
		
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Member> searchBlackMember(Connection con, int currentPage, int limit, String text) {
		ArrayList<Member> blackList = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = prop.getProperty("blackMemberSearch");

		try {
			pstmt = con.prepareStatement(query);

			int startRow = (currentPage -1) * limit + 1;
			int endRow = startRow + limit - 1;

			pstmt.setString(1, text);
			pstmt.setString(2, text);
			pstmt.setString(3, text);
			pstmt.setString(4, text);
			pstmt.setString(5, text);
			pstmt.setString(6, text);
			pstmt.setInt(7, startRow);
			pstmt.setInt(8, endRow);

			blackList = new ArrayList<Member>();
			rset = pstmt.executeQuery();
			while(rset.next()){
				Member m = new Member();

				m.setUserId(rset.getInt("user_Id"));
				m.setUserClass(rset.getString("user_Class"));
				m.setUserName(rset.getString("user_Name"));
				m.setCorporateName(rset.getString("corporate_Name"));
				m.setB_reason(rset.getString("reason"));
				m.setB_enrollDate(rset.getDate("enroll_Date"));

				blackList.add(m);

			}


		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}


		return blackList;
	}

	public int blackListCount(Connection con, String text) {
		PreparedStatement pstmt = null;
		int listCount = 0;
		ResultSet rset = null;

		String query = prop.getProperty("blacklistSearchCount");

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setString(1, text);
			pstmt.setString(2, text);
			pstmt.setString(3, text);
			pstmt.setString(4, text);
			pstmt.setString(5, text);
			pstmt.setString(6, text);
			

			rset = pstmt.executeQuery();

			//이 부분이 맞나 싶다
			

			if(rset.next()) {
				listCount = rset.getInt(1);

			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);

		}

		return listCount;
	}


	public int updateBlackList(Connection con, String blackText) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateBlackList");
		
		
		return 0;
	}



	
	
	
	
	////////////////////////////////여기서부터 별림이꺼/////////////////////////////////////
	
	//매출 통계
	public ArrayList<SalesStatistics> selectSalesList(Connection con, String type, String term, int currentPage,
			int limit) {
		ArrayList<SalesStatistics> list = new ArrayList<SalesStatistics>();
		SalesStatistics result = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = null;
		
		int startRow = (currentPage -1 ) * limit + 1;
		int endRow = startRow + limit - 1;
		
		if(term.equals("month")){
			if(type.equals("all")){
				query = prop.getProperty("selectAllSalesMonth");
			}else{
				query = prop.getProperty("selectSalesTypeMonth");
			}
			
		}else{
			if(type.equals("all")){
				query = prop.getProperty("selectAllSalesYear");
			}else{
				query = prop.getProperty("selectSalesTypeYear");
			}
			
		}
		
		try {
			pstmt = con.prepareStatement(query);
			
			 if(!type.equals("all")){
				 
	            	if(type.equals("t1")){
	            		pstmt.setString(1, "1");
	            	}else if(type.equals("t2")){
	            		pstmt.setString(1, "2");
	            	}else{
	            		pstmt.setString(1, "3");
	            	}
	            	pstmt.setInt(2, startRow);
	    			pstmt.setInt(3, endRow);
	    			
	            }else{
	            	pstmt.setInt(1, startRow);
	    			pstmt.setInt(2, endRow);
	            }
			
			
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				result = new SalesStatistics();
				
				result.setTerm(rset.getString("term"));
				result.setPaymentCount(rset.getInt("payment_count"));
				result.setPaymentPrice(rset.getString("payment_price"));
				result.setRefundCount(rset.getInt("refund_count"));
				result.setPaymentPercentage(rset.getInt("payment_percentage"));
				result.setPaymentCompletePrice(rset.getString("payment_complete_price"));
				result.setNetSales(rset.getString("net_sales"));
				
				
				list.add(result);
				System.out.println(result);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return list;
	}
	
    //개설 펀딩 통계
	public ArrayList<OpenFundingStatistics> selectOpenFundingList(Connection con, String str, int currentPage, int limit) {
		ArrayList<OpenFundingStatistics> list = new ArrayList<OpenFundingStatistics>();
		OpenFundingStatistics result = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = null;

		int startRow = (currentPage -1 ) * limit + 1;
		int endRow = startRow + limit - 1;
		
		if(str.equals("month")){
			query = prop.getProperty("selectOpenFundingMonth");
		}else{
			query = prop.getProperty("selectOpenFundingYear");
		}
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
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
		System.out.println(list);
		return list;
	}

	//성공 펀딩 통계
	public ArrayList<SuccessFundingStatistics> selectSuccessFundingList(Connection con, String str, int currentPage, int limit) {
		ArrayList<SuccessFundingStatistics> list = new ArrayList<SuccessFundingStatistics>();
		SuccessFundingStatistics result = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = null;
		
		int startRow = (currentPage -1 ) * limit + 1;
		int endRow = startRow + limit - 1;
		
		if(str.equals("month")){
			query = prop.getProperty("selectSuccessFundingMonth");
		}else{
			query = prop.getProperty("selectSuccessFundingYear");
		}
		
		try {
			pstmt = con.prepareStatement(query);

			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
            rset = pstmt.executeQuery();
			
			while(rset.next()){
				result = new SuccessFundingStatistics();
				result.setTerm(rset.getString("term"));
				result.setEndCount(rset.getInt("end_count"));
				result.setSuccessCount(rset.getInt("success_count"));
				result.setSuccessRate(rset.getInt("success_rate"));
				result.setType1SuccessRate(rset.getInt("type1_success_rate"));
				result.setType2SuccessRate(rset.getInt("type2_success_rate"));
				result.setType3SuccessRate(rset.getInt("type3_success_rate"));
				
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

	//가입자 통계
	public ArrayList<MemberStatistics> selectMemberList(Connection con, String str, int currentPage, int limit) {
		ArrayList<MemberStatistics> list = new ArrayList<MemberStatistics>();
		MemberStatistics result = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = null;
		int startRow = (currentPage -1 ) * limit + 1;
		int endRow = startRow + limit - 1;
		
		if(str.equals("date")){
			query = prop.getProperty("selectMemberDate");
		}else if(str.equals("month")){
			query = prop.getProperty("selectMemberMonth");
		}else{
			query = prop.getProperty("selectMemberYear");
		}
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
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

	//매출 리스트 카운트(페이징)
	public int getSalesListCount(Connection con, String term, String type) {
		PreparedStatement pstmt = null;
		int listCount = 0;
		ResultSet rset = null;
		String query = null;

		if(term == null){
			if(type == null){
				query = prop.getProperty("listSalesMonthCount");
			}else{
				query = prop.getProperty("listSalesTypeMonthCount");
			}
		}else{
			if(type == null){
				query = prop.getProperty("listSalesYearCount");
			}else{
				query = prop.getProperty("listSalesTypeYearCount");
			}
			
		}

		try {
			pstmt = con.prepareStatement(query);
            if(type != null){
            	if(type.equals("t1")){
            		pstmt.setString(1, "1");
            	}else if(type.equals("t2")){
            		pstmt.setString(1, "2");
            	}else{
            		pstmt.setString(1, "3");
            	}
            }
			rset = pstmt.executeQuery();

			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
			close(rset);

		}

		return listCount;
	}
	
	//개설 펀딩 리스트 카운트(페이징)
	public int getOpenFundingListCount(Connection con, String term) {
		PreparedStatement pstmt = null;
		int listCount = 0;
		ResultSet rset = null;
		String query = null;

		if(term == null){
			query = prop.getProperty("listOpenFundingMonthCount");
		}else{
			query = prop.getProperty("listOpenFundingYearCount");
		}
		
		try {
			pstmt = con.prepareStatement(query);
			
			rset = pstmt.executeQuery();

			if(rset.next()) {
				listCount = rset.getInt(1);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
			close(rset);

		}


		return listCount;
	}
    
	//성공 펀딩 리스트 카운트(페이징)
	public int getSuccessFundingListCount(Connection con, String term) {
		PreparedStatement pstmt = null;
		int listCount = 0;
		ResultSet rset = null;
        String query = null;
        
		if(term == null){
			query = prop.getProperty("listSuccessFundingMonthCount");
		}else{
			query = prop.getProperty("listSuccessFundingYearCount");
		}
		
		try {
			pstmt = con.prepareStatement(query);
			
			rset = pstmt.executeQuery();

			if(rset.next()) {
				listCount = rset.getInt(1);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
			close(rset);

		}


		return listCount;
	}

	//가입자 리스트 카운트(페이징)
	public int getMemberListCount(Connection con, String term) {
		PreparedStatement pstmt = null;
		int listCount = 0;
		ResultSet rset = null;
        String query = null;
        
		if(term == null){
			query = prop.getProperty("listMemberDateCount");
		}else if(term.equals("month")){
			query = prop.getProperty("listMemberMonthCount");
		}else{
			query = prop.getProperty("listMemberYearCount");
		}
		
		try {
			pstmt = con.prepareStatement(query);
			
			rset = pstmt.executeQuery();

			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
			close(rset);

		}

		return listCount;
	}

}

