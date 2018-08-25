package com.kh.sp.product.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.sp.product.model.dao.ProductDao;
import com.kh.sp.product.model.vo.Product2;
import com.kh.sp.project.model.dao.ProjectDao;
import com.sun.xml.internal.ws.api.message.Attachment;

import static com.kh.sp.common.JDBCTemplate.*;

public class ProductService {

	public ArrayList<HashMap<String, Object>> selectProductList() {
		Connection con = getConnection();
		ArrayList<HashMap<String, Object>> list = new ProductDao().selectProductList(con);
		
		close(con);
		
		return list;
	}

	public HashMap<String, Object> selectOne(int num) {
		Connection con = getConnection();
		
		
		HashMap<String,Object> hmap = new ProductDao().selectOne(con,num);
		
		close(con);
		
		return hmap; 
	}

	
	
	
	
	
	}


