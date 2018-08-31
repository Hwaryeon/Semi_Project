package com.kh.sp.admin.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.sp.admin.model.service.AdminService;

@WebServlet("/insertBlackList.adm")
public class BlackListInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BlackListInsertServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	System.out.println("블랙리스트 인서트 오니?");
	
	
	int userId =Integer.parseInt(request.getParameter("user_id"));
	
	System.out.println("아이디 시키야 좀 와라~!~!~!~!~!~!~!~!~!~!" + userId);
	
	String text = request.getParameter("text");
	
	System.out.println("text = " + text);
	
	
	int result = new AdminService().insertBlackList(text, userId);
	
	String page = "";
	
	if(result > 0){
		page = "selectAllMember.adm";
	}else{
		page = "views/common/errorPage.jsp";
	}
	RequestDispatcher view = request.getRequestDispatcher(page);
	view.forward(request, response);
	
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
