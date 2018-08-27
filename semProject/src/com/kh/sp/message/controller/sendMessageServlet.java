package com.kh.sp.message.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.sp.message.model.service.MessageService;
import com.kh.sp.message.model.vo.Message;

@WebServlet("/sendMessage")
public class sendMessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public sendMessageServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		/*System.out.println("메세지 전송 서블릿");*/
		String title = request.getParameter("title");
		String msg = request.getParameter("msg");
		int id = Integer.parseInt(request.getParameter("user_id"));	
		
		/*System.out.println(title);
		System.out.println(msg);
		System.out.println(id);*/
		
		Message m = new Message(title, msg, id);
		
		int result = new MessageService().sendMessage(m);
		
		if(result > 0){
			System.out.println("메세지 전송 성공");
		}else{
			System.out.println("메세지 전송 실패");
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
