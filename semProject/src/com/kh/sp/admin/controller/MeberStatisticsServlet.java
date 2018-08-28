package com.kh.sp.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.kh.sp.admin.model.service.AdminService;
import com.kh.sp.admin.model.vo.MemberStatistics;
import com.kh.sp.admin.model.vo.PageInfo;

@WebServlet("/memberSt.adm")
public class MeberStatisticsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
    public MeberStatisticsServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<MemberStatistics> list = null;
		String term = request.getParameter("term");
		
		int currentPage;		
		int limit;				
		int maxPage;			
		int startPage;			
		int endPage;			

		currentPage = 1;
		if(request.getParameter("currentPage") != null){
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
         
		int listCount = new AdminService().getMemberListCount(term);

		limit = 8;

		maxPage = (int)((double)listCount / limit + 0.9);

		startPage = (((int)((double)currentPage / limit + 0.9)) -1) * limit + 1;

		endPage = startPage + limit - 1;

		if(maxPage < endPage){
			endPage = maxPage;
		}

		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		
		if(term == null){
			list = new AdminService().selectMemberList("date", currentPage, limit);
			request.setAttribute("num","0");
			request.setAttribute("pi", pi);
		}else if(term.equals("month")){
			list = new AdminService().selectMemberList("month", currentPage, limit);
			request.setAttribute("num","1");
			request.setAttribute("pi", pi);
		}else{
			list = new AdminService().selectMemberList("year", currentPage, limit);
			request.setAttribute("num","2");
			request.setAttribute("pi", pi);
		}
		
		
			request.setAttribute("list", list);
			request.getRequestDispatcher("views/admin/memberStatistics.jsp").forward(request, response);
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
