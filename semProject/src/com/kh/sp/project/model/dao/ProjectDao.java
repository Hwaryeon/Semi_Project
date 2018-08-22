package com.kh.sp.project.model.dao;


import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.sp.product.model.vo.Product2;
import com.kh.sp.project.model.vo.Application;
import com.kh.sp.project.model.vo.Attachment2;

import static com.kh.sp.common.JDBCTemplate.*;

public class ProjectDao {
	private Properties prop = new Properties();
	
	public ProjectDao() {
		String fileName = ProjectDao.class.getResource("/sql/project/project-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public int insertProject(Connection con, Application a) {
		System.out.println("1");
		int result = 0;
		PreparedStatement pstmt = null;
		System.out.println("2");
		String query = prop.getProperty("insertProject");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, a.getProjectPlan());
			pstmt.setString(2, a.getProjectIntro());
			pstmt.setString(3, a.getProjectPrepare());
			
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		System.out.println("RESULT는 " + result);
		return result;
	}
	public int insertThumbnailContent(Connection con, Application a) {
		System.out.println("왔어?");
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertThumb");
		
		System.out.println(a.getProjectPlan());
		System.out.println(a.getProjectIntro());
		System.out.println(a.getProjectPrepare());
		System.out.println(a.getIntro());
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, a.getProjectPlan());
			pstmt.setString(2, a.getProjectIntro());
			pstmt.setString(3, a.getProjectPrepare());
			pstmt.setString(4, a.getIntro());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	public int selectCurrval(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int pid = 0;
		
		String query = prop.getProperty("selectCurrval");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				pid = rset.getInt("currval");
			}
			System.out.println("pid :" + pid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
			
		}
		
				
		return pid;
	}
	public int insertAttachment(Connection con, ArrayList<Attachment2> fileList) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		
		String query = prop.getProperty("insertAttachment");
	try {	
		for(int i = 0; i< fileList.size(); i++) {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, fileList.get(i).getPid());
			pstmt.setString(2, fileList.get(i).getOriginName());
			pstmt.setString(3, fileList.get(i).getChangeName());
			pstmt.setString(4, fileList.get(i).getFilePath());
			
			int level = 0;
			if(i == 0) level = 0;
			else level = 1;
			
			pstmt.setInt(5, level);
			result = pstmt.executeUpdate();
			System.out.println("result : "+result);
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally {
		
		close(pstmt);
	}
		return result;
	}
	
	
}
