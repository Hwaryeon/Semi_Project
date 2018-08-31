package com.kh.sp.product.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.sp.product.model.service.ProductService;

/**
 * Servlet implementation class SelectNews
 */
@WebServlet("/SelectNews.pm")
public class SelectNews extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectNews() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("num"));
		System.out.println("num은 말이야"+ num);
		ArrayList<HashMap<String, Object>> newsList
		= new ProductService().selectNewsList(num);
		HashMap<String, Object> hm = new ProductService().selectNewsList2(num);
		System.out.println(newsList);
		String page = "/views/funding/product2.jsp";
		if(newsList != null) {
			request.setAttribute("hm", hm);
			request.setAttribute("newsList", newsList);	
		}else {
			System.out.println("조회 실패");
		}
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
