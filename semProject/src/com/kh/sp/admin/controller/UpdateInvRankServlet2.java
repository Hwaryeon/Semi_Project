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

@WebServlet("/updateRank2.adm")
public class UpdateInvRankServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateInvRankServlet2() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	System.out.println("미승인 서블릿 오니? 오니? 와줘");
	
	
	int userId = Integer.parseInt(request.getParameter("user_id2"));
	
	System.out.println(userId);
	
	int result = new AdminService().updateRank2(userId);
	
	String page = "";
	
	if(result > 0){
		
		String title = request.getParameter("title2");
		String msg = request.getParameter("msg2");
		
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
