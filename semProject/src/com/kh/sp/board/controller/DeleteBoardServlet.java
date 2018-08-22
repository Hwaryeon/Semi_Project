package com.kh.sp.board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.sp.board.model.service.BoardService;

@WebServlet("/deleteBoard")
public class DeleteBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DeleteBoardServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	
		System.out.println("삭제호출");
		
		int wNo = Integer.parseInt(request.getParameter("wNo"));
		
		int result = new BoardService().deleteBoard(wNo);
		
		if(result > 0){
			response.sendRedirect("/sp/allBoard");
			
		}else{
			String page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "공지사항 삭제 실패");
			

			RequestDispatcher view = request.getRequestDispatcher(page);
			view.forward(request, response);
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
