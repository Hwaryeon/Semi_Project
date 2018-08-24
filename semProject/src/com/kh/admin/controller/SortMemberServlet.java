package com.kh.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.model.service.AdminService;
import com.kh.admin.model.vo.PageInfo;
import com.kh.member.model.vo.Member;


@WebServlet("/sortMember.adm")
public class SortMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public SortMemberServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("소트 오닝?");
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
		
		System.out.println("여기까지됨 : " + currentPage);
		
		int listCount = new AdminService().getListCount();
		
		limit = 10;
		
		//총 페이지 수 계산
		maxPage = (int)((double)listCount / 10 + 0.9);
		
		startPage = (((int)((double)currentPage / 10 + 0.9)) -1) * 10 + 1;
		
		endPage = startPage + 10 -1;
		
		if(maxPage < endPage){
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		
		
		String sort = request.getParameter("sort");
		
		System.out.println(sort);
		
		ArrayList<Member> list = null;
		
		list = new AdminService().sortMember(currentPage, limit, sort);
		
		String page = "views/admin/sortPage.jsp";
		
		System.out.println("마지막 list는" + list);
		if(list != null || list.size() > 0){
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
		}else{
			request.setAttribute("msg", "검색 결과가 없습니다");
		}
		
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
	}
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
