package com.kh.sp.myPage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.sp.myPage.model.service.MypageDetailService;
import com.kh.sp.myPage.model.vo.MypageDetail;

@WebServlet("/select.ep")
public class SelectEnrollProjectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public SelectEnrollProjectServlet() { super(); }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		int userId = Integer.parseInt(request.getParameter("userid"));
		System.out.println("userId : " + userId);
		
		ArrayList<MypageDetail> list = new MypageDetailService().selectList(userId);
		System.out.println("list : " + list);
		String page = "";
		
		if(list != null){
			page = "views/myPage/enrollProject.jsp";
			request.setAttribute("list", list);
		}
		else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "참여/개설 프로젝트 조회 실패");
		}
		
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
