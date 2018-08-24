package com.kh.sp.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.sp.admin.model.service.AdminService;
import com.kh.sp.admin.model.vo.SalesStatistics;


@WebServlet("/salesSt.adm")
public class SalesStatisticsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public SalesStatisticsServlet() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<SalesStatistics> list = null;
		list = new AdminService().selectSalesList(0, "date");
		//list = new AdminService().selectSalesList(0, "month");
		//list = new AdminService().selectSalesList(0, "year");
		//list = new AdminService().selectSalesList(1, "date");
		//list = new AdminService().selectSalesList(1, "month");
		//list = new AdminService().selectSalesList(1, "year");
		//list = new AdminService().selectSalesList(2, "date");
		//list = new AdminService().selectSalesList(2, "month");
		//list = new AdminService().selectSalesList(2, "year");
		//list = new AdminService().selectSalesList(3, "date");
		//list = new AdminService().selectSalesList(3, "month");
		//list = new AdminService().selectSalesList(3, "year");
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
