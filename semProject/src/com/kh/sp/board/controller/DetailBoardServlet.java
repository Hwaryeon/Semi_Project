package com.kh.sp.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.sp.board.model.service.BoardService;
import com.kh.sp.board.model.vo.Attachment;
import com.kh.sp.board.model.vo.Board;
import com.kh.sp.board.model.vo.PageNP;

@WebServlet("/boardRead.jsp")
public class DetailBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DetailBoardServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
	
		String num= request.getParameter("num");
		int wNum = Integer.parseInt(num);

		int type = 0;
		
		Board b = new BoardService().detailBoard(wNum, type);
		
		PageNP np = new BoardService().npBoard(wNum);
	
		HashMap<String, Object> hmap= new BoardService().selectOneAttachment(num);
		
		String page = "views/board/boardRead.jsp";
		request.setAttribute("board", b);
		request.setAttribute("np", np);
		
		if(hmap != null){
			request.setAttribute("fileList", (ArrayList<Attachment>)hmap.get("attachment"));
		}

		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
