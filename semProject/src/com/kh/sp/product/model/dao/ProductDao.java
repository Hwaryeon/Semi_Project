package com.kh.sp.product.model.dao;


import static com.kh.sp.common.JDBCTemplate.close;
import static com.kh.sp.common.JDBCTemplate.close;
import static com.kh.sp.common.JDBCTemplate.getConnection;

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
import java.util.HashMap;
import java.util.Properties;

import com.kh.sp.product.model.dao.ProductDao;
import com.kh.sp.product.model.vo.Invest;
import com.kh.sp.board.model.vo.Attachment;
import com.kh.sp.board.model.vo.Board;
import com.kh.sp.funding.model.vo.Product;


public class ProductDao {
	private Properties prop = new Properties();
	
	public ProductDao() {
		String fileName = ProductDao.class.getResource("/sql/project/project-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	public ArrayList<HashMap<String, Object>> selectProductList(Connection con) {
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hmap = null;
		
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectProduct");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<HashMap<String, Object>>();
			
			while(rset.next()) {
				hmap = new HashMap<String, Object>();
				
				
				hmap.put("pId",rset.getInt("P_ID"));
				hmap.put("pCode",rset.getString("P_CODE"));
				hmap.put("pName",rset.getString("P_NAME"));
				hmap.put("content",rset.getString("CONTENT"));
				hmap.put("openDate", rset.getInt("OPEN_DATE"));
				hmap.put("closingAmount",rset.getInt("CLOSING_AMOUNT"));
				hmap.put("interestRate", rset.getString("INTEREST_RATE"));
				hmap.put("preparation",rset.getString("P_PREPARATION"));
				hmap.put("introduction",rset.getString("P_INTRODUCTION"));
				hmap.put("plan", rset.getString("P_PLAN"));
				hmap.put("intro", rset.getString("INTRO"));
				hmap.put("fid", rset.getInt("FID"));
				hmap.put("bid", rset.getInt("BID"));
				hmap.put("orginName", rset.getString("ORIGIN_NAME"));
				hmap.put("changeName",rset.getString("CHANGE_NAME"));
				hmap.put("filePath",rset.getString("FILE_PATH"));
				hmap.put("uploadDate",rset.getDate("UPLOAD_DATE"));
				hmap.put("file_level",rset.getInt("FILE_LEVEL"));
				hmap.put("pType",rset.getInt("P_TYPE"));
				hmap.put("pNum", rset.getInt("P_NUM"));
				hmap.put("status",rset.getString("STATUS"));
				hmap.put("userId",rset.getInt("USER_ID"));
				
				
				list.add(hmap);		
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
		}
		
		return list;
	}
	
	public HashMap<String, Object> selectOne(Connection con, int num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String, Object> hmap = null;
		
		Product p = null;
		Attachment a = null;
		System.out.println("최종적으로 보내기전 num은??"+num);
		String query = prop.getProperty("selectOneProduct");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			
			rset = pstmt.executeQuery();
			
			hmap = new HashMap<String,Object>();
			while(rset.next()) {
				hmap.put("pId",rset.getInt("p_id"));
				hmap.put("pCode",rset.getString("p_code"));
				hmap.put("pName",rset.getString("p_name"));
				hmap.put("content",rset.getString("content"));
				hmap.put("openDate",rset.getInt("open_date"));
				hmap.put("closingAmount",rset.getInt("closing_amount"));
				hmap.put("interestRate",rset.getString("interest_rate"));
				hmap.put("pPreparation",rset.getString("p_preparation"));
				hmap.put("pIntroduction",rset.getString("p_introduction"));
				hmap.put("pPlan",rset.getString("p_plan"));
				hmap.put("intro",rset.getString("intro"));
				hmap.put("amount",rset.getInt("amount"));
				hmap.put("fid",rset.getInt("fid"));
				hmap.put("bid",rset.getInt("bid"));
				hmap.put("originName",rset.getString("origin_name"));
				hmap.put("changeName",rset.getString("change_name"));
				hmap.put("uploadDate",rset.getDate("upload_date"));
				hmap.put("fileLevel",rset.getInt("file_level"));
				hmap.put("status",rset.getString("status"));
				hmap.put("filePath",rset.getString("file_path"));
				hmap.put("userId",rset.getInt("user_id"));
				hmap.put("pType",rset.getInt("p_type"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		return hmap;
	}
	public int insertPayment(Connection con, Invest i) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = prop.getProperty("insertPayment");
		System.out.println(i.getInvestId());
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, i.getUserId());
			pstmt.setInt(2, i.getpId());
			
			result = pstmt.executeUpdate();
			System.out.println("result = "+result);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	public int selectId(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int investId = 0;
		
		String query = prop.getProperty("selectId");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				investId = rset.getInt("MAX(INVEST_ID)");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
			
		}
				
		return investId;
	}
	public int insertPaymentRe(Connection con, Invest i, int investId) {
		
		int result2 = 0;
		PreparedStatement pstmt = null;
		
		String query = prop.getProperty("insertPaymentRe");
		System.out.println(i.getInvestId());
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, investId);
			pstmt.setString(2, i.getStatus());
			pstmt.setString(3, i.getPrice()+"");
			pstmt.setString(4, i.getStatus());
			
			result2 = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result2;
	}
	public int insertNews(Connection con, Board b) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = prop.getProperty("insertNews");
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1,b.getTitle());
			pstmt.setString(2,b.getaText());
			
			result=pstmt.executeUpdate();
			
			System.out.println(result);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	}