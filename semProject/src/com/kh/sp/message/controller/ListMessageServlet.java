package com.kh.sp.message.controller;

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
import com.kh.sp.message.model.service.MessageService;
import com.kh.sp.message.model.vo.Message;

@WebServlet("/listMessage")
public class ListMessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ListMessageServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("메시지 리스트 서블릿");

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		int user_id = 999 ;   // 임시로 입력    (메시지를 보는 사람의 아이디)

		//페이징 처리
		int currentPage;		//현재 페이지를 표시할 변수
		int limit;				//한 페이지에 게시글이 몇 개가 보여질 것인지
		int maxPage;			//전체 페이지에서 가장 마지막 페이지
		int startPage;			//한번에 표시될 페이지가 시작할 페이지
		int endPage;			//한번에 표시될 페이지가 끝나는 페이지

		int currentPage2;		//현재 페이지를 표시할 변수
		int maxPage2;			//전체 페이지에서 가장 마지막 페이지
		int startPage2;			//한번에 표시될 페이지가 시작할 페이지
		int endPage2;			//한번에 표시될 페이지가 끝나는 페이지
		
		
		String pageType = "1";
		if(request.getParameter("pageType") != null){
			pageType = request.getParameter("pageType");
		}
		
		System.out.println("pageType : " + pageType);
		
		currentPage = 1;
		if(request.getParameter("currentPage") != null){
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		currentPage2 = 1;
		if(request.getParameter("currentPage") != null){
			currentPage2 = Integer.parseInt(request.getParameter("currentPage"));
		}

		//전체 목록 갯수와 목록 전체를 리턴받음
		
		
			
		int listCount = new MessageService().getListCount(user_id);
		
		
		int listCount2 = new MessageService().getListCount2(user_id);
		
		limit = 7;

		//총 페이지 수 계산
		maxPage = (int)((double)listCount / limit + 0.9);
		maxPage2 = (int)((double)listCount / limit + 0.9);

		//현재 페이지에 보여줄 시작 페이지 수
		startPage = (((int)((double)currentPage / 5 + 0.9)) -1) * 5 + 1;
		startPage2 = (((int)((double)currentPage / 5 + 0.9)) -1) * 5 + 1;

		//목록 아래 보여질 마지막 페이지 수
		endPage = startPage + 5 - 1;
		endPage2 = startPage + 5 - 1;


		if(maxPage < endPage){
			endPage = maxPage;
		}

		if(maxPage2 < endPage2){
			endPage2 = maxPage2;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		PageInfo pi2 = new PageInfo(currentPage2, listCount2, limit, maxPage2, startPage2, endPage2);

		ArrayList<Message> list = null;
			list = new MessageService().listMsg(currentPage, limit, user_id);
			
		ArrayList<Message> list2 = null;	
			
			list2 = new MessageService().listMsg2(currentPage, limit, user_id);
		String page = "views/popup/messageList.jsp";
		request.setAttribute("list", list);
		request.setAttribute("pi", pi);
		request.setAttribute("list2", list2);
		request.setAttribute("pi2", pi2);
		request.setAttribute("pageType", pageType);

		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
