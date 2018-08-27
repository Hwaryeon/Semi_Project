package com.kh.sp.admin.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.sp.admin.model.service.AdminService;

@WebServlet("/updateBlackList.adm")
public class BlackListUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BlackListUpdateServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	System.out.println("블랙리스트 업데이트 오니?");
	
	String text = request.getParameter("text");
	
	System.out.println("text = " + text);
	
	String userId = request.getParameter("userId");
	
	System.out.println("user_id = " + userId);
	int result = new AdminService().updateBlackList(text);
	
	String page = "";
	
	if(result > 0){
		page = "views/admin/searchMember.jsp";
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
