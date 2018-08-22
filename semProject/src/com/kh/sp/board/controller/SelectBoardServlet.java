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

@WebServlet("/selectBoard")
public class SelectBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectBoardServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("공지사항 상세보기 호출");
		
		String wNo = request.getParameter("wNo");
		String type = request.getParameter("type"); 
		System.out.println("type : " + type);
		
		Board b = new BoardService().detailBoard(Integer.parseInt(wNo), Integer.parseInt(type));
		
		HashMap<String, Object> hmap= new BoardService().selectOneAttachment(wNo);
		
		System.out.println("hmap : " + hmap);
		
		String page = "";
		if(b != null){
			page = "views/board/boardUpdate.jsp";
			request.setAttribute("b", b);
			
			if( hmap != null){
				request.setAttribute("fileList", (ArrayList<Attachment>)hmap.get("attachment"));
			}
			
		}else{
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "수정 상세보기 실패");
		}
	
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
	
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
