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

/**
 * Servlet implementation class SelectPaymentBackgroundServlet
 */
@WebServlet("/show.pb")
public class SelectPaymentBackgroundServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public SelectPaymentBackgroundServlet() { super(); }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userId = Integer.parseInt(request.getParameter("userid"));
		String userClass = request.getParameter("userclass");
		//System.out.println(userClass);

		// 페이징 처리
		int currentPage; // 현재 페이지를 표시할 변수
		int limit; // 한 페이지에 게시글이 몇 개가 보여질 것인지
		int maxPage; // 전체 페이지에서 가장 마지막 페이지
		int startPage; // 한번에 표시될 페이지가 시작할 페이지
		int endPage; // 한번에 표시될 페이지가 끝나는 페이지

		// 게시판은 1페이지부터 시작함
		currentPage = 1;
		// 1페이지가 아닐때
		if (request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		System.out.println("Servlet CurrentPage : " + currentPage);

		// 전체 목록 갯수와 목록 전체를 리턴받음
		int listCount = new MypageDetailService().getListCountPayment(userId, userClass);
		System.out.println("listCount : " + listCount);

		// 한페이지에 보여줄 갯수
		limit = 4;

		// 총 페이지 수 계산
		maxPage = (int) ((double) listCount / limit + 0.9);
		System.out.println("maxPage : " + maxPage);
		// 현재 페이지에 보여줄 시작 페이지 수
		startPage = (((int) ((double) currentPage / 5 + 0.9)) - 1) * 5 + 1;
		System.out.println("startPage : " + startPage);
		// 목록 아래 보여질 마지막 페이지 수
		endPage = startPage + 2 - 1;

		if (maxPage < endPage) {
			endPage = maxPage;
		}
		System.out.println("endPage : " + endPage);
		System.out.println("userId : " + userId);

		// 페이지 정보를 공유할 vo객체 생성
		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		//System.out.println("셀렉트 리스트 실행 전 currentPage : " + currentPage);
		ArrayList<MypageDetail> list = new MypageDetailService().selectListPayment(userId, currentPage, limit, userClass);
		//System.out.println("셀렉트 리스트 실행 후 currentPage : " + currentPage);
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

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
