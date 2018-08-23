package com.kh.sp.funding.model.service;

import java.sql.Connection;
import java.util.ArrayList;
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

	public ArrayList<Product> newFundingList() {
		
		Connection con = getConnection();
		
		ArrayList<Product> pList = new FundingDao().newFundingList(con);
		
		ArrayList<Product> pList2 = new FundingDao().newFundingList2(con, pList);
		
		
		close(con);
		
		return pList2;
	}
	
	public ArrayList<Product> mainFundingList() {
		
		Connection con = getConnection();
		
		ArrayList<Product> pList = new FundingDao().mainFundingList(con);
		
		ArrayList<Product> pList2 = new FundingDao().newFundingList2(con, pList);
		
		
		close(con);
		
		return pList2;
	}
	
	public ArrayList<Product> hotFundingList() {
		
		Connection con = getConnection();
		
		ArrayList<Product> pList = new FundingDao().hotFundingList(con);
		
		ArrayList<Product> pList2 = new FundingDao().newFundingList2(con, pList);
		
		
		close(con);
		
		return pList2;
	}
	
	public ArrayList<Product> closeFundingList() {
		
		Connection con = getConnection();
		
		ArrayList<Product> pList = new FundingDao().closeFundingList(con);
		
		ArrayList<Product> pList2 = new FundingDao().newFundingList2(con, pList);
		
		
		close(con);
		
		return pList2;
	}
	

}
