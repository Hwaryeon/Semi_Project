package com.kh.sp.admin.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.sp.admin.model.service.AdminService;
import com.kh.sp.message.model.service.MessageService;
import com.kh.sp.message.model.vo.Message;

@WebServlet("/updateInvRank.adm")
public class UpdateInvRankServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateInvRankServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	System.out.println("투자자 등급 변경 서블릿 호출");
	
	int userId = Integer.parseInt(request.getParameter("user_id"));
	
	System.out.println("user_id : " + userId);
	int result = new AdminService().updateRank(userId);
	
	String page = "";
	
	if(result > 0){
		
		String title = request.getParameter("title");
		String msg = request.getParameter("msg");
		
		Message m = new Message();
		m.setReceive_id(userId);
		m.setTitle(title);
		m.setMsg(msg);
		m.setUser_id(0);
		
		
		result = new MessageService().sendMessage(m);

		if(result > 0){
			page = "invRankSelectAll.adm";
			request.setAttribute("msg", "성공성공");
		}
		 
	}else{
		page ="views/common/errorPage.jsp";
		request.setAttribute("msg", "업데이트 실패");
	}
	RequestDispatcher view = request.getRequestDispatcher(page);
	view.forward(request, response);
	
	
	
	
	
	
	
	
	
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
