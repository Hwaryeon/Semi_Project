package com.kh.sp.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.sp.member.model.service.MemberService;
import com.kh.sp.member.model.vo.Member;

@WebServlet("/selectOne.me")
public class SelectOneMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectOneMemberServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userName = request.getParameter("userName");
		String phone = request.getParameter("phone");
		Member m = new MemberService().selectOne(userName, phone);
		
		String page = "";
		
		if(m != null){
			page = "views/member/findIdResult.jsp";
			request.setAttribute("m", m);
		}else{
			page = "views/member/findIdResult.jsp";
		}
		
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
