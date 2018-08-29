package com.kh.sp.main.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.sp.board.model.vo.Board;
import com.kh.sp.funding.model.service.FundingService;
import com.kh.sp.funding.model.vo.Product;
import com.kh.sp.main.model.service.MainService;

@WebServlet("")
public class ViewMainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ViewMainServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println("메인화면 호출");
	
		ArrayList<Board> list = new MainService().startMain();
		 
		ArrayList<Product> newFList = new FundingService().newFundingList();
		ArrayList<Product> mainFList = new FundingService().mainFundingList();
		ArrayList<Product> hotFList = new FundingService().hotFundingList();
		ArrayList<Product> closeFList = new FundingService().closeFundingList();
		

		if(list.size() > 0){

			
		/*if(list.size() > 0){*/

			request.setAttribute("list", list);
			request.setAttribute("newFList", newFList);
			request.setAttribute("mainFList", mainFList);
			request.setAttribute("hotFList", hotFList);
			request.setAttribute("closeFList", closeFList);
			
			request.getRequestDispatcher("index.jsp").forward(request, response);
			
		}else{
			request.setAttribute("msg", "메인 화면 호출 실패!");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
