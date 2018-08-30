package com.kh.sp.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.RequestDispatcher;

import com.kh.sp.admin.model.service.AdminService;
import com.kh.sp.admin.model.vo.PageInfo;
import com.kh.sp.member.model.vo.Member;


@WebServlet("/selectAllMember.adm")
public class SelectAllMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public SelectAllMemberServlet() {
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
		
		ArrayList<Member> list = new AdminService().selectList(currentPage, limit);
		
		System.out.println("pi :" + pi);
		System.out.println("list : " + list);
		
		String page = "";
		
		if(list != null){
			System.out.println("멤버리스트 가져왔어요");
			page = "views/admin/managerPage.jsp";
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
		}
		else{
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
