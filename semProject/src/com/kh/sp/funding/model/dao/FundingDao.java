package com.kh.sp.funding.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Properties;

import com.kh.sp.board.model.dao.BoardDao;
import com.kh.sp.board.model.vo.Attachment;
import com.kh.sp.funding.model.vo.Product;
import com.kh.sp.funding.model.vo.ProductType;

import static com.kh.sp.common.JDBCTemplate.*;

public class FundingDao {

	private Properties prop = new Properties();

	public FundingDao(){
		String fileName = FundingDao.class.getResource("/sql/funding/funding-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public HashMap<String, Object> callType(Connection con) {

		Statement stmt = null;
		ResultSet rset = null;

		HashMap<String, Object> hmap = null;
		ArrayList<ProductType> list = null;

		ProductType pt = null;


		String query = prop.getProperty("callType");

		try {
			stmt = con.createStatement();

			rset = stmt.executeQuery(query);

			list = new ArrayList<ProductType>();
			while(rset.next()){

				pt = new ProductType();
				pt.setpCode(rset.getInt("p_code"));
				pt.setpName(rset.getString("p_name"));
				pt.setP_fees(rset.getInt("p_fees"));

				list.add(pt);


			}

			hmap = new HashMap<String, Object>();

			hmap.put("productType", list);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(stmt);
			close(rset);
		}


		return hmap;
	}

	public int insertFunding(Connection con, Product p) {

		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("insertFunding");
		System.out.println("여기가 문제여");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, p.getP_code());
			pstmt.setInt(2, p.getUser_id());
			pstmt.setString(3, p.getP_name());
			pstmt.setString(4, p.getContent());
			pstmt.setInt(5, p.getOpenDate());
			pstmt.setInt(6, Integer.parseInt(p.getcAmount()));
			pstmt.setString(7, p.getFeeType());

			result = pstmt.executeUpdate();
			System.out.println("result="+result);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		return result;
	}

	public int selectCurrval(Connection con) {

		Statement stmt = null;
		ResultSet rset = null;
		int pid=0;

		String query = prop.getProperty("selectCurrval");

		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);

