package com.kh.sp.message.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/reMessage")
public class reMessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public reMessageServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println("??????");
		
		String userId = request.getParameter("user_id");
		
		System.out.println("userid : " +userId);
		
		request.setAttribute("userId", userId);
		
		request.getRequestDispatcher("views/popup/replyMessage.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
