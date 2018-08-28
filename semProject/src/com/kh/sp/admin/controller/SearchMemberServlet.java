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


@WebServlet(name = "SearchMemberServlet", urlPatterns = { "/searchMember.adm" })
public class SearchMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SearchMemberServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int currentPage;
		int limit;
		int maxPage;
		int startPage;
		int endPage;
		
		System.out.println("서치 오닝??");
		currentPage = 1;
		
		if(request.getParameter("currentPage") != null){
			currentPage
			= Integer.parseInt(request.getParameter("currentPage"));
			
		}
		
		System.out.println("여기까지됨 : " + currentPage);
		
		String text = request.getParameter("searchValue");
		
		System.out.println("text 는 = " + text);
		
		int searchList = new AdminService().searchMemberListCount(text);
		
		limit = 10;
		
		//총 페이지 수 계산
		maxPage = (int)((double)searchList / 10 + 0.9);
		
		startPage = (((int)((double)currentPage / 10 + 0.9)) -1) * 10 + 1;
		
		endPage = startPage + 10 -1;
		
		if(maxPage < endPage){
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, searchList, limit, maxPage, startPage, endPage);
		
		
		ArrayList<Member> list = null;
		
		

			list = new AdminService().searchAllMember(currentPage, limit, text);

	
		String page ="/views/admin/searchPage.jsp";
		
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
