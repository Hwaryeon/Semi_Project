package com.kh.sp.product.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.sp.board.model.vo.Board;
import com.kh.sp.product.model.service.ProductService;

/**
 * Servlet implementation class InsertNews
 */
@WebServlet("/InsertNews.pm")
public class InsertNews extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertNews() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("newsTitle");	
		String text = request.getParameter("mainText");
	 
		System.out.println(title);
		System.out.println(text);
		
		Board b = new Board();
		b.setTitle(title);
		b.setaText(text);
		System.out.println(b.getTitle());
		System.out.println(b.getaText());
		int result = new ProductService().insertNews(b);
		System.out.println("왔어");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
