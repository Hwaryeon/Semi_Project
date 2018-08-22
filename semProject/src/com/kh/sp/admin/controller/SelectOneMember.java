package com.kh.sp.admin.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.sp.admin.model.service.AdminService;
import com.kh.sp.member.model.vo.Member;

@WebServlet("/selectOneMember.adm")
public class SelectOneMember extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectOneMember() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("셀렉트 원 오니?");
		
		int user_id = Integer.parseInt(request.getParameter("userId2"));
		String user_class = request.getParameter("userClass2");
		
		System.out.println("user_id = " + user_id);
		System.out.println("user_class = " + user_class);
		Member m = new AdminService().selectOne(user_id);
		
		String page = null;
		
		if(m != null && user_id >= 100){
			page = "views/admin/searchMember.jsp";
			request.setAttribute("m", m);
			
		}else if(m != null && user_id >= 50 && user_id < 100){
			page="views/admin/searchInvMember.jsp";
			request.setAttribute("m", m);
			
		}else if(m != null && user_id >= 1 && user_id < 50){
			page="views/admin/searchInvMember.jsp";
			request.setAttribute("m", m);
		}else{
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "회원 상세 조회 실패");
		}
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
