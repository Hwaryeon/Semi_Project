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
				
				
				hmap.put("applicationDate", rset.getDate("application_date"));
				hmap.put("processingDate",rset.getDate("processing_date"));
				hmap.put("projectPlan",rset.getString("project_plan"));
				hmap.put("projectIntroduction",rset.getString("project_introduction"));
				hmap.put("projectPreparation",rset.getString("project_preparation"));
				hmap.put("intro",rset.getString("intro"));
				hmap.put("originName", rset.getString("origin_name"));
				hmap.put("uploadDate",rset.getDate("upload_date"));
				hmap.put("fileLevel", rset.getInt("file_level"));
				hmap.put("filePath",rset.getString("filepath"));
				hmap.put("bid",rset.getInt("bid"));
				hmap.put("changeName", rset.getString("change_name"));
				hmap.put("pid", rset.getInt("pid"));
				
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
