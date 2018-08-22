package com.kh.sp.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.sp.board.model.vo.Board;
import com.kh.sp.main.model.service.MainService;
import com.kh.sp.member.model.service.MemberService;
import com.kh.sp.member.model.vo.Member;

@WebServlet("/snsLogin.na")
public class SNSLoginServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SNSLoginServlet2() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String userEmail = request.getParameter("email");
		String nickName = request.getParameter("nickname");
		String accessToken = request.getParameter("accessToken");
		String refreshToken = request.getParameter("refreshToken");
		String platformId = request.getParameter("id");
		
		Member m = new Member();
		m.setEmail(userEmail);
		m.setPlatformType("naver");
		m.setNickName(nickName);
		m.setRefreshToken(refreshToken);
		m.setRefreshToken(refreshToken);
		m.setPlatformId(platformId);
		
		Member loginUser = new MemberService().checkEmailMember(userEmail);
		
		if(loginUser == null){
			loginUser = new MemberService().checkMember(m);
		}else{
			request.setAttribute("msg", "이미 이메일로 가입된 계정입니다.");
			RequestDispatcher view = request.getRequestDispatcher("views/member/loginForm.jsp");
			view.forward(request, response);
			return;
		}
		
		HttpSession session = request.getSession();
		
		if(loginUser == null){
			int result = new MemberService().insertSnsMember(m);
			
			if(result > 0){
				request.setAttribute("msg", "가입 성공");
				session.setAttribute("accessToken", accessToken);
			}
			else{
				request.setAttribute("msg", "로그인 및 가입 실패");
			}
			RequestDispatcher view = request.getRequestDispatcher("views/member/loginForm.jsp");
			view.forward(request, response);
			
		}else{
			request.setAttribute("msg", "로그인 성공");
			session.setAttribute("accessToken", accessToken);
			session.setAttribute("loginUser", loginUser);
			
			ArrayList<Board> list = new MainService().startMain();
			request.setAttribute("list", list);
			request.getRequestDispatcher("index.jsp").forward(request, response);
			
			/*RequestDispatcher view = request.getRequestDispatcher("views/main/main.jsp");
			view.forward(request, response);*/
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
