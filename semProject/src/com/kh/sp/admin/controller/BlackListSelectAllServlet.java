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
import com.kh.sp.admin.model.vo.PageInfo;
import com.kh.sp.member.model.vo.Member;

@WebServlet("/blackSelectAll.adm")
public class BlackListSelectAllServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BlackListSelectAllServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("블랙리스트 서치 오니?");
		
		int currentPage;
		int limit;
		int maxPage;
		int startPage;
		int endPage;
		
		currentPage = 1;
		
		if(request.getParameter("currentPage") != null){
			currentPage
			= Integer.parseInt(request.getParameter("currentPage"));
			
		}
		System.out.println("crrentPage" + currentPage);
		
		//listCount를 지금 전체조회로 했잖아 그래서 정확히 안나오나본데 이것도 pstmt ? 해서 
		//찾아야 하는 리스트에 맞춰서 출력해주자
		int listCount  = new AdminService().getBlackListCount();
		
		limit = 10;
		
		maxPage = (int)((double)listCount / 10 + 0.9);
		
		startPage = (((int)((double)currentPage / 10 + 0.9)) - 1) * 10 + 1;
		
		endPage = startPage + 10 -1;
		
		if(maxPage < endPage){
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		
		ArrayList<Member> blackList = new AdminService().selectBlackList(currentPage, limit);
		System.out.println(blackList);

		String page = "";
		if(blackList != null){
			System.out.println("블랙리스트 멤버 여깃슴둥");
			page = "views/admin/blackMember.jsp";
			request.setAttribute("blackList", blackList);
			request.setAttribute("pi", pi);
		}else{
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "회원 조회 실패");
			
		}
		
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
		
		
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
