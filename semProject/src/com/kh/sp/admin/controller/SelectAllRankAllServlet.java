package com.kh.sp.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.sp.admin.model.service.AdminService;
import com.kh.sp.admin.model.vo.DetailMember;
import com.kh.sp.admin.model.vo.PageInfo;
import com.kh.sp.member.model.vo.Member;

@WebServlet("/selectAllRank.adm")
public class SelectAllRankAllServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectAllRankAllServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int currentPage;
		int limit;
		int maxPage;
		int startPage;
		int endPage;

currentPage = 1;
		
		System.out.println("오니?");
		if(request.getParameter("currentPage") != null){
			currentPage
			= Integer.parseInt(request.getParameter("currentPage"));
			
		}
		
		System.out.println("여기까지됨 : " + currentPage);
		
		int listCount = new AdminService().getInvRankListCount();
		
		limit = 10;
		
		//총 페이지 수 계산
		maxPage = (int)((double)listCount / 10 + 0.9);
		
		startPage = (((int)((double)currentPage / 10 + 0.9)) -1) * 10 + 1;
		
		endPage = startPage + 10 -1;
		
		if(maxPage < endPage){
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		
		ArrayList<DetailMember> rankList = new AdminService().selectInvRankList(currentPage, limit);
		
		System.out.println("pi :" + pi);
		System.out.println("rankList : " + rankList);
		
		String page = "";
		
		if(rankList != null){
			System.out.println("투자자 등급 변경 신청하는 사람들~");
			page = "views/admin/invtRankUpdate.jsp";
			request.setAttribute("rankList", rankList);
			request.setAttribute("pi", pi);
		}else{
			page="views/common/errorPage.jsp";
			request.setAttribute("msg", "등급 변경 요청 회원 조회 실패");
		}
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
	}
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
