package com.kh.sp.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.sp.admin.model.service.AdminService;
import com.kh.sp.admin.model.vo.PageInfo;
import com.kh.sp.admin.model.vo.SalesStatistics;


@WebServlet("/salesSt.adm")
public class SalesStatisticsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public SalesStatisticsServlet() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<SalesStatistics> list = null;
		String term = request.getParameter("term");
		String type = request.getParameter("type");
		int currentPage;		
		int limit;				
		int maxPage;			
		int startPage;			
		int endPage;			

		currentPage = 1;
		if(request.getParameter("currentPage") != null){
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
         
		int listCount = new AdminService().getSalesListCount(term);

		limit = 8;

		maxPage = (int)((double)listCount / limit + 0.9);

		startPage = (((int)((double)currentPage / limit + 0.9)) -1) * limit + 1;

		endPage = startPage + limit - 1;

		if(maxPage < endPage){
			endPage = maxPage;
		}

		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);

		request.setAttribute("pi", pi);
	
		if(type == null){
			if(term == null){
				list = new AdminService().selectSalesList("all", "date", currentPage, limit);
				request.setAttribute("num","0");
			}else if(term.equals("month")){
				list = new AdminService().selectSalesList("all", "month", currentPage, limit);
				request.setAttribute("num","1");
			}else{
				list = new AdminService().selectSalesList("all", "year", currentPage, limit);
				request.setAttribute("num","2");
			}
		    request.setAttribute("list", list);
		    request.getRequestDispatcher("views/admin/SalesStatistics.jsp").forward(request, response);
		
		}else if(type.equals("t1")){
			if(term == null){
				list = new AdminService().selectSalesList("t1", "date", currentPage, limit);
				request.setAttribute("num","0");
			}else if(term.equals("month")){
				list = new AdminService().selectSalesList("t1", "month", currentPage, limit);
				request.setAttribute("num","1");
			}else{
				list = new AdminService().selectSalesList("t1", "year", currentPage, limit);
				request.setAttribute("num","2");
			}
		    request.setAttribute("list", list);
		    request.getRequestDispatcher("views/admin/SalesStatistics2.jsp").forward(request, response);
		}else if(type.equals("t2")){
			if(term == null){
				list = new AdminService().selectSalesList("t2", "date", currentPage, limit);
				request.setAttribute("num","0");
			}else if(term.equals("month")){
				list = new AdminService().selectSalesList("t2", "month", currentPage, limit);
				request.setAttribute("num","1");
			}else{
				list = new AdminService().selectSalesList("t2", "year", currentPage, limit);
				request.setAttribute("num","2");
			}
		    request.setAttribute("list", list);
		    request.getRequestDispatcher("views/admin/SalesStatistics3.jsp").forward(request, response);
		}else{
			if(term == null){
				list = new AdminService().selectSalesList("t3", "date", currentPage, limit);
				request.setAttribute("num","0");
			}else if(term.equals("month")){
				list = new AdminService().selectSalesList("t3", "month", currentPage, limit);
				request.setAttribute("num","1");
			}else{
				list = new AdminService().selectSalesList("t3", "year", currentPage, limit);
				request.setAttribute("num","2");
			}
		    request.setAttribute("list", list);
		    request.getRequestDispatcher("views/admin/SalesStatistics4.jsp").forward(request, response);
		}
			
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
