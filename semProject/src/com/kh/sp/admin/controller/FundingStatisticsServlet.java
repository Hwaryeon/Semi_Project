package com.kh.sp.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.sp.admin.model.service.AdminService;
import com.kh.sp.admin.model.vo.OpenFundingStatistics;
import com.kh.sp.admin.model.vo.SalesStatistics;
import com.kh.sp.admin.model.vo.SuccessFundingStatistics;

@WebServlet("/fundingSt.adm")
public class FundingStatisticsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public FundingStatisticsServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<OpenFundingStatistics> list1 = null;
		ArrayList<SuccessFundingStatistics> list2 = null;
		
		list1 = new AdminService().selectOpenFundingList("month");
		//list1 = new AdminService().selectOpenFundingList("year");
		list2 = new AdminService().selectSuccessFundingList("month");
		//list1 = new AdminService().selectSuccessFundingList("year");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
