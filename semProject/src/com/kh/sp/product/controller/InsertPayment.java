package com.kh.sp.product.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.sp.product.model.service.ProductService;
import com.kh.sp.product.model.vo.Invest;

/**
 * Servlet implementation class InsertPayment
 */
@WebServlet("/Insert.pm")
public class InsertPayment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertPayment() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String investId = request.getParameter("investId");
		int userId = Integer.parseInt(request.getParameter("userId"));
		int pId = Integer.parseInt(request.getParameter("pId"));
		int price = Integer.parseInt(request.getParameter("price"));
		String status = request.getParameter("status");
		
		System.out.println(price);
		Invest i = new Invest();
		
		i.setInvestId(investId);
		i.setUserId(userId);
		i.setpId(pId);
		i.setPrice(price);
		i.setStatus(status);
		
		int result = new ProductService().InsertPayment(i);
		
		
		
		if(result > 0) {
			
			System.out.println("등록성공");
			
		}else {
			/*page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "공지사항 등록 실패!!");
			RequestDispatcher view = request.getRequestDispatcher(page);
			view.forward(request, response);*/
			System.out.println("실패");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
