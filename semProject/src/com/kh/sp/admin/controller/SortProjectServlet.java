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
import com.kh.sp.admin.model.vo.CheckProject;
import com.kh.sp.admin.model.vo.PageInfo;
import com.kh.sp.member.model.vo.Member;

@WebServlet("/sortProject.adm")
public class SortProjectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SortProjectServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("프로젝트 정렬 오니?");
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
		
		int listCount = new AdminService().getProjectListCount();
		
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
		
		ArrayList<CheckProject> list = null;
		
		list = new AdminService().sortProject(currentPage, limit, sort);
		
		String page = "views/admin/sortProject.jsp";
		
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
