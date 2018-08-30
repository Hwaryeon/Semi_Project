package com.kh.sp.message.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.sp.message.model.service.MessageService;

@WebServlet("/deleteMessage")
public class deleteMessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public deleteMessageServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		System.out.println("삭제 서블릿 호출");
	
		String msgId = request.getParameter("msgId");
		String userId = request.getParameter("userId");
		/*System.out.println("msgId : " + msgId);*/
		
		int result = new MessageService().deleteMsg(msgId);
		
		if(result > 0){
			String page = "listMessage";
			request.setAttribute("user_id", userId);
			
			request.getRequestDispatcher("listMessage").forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
