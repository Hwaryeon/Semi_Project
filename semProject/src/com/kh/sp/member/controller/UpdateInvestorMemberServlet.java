package com.kh.sp.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.sp.member.model.service.MemberService;

@WebServlet("/updateInvestorMember")
public class UpdateInvestorMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public UpdateInvestorMemberServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		int result = new MemberService().updateInvestorMember(userId);
		
		if(result > 0){
			request.setAttribute("msg", "투자자로 회원정보 변경이 완료되었습니다. 재로그인 해주세요");
			request.getSession().invalidate();
		}else{
			request.setAttribute("msg", "투자자로 회원정보 변경에 실패하였습니다.");
		}
		
		
		RequestDispatcher view = request.getRequestDispatcher("views/member/loginForm.jsp");
		view.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
