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

import com.kh.sp.board.model.vo.Attachment;
import com.kh.sp.funding.model.vo.Product;
import com.kh.sp.product.model.service.ProductService;

/**
 * Servlet implementation class SelectOneProduct
 */
@WebServlet("/SelectOne.tn")
public class SelectOneProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectOneProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("num"));
		System.out.println("num은??"+num);
		
		
		HashMap<String, Object> hmap = new ProductService().selectOne(num);
		
		String page = "";
		
		if(hmap!=null) {
			page = "views/funding/product.jsp";
			request.setAttribute("hamp", hmap);
			/*request.setAttribute("a", (Product)hmap.get("product"));
			request.setAttribute("proList",(ArrayList<Attachment>)hmap.get("attachment"));*/
		}else {
			System.out.println("상세 보기 실패!");
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
