package com.kh.sp.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.sp.admin.model.service.AdminService;
import com.kh.sp.admin.model.vo.SuccessFundingStatistics;

/**
 * Servlet implementation class FundingStatisticsServlet2
 */
@WebServlet("/fundingSt2.adm")
public class FundingStatisticsServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FundingStatisticsServlet2() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<SuccessFundingStatistics> list = null;
		
		String term = request.getParameter("term");
		if(term == null){
			list = new AdminService().selectSuccessFundingList("month");
			request.setAttribute("num","0");
		}else{
			list = new AdminService().selectSuccessFundingList("year");
			request.setAttribute("num","1");
		}
		
		request.setAttribute("list", list);
		request.getRequestDispatcher("views/admin/fundingStatistics2.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
