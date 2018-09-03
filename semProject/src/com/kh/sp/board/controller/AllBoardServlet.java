package com.kh.sp.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.sp.board.model.service.BoardService;
import com.kh.sp.board.model.vo.Board;
import com.kh.sp.board.model.vo.PageInfo;

@WebServlet("/allBoard")
public class AllBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AllBoardServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*System.out.println("allBoard 호출됨");*/
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		int currentPage;		//현재 페이지를 표시할 변수
		int limit;				//한 페이지에 게시글이 몇 개가 보여질 것인지
		int maxPage;			//전체 페이지에서 가장 마지막 페이지
		int startPage;			//한번에 표시될 페이지가 시작할 페이지
		int endPage;			//한번에 표시될 페이지가 끝나는 페이지
		
		currentPage = 1;
		if(request.getParameter("currentPage") != null){
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int listCount = new BoardService().getListCount();
		
		limit = 7;
		
		maxPage = (int)((double)listCount / limit + 0.9);
		
		startPage = (((int)((double)currentPage / 5 + 0.9)) -1) * 5 + 1;
		
		endPage = startPage + 5 - 1;
		
		
		if(maxPage < endPage){
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		
		ArrayList<Board> list = new BoardService().allBoard(currentPage, limit);
		
		String page = "views/board/board.jsp";
		request.setAttribute("list", list);
		request.setAttribute("pi", pi);

		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
