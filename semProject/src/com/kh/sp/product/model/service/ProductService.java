package com.kh.sp.product.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.sp.board.model.vo.Board;
import com.kh.sp.product.model.dao.ProductDao;
import com.kh.sp.product.model.vo.Invest;
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

	public int InsertPayment(Invest i) {
Connection con = getConnection();
			int result = 0;
			int result1 = new ProductDao().insertPayment(con, i);
		
		
		if(result1 > 0) {
			int investId = new ProductDao().selectId(con);
			int result2 = new ProductDao().insertPaymentRe(con,i,investId);
			if(result1 > 0 && result2 >0) {
				commit(con);
				result=1;
			}else {
				rollback(con);
			}
		}
		
		return result;
	}

	public int insertNews(Board b) {
		Connection con = getConnection();
		int result = 0;
		result = new ProductDao().insertNews(con,b);
	
	
	
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}

	
	return result;
}
}

	
	
	



