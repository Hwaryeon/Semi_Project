package com.kh.sp.funding.model.service;

import java.sql.Connection;
import java.util.HashMap;

import com.kh.sp.board.model.dao.BoardDao;
import com.kh.sp.funding.model.dao.FundingDao;
import com.kh.sp.funding.model.vo.Product;

import static com.kh.sp.common.JDBCTemplate.*;

public class FundingService {

	public HashMap<String, Object> callType() {

		
		Connection con = getConnection();
		
		HashMap<String, Object> hmap = new FundingDao().callType(con);
		
		close(con);
		
		return hmap;
	}

	public int insertFunding(Product p) {
		
		Connection con = getConnection();
		
		int result = new FundingDao().insertFunding(con, p);
		  
		if(result > 0){
			   
			int pid = new FundingDao().selectCurrval(con);
			
			
			result = new FundingDao().detailPoductInsert(con, pid);
			
			if(result > 0){
				commit(con);
			}else{
				rollback(con);
			}
			
		}else{
			rollback(con);
		}
		close(con);
		
		return result;
	}

}
