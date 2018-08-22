package com.kh.sp.member.controller;

import java.io.IOException;

import javax.mail.Session;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.sp.member.model.service.MemberService;

@WebServlet("/updatePwd.me")
public class UpdatePasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
    public UpdatePasswordServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userPwd = request.getParameter("userPwd");
		String email = request.getParameter("email");
		int sw = 1;
		int result = new MemberService().updatePassword(email, userPwd, sw);
		
		String page = "";
		
		if(result > 0){
			request.setAttribute("msg", "비밀번호가 변경되었습니다. 로그인 해주세요.");
		}else{
			request.setAttribute("msg", "비밀번호 재설정에 실패하였습니다.");
		}
		
		RequestDispatcher view = request.getRequestDispatcher("views/member/loginForm.jsp");
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		doGet(request, response);
	}

}
