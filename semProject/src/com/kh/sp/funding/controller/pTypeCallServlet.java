package com.kh.sp.funding.controller;

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
import com.kh.sp.funding.model.service.FundingService;
import com.kh.sp.funding.model.vo.ProductType;


@WebServlet("/ptype")
public class pTypeCallServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public pTypeCallServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println("상품 타입 호출");
	
		HashMap<String, Object> hmap = new FundingService().callType();
	
		/*System.out.println("hmap : " + hmap);*/
		
		
		String page = "views/funding/fundingWriter.jsp";
		request.setAttribute("productType", (ArrayList<ProductType>)hmap.get("productType"));
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
