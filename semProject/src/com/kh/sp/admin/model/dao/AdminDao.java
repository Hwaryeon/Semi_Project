package com.kh.sp.admin.model.dao;

import static com.kh.sp.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
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
				m.setAddress(rset.getString("address"));
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

}

