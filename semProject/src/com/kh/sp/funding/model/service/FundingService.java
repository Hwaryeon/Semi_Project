package com.kh.sp.funding.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.Arrays;
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
		System.out.println("여기까지는 온다..");
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

		ArrayList<Product> pList2 = null;

		if(pList.size() > 0){
			pList2 = new FundingDao().inverstFundingList(con, pList);
		}

		close(con);

		return pList2;
	}

	public ArrayList<Product> mainFundingList() {

		Connection con = getConnection();

		ArrayList<Product> pList = new FundingDao().mainFundingList(con);

		ArrayList<Product> pList2 = null;

		ArrayList<Product> pList3 = null;

		if(pList.size() > 0){

			pList2 = new FundingDao().inverstFundingList(con, pList);

			pList3 = new ArrayList<Product>();

			for(int i=0; i < pList2.size(); i++){
				if(pList2.get(i).getTotal_amount() <= 0){
					pList2.remove(i);
				}
			}

			int[] iArr = new int[pList2.size()];

			for(int i=0; i<pList2.size(); i++){
				iArr[i] = pList2.get(i).getTotal_amount();
			}

			Arrays.sort(iArr);
			reverseArrayInt(iArr);

			for(int i=0; i<pList2.size(); i++){
				if(iArr[0] == pList2.get(i).getTotal_amount()){
					pList3.add(pList2.get(i));
				}
			}
			for(int i=0; i<pList2.size(); i++){
				if(iArr[1] == pList2.get(i).getTotal_amount()){

					pList3.add(pList2.get(i));
				}
			}
			/*디비 합치면서 풀어주자 이따 커밋할떄도~~~~~~~~~~!~!#@#@#^^%^*&^!#(*^&@!*&(~^^$#!#~!&*$^
			##$&&^(*@!#@%^&(@#%&(&*&)*^%$#$@$%$^&(**^%^ㅁ#@%$^%&(*^%$#@%^&*(*&^ㅁ#$@%^&*())))))
			$%^&*(%$#$@$%*&(*^%$#@$$%$^%%&*%&$#%$%^*%$#%$%^*^%$#@%$^%^&^%$#%$^&^%$#%$&^**^^&$#))
			%$%#^%%$#%#%^&%(*%^%$^#^%^&^%$^#%^&*^%$^#^%^*%$^#%^&%^*^%$^#^&%^*^%&$#^&*&^%%$^#^%&)*/
			/*for(int i=0; i<pList2.size(); i++){
				if(iArr[2] == pList2.get(i).getTotal_amount()){

					pList3.add(pList2.get(i));
				}
			}*/
		}
		close(con);
		return pList3;
	}

	public ArrayList<Product> hotFundingList() {

		Connection con = getConnection();

		ArrayList<Product> pList = new FundingDao().inverstHotFundingList(con);

		ArrayList<Product> pList2 = null;
		
		if(pList.size() > 0){		
			pList2 = new FundingDao().hotFundingList(con, pList);
		}
		close(con);

		return pList2;
	}

	public ArrayList<Product> closeFundingList() {

		Connection con = getConnection();

		ArrayList<Product> pList = new FundingDao().closeFundingList(con);

		ArrayList<Product> pList2=null;
		
		if(pList.size() > 0){
			pList2 = new FundingDao().inverstFundingList(con, pList);
		}

		close(con);

		return pList2;
	}

	public static void reverseArrayInt(int[] array) {
		int temp;

		for (int i = 0; i < array.length / 2; i++) {
			temp = array[i];
			array[i] = array[(array.length - 1) - i];
			array[(array.length - 1) - i] = temp;
		}
	}

}