			if(rset.next()){
				pid = rset.getInt("currval");
			}
			System.out.println(pid+"??");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(stmt);
			close(rset);
		}

		return pid;
	}

	public int detailPoductInsert(Connection con, int pid) {

		PreparedStatement pstmt = null;

		int result = 0;

		String query = prop.getProperty("detailPoductInsert");
		System.out.println(pid+"!");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, pid);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
		}

		return result;
	}

	public ArrayList<Product> newFundingList(Connection con) {

		ArrayList<Product> pList = new ArrayList<Product>();
		ResultSet rset = null;
		Product p = null;
		PreparedStatement pstmt = null;

		String query = prop.getProperty("newFundingList");

		try {
			
			
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, "펀딩모집");
			
			rset = pstmt.executeQuery();

			while(rset.next()){
				p = new Product();

				p.setP_id(rset.getInt("p_id"));
				p.setP_code(rset.getInt("p_code")+"");
				p.setUser_id(rset.getInt("user_id"));
				p.setP_name(rset.getString("p_name"));
				p.setOpenDate(Math.round(rset.getInt("(r.END_DATE-sysdate)")));
				p.setcAmount(rset.getInt("CLOSING_AMOUNT")+"");
				p.setP_intro(rset.getString("intro"));
				p.setOpenDate(rset.getInt("(r.END_DATE-sysdate)"));
				p.setCorporate_name(rset.getString("CORPORATE_NAME"));
				p.setOrigin_name(rset.getString("ORIGIN_NAME"));
				p.setChange_name(rset.getString("CHANGE_NAME"));
				p.setFile_path(rset.getString("FILE_PATH"));

				pList.add(p);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}


		return pList;
	}

	public ArrayList<Product> inverstFundingList(Connection con, ArrayList<Product> pList) {

		ResultSet rset = null;
		Product p = null;
		PreparedStatement pstmt = null;

		String query = prop.getProperty("inverstFundingList");

		try {
			pstmt =con.prepareStatement(query);
			pstmt.setString(1, "펀딩모집");

			rset = pstmt.executeQuery();

			while(rset.next()){

				for(int i=0; i < pList.size(); i++){
					if(rset.getInt("p_id") == pList.get(i).getP_id()){
						pList.get(i).setTotal_amount(rset.getInt("sum(ir.price)"));
					}
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}

		return pList;
	}

	public ArrayList<Product> inverstHotFundingList(Connection con) {

		ArrayList<Product> pList = new ArrayList<Product>();
		ResultSet rset = null;
		Product p = null;
		PreparedStatement pstmt = null;

		String query = prop.getProperty("hotFundingList");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, "펀딩모집");
			rset = pstmt.executeQuery();

			while(rset.next()){
				p = new Product();

				p.setP_id(rset.getInt("p_id"));
				p.setP_code(rset.getInt("p_code")+"");
				p.setUser_id(rset.getInt("user_id"));
				p.setP_name(rset.getString("p_name"));
				p.setOpenDate(Math.round(rset.getInt("(r.END_DATE-sysdate)")));
				p.setcAmount(rset.getInt("CLOSING_AMOUNT")+"");
				p.setP_intro(rset.getString("intro"));
				p.setOpenDate(rset.getInt("(r.END_DATE-sysdate)"));
				p.setCorporate_name(rset.getString("CORPORATE_NAME"));
				p.setOrigin_name(rset.getString("ORIGIN_NAME"));
				p.setChange_name(rset.getString("CHANGE_NAME"));
				p.setFile_path(rset.getString("FILE_PATH"));

				pList.add(p);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}


		return pList;
	}

	public ArrayList<Product> mainFundingList(Connection con) {
		ArrayList<Product> pList = new ArrayList<Product>();
		ResultSet rset = null;
		Product p = null;
		PreparedStatement pstmt = null;

		String query = prop.getProperty("mainFundingList");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, "펀딩모집");
			rset = pstmt.executeQuery();

			while(rset.next()){
				p = new Product();

				p.setP_id(rset.getInt("p_id"));
				p.setP_code(rset.getInt("p_code")+"");
				p.setUser_id(rset.getInt("user_id"));
				p.setP_name(rset.getString("p_name"));
				p.setOpenDate(Math.round(rset.getInt("(r.END_DATE-sysdate)")));
				p.setcAmount(rset.getInt("CLOSING_AMOUNT")+"");
				p.setP_intro(rset.getString("intro"));
				p.setOpenDate(rset.getInt("(r.END_DATE-sysdate)"));
				p.setCorporate_name(rset.getString("CORPORATE_NAME"));
				p.setOrigin_name(rset.getString("ORIGIN_NAME"));
				p.setChange_name(rset.getString("CHANGE_NAME"));
				p.setFile_path(rset.getString("FILE_PATH"));

				pList.add(p);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}


		return pList;
	}

	public ArrayList<Product> hotFundingList(Connection con,ArrayList<Product> pList) {
		ResultSet rset = null;
		Product p = null;
		Statement stmt = null;
		ArrayList<Product> hotList = new ArrayList<Product>();

		String query = prop.getProperty("inverstHotFundingList");

		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);

			while(rset.next()){

				for(int i=0; i < pList.size(); i++){
					if(rset.getInt("p_id") == pList.get(i).getP_id()){
						pList.get(i).setTotal_amount(rset.getInt("sum(ir.price)"));
					}
				}
			}


			for(int i=0; i < pList.size(); i++){
				if(pList.get(i).getTotal_amount() <= 0){
					pList.remove(i);
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(rset);
			close(stmt);
		}

		if(pList.size() > 0){
			pList.remove(pList.size()-1);
		}
		
		return pList;
	}

	public ArrayList<Product> closeFundingList(Connection con) {
		ArrayList<Product> pList = new ArrayList<Product>();
		ResultSet rset = null;
		Product p = null;
		PreparedStatement pstmt = null;

		String query = prop.getProperty("closeFundingList");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, "펀딩모집");
			rset = pstmt.executeQuery();

			while(rset.next()){
				p = new Product();

				p.setP_id(rset.getInt("p_id"));
				p.setP_code(rset.getInt("p_code")+"");
				p.setUser_id(rset.getInt("user_id"));
				p.setP_name(rset.getString("p_name"));
				p.setOpenDate(Math.round(rset.getInt("(r.END_DATE-sysdate)")));
				p.setcAmount(rset.getInt("CLOSING_AMOUNT")+"");
				p.setP_intro(rset.getString("intro"));
				p.setOpenDate(rset.getInt("(r.END_DATE-sysdate)"));
				p.setCorporate_name(rset.getString("CORPORATE_NAME"));
				p.setOrigin_name(rset.getString("ORIGIN_NAME"));
				p.setChange_name(rset.getString("CHANGE_NAME"));
				p.setFile_path(rset.getString("FILE_PATH"));

				pList.add(p);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}


		return pList;
	}









}
