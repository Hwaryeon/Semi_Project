package com.kh.sp.message.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.sp.message.model.service.MessageService;
import com.kh.sp.message.model.vo.Message;

@WebServlet("/reWriteMessage")
public class reWriteMessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public reWriteMessageServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println("답장 db 전송 서블릿");
	
		String title = request.getParameter("title");
		String userId = request.getParameter("userId");
		String receive_id = request.getParameter("receive_id");
		String msg = request.getParameter("msg");
		
		System.out.println(title);
		System.out.println(userId);
		System.out.println(receive_id);
		System.out.println(msg);
		
		Message m = new Message(title, msg, Integer.parseInt(userId), Integer.parseInt(receive_id));
		
		int result = new MessageService().reWriteMsg(m);
	
		if(result > 0){
			
			
			String page = "listMessage";
			request.setAttribute("user_id", userId);
			
			request.getRequestDispatcher("listMessage").forward(request, response);
			/*response.sendRedirect(page);*/
		}
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
