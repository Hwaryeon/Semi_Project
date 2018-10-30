package com.kh.sp.myPage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.sp.myPage.model.service.MypageDetailService;
import com.kh.sp.myPage.model.vo.MypageDetail;
import com.kh.sp.myPage.model.vo.PageInfo;

@WebServlet("/show.pb")
public class SelectPaymentBackgroundServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public SelectPaymentBackgroundServlet() { super(); }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userId = Integer.parseInt(request.getParameter("userid"));
		String userClass = request.getParameter("userclass");

		//ページング
		int currentPage; //現在いるページ
		int limit; // 1ページに書き込みがいくつ見られるか
		int maxPage;  // 全体ページ
		int startPage;
		int endPage; 

		// 掲示板は1ページから始まる
		currentPage = 1;
		// 1ページではない時
		if (request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		// 全体リストの数とリスト全体へのリターン
		int listCount = new MypageDetailService().getListCountPayment(userId, userClass);
		System.out.println("listCount : " + listCount);

		// 一つのページに見せる数
		limit = 4;

		// 全体ページの数計算
		maxPage = (int) ((double) listCount / limit + 0.9);
		// 現在ページに見せる始めのページを計算
		startPage = (((int) ((double) currentPage / 5 + 0.9)) - 1) * 5 + 1;
		// 最後のページを計算
		endPage = startPage + 2 - 1;

		if (maxPage < endPage) {
			endPage = maxPage;
		}
		// ページの情報を公有する vo　Objectを作る
		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		ArrayList<MypageDetail> list = new MypageDetailService().selectListPayment(userId, currentPage, limit, userClass);
		String page = "";

		if (list != null) {
			page = "views/myPage/PaymentBackground.jsp";
			request.setAttribute("list", list);
			request.setAttribute("pi", pi); 
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "참여/개설 프로젝트 조회 실패");
		}

		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
