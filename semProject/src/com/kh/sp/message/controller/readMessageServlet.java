package com.kh.sp.message.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.sp.message.model.service.MessageService;
import com.kh.sp.message.model.vo.Message;

@WebServlet("/readMessage")
public class readMessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public readMessageServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	
		System.out.println("메시지 읽기 서블릿 ");
		
		int msgId = Integer.parseInt(request.getParameter("num")); 		// 임시로 설정
		
		String type = request.getParameter("type");
		
		System.out.println("type : " + type);
		
		Message m = new MessageService().readMessage(msgId, type);
	
		request.setAttribute("message", m);
		request.setAttribute("type", type);
		
		/*System.out.println(m);*/
		
		request.getRequestDispatcher("views/popup/readMessage.jsp").forward(request, response);
		
		
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
