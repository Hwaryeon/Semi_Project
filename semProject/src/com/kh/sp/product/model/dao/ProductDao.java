package com.kh.sp.product.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

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
				
				
				hmap.put("pId",rset.getString("P_ID"));
				hmap.put("pCode",rset.getString("P_CODE"));
				hmap.put("pName",rset.getString("P_NAME"));
				hmap.put("content",rset.getString("CONTENT"));
				hmap.put("openDate", rset.getString("OPEN_DATE"));
				hmap.put("closingAmount",rset.getDate("CLOSING_AMOUNT"));
				hmap.put("interestRate", rset.getInt("INTEREST_RATE"));
				hmap.put("preparation",rset.getString("P_PREPARATION"));
				hmap.put("introduction",rset.getInt("P_INTRODUCTION"));
				hmap.put("plan", rset.getString("P_PLAN"));
				hmap.put("intro", rset.getInt("INTRO"));
				hmap.put("fid", rset.getInt("FID"));
				hmap.put("bid", rset.getInt("BID"));
				hmap.put("orginName", rset.getString("ORIGIN_NAME"));
				hmap.put("changeName",rset.getString("CHANGE_NAME"));
				hmap.put("filePath",rset.getString("FILE_PATH"));
				hmap.put("uploadDate",rset.getDate("UPLOAD_DATE"));
				hmap.put("file_level",rset.getInt("FILE_LEVEL"));
				hmap.put("pType",rset.getInt("P_TYPE"));
				hmap.put("pNum",rset.getInt("P_NUM"));
				hmap.put("status",rset.getString("STATUS"));
				hmap.put("userId",rset.getInt("USER_ID"));
				
				
				list.add(hmap);
				System.out.println(hmap.get("bid"));		
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(list.size());
		System.out.println("list에 값을 넣을 수 있나");
		return list;
	}

}
