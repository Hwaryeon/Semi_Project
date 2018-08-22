package com.kh.sp.common;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class JDBCTemplate {

	public static Connection getConnection(){
		Connection con = null;
		Properties prop = new Properties();

		String fileName = JDBCTemplate.class.getResource("/sql/driver.properties").getPath();

		//System.out.println(fileName);

		try {
			prop.load(new FileReader(fileName));

			String driver = prop.getProperty("driver");
			String url = prop.getProperty("url");
			String user = prop.getProperty("user");
			String password = prop.getProperty("password");

			Class.forName(driver);

			con = DriverManager.getConnection(url, user, password);

			con.setAutoCommit(false);


		} catch (IOException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
	}

	public static void close(Connection con){
		try {
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public static void close(Statement stmt){
		try {
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public static void close(ResultSet rset){
		try {
			rset.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public static void close(PreparedStatement pstmt){
		try {
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void commit(Connection con){
		try {
			con.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void rollback(Connection con){
		try {
			con.rollback();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
