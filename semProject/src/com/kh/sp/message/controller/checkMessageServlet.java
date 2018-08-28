package com.kh.sp.message.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.sp.message.model.service.MessageService;

@WebServlet("/checkMessage")
public class checkMessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public checkMessageServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		/*System.out.println("메세지 확인 서블릿");*/
		String id = request.getParameter("id");
		/*System.out.println("id : " + id);*/
	
		int result = new MessageService().checkMessage(Integer.parseInt(id));
	
		/*System.out.println("reuslt : " + result);*/
		
		response.getWriter().print(result);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
