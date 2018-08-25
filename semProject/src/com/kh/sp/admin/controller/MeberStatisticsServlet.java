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
import com.kh.sp.admin.model.vo.OpenFundingStatistics;

@WebServlet("/memberSt.adm")
public class MeberStatisticsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
    public MeberStatisticsServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<MemberStatistics> list = null;

		String term = request.getParameter("term");
		
		if(term == null){
			list = new AdminService().selectMemberList("date");
			request.setAttribute("num","0");
		}else if(term.equals("month")){
			list = new AdminService().selectMemberList("month");
			request.setAttribute("num","1");
		}else{
			list = new AdminService().selectMemberList("year");
			request.setAttribute("num","2");
		}
		
		request.setAttribute("list", list);
		request.getRequestDispatcher("views/admin/memberStatistics.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
