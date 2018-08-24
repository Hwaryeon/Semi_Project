package com.kh.sp.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.sp.board.model.vo.Board;
import com.kh.sp.funding.model.service.FundingService;
import com.kh.sp.funding.model.vo.Product;
import com.kh.sp.main.model.service.MainService;
import com.kh.sp.member.model.service.MemberService;
import com.kh.sp.member.model.vo.Member;

@WebServlet("/login.me")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public LoginServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String email = request.getParameter("email");
		String userPwd = request.getParameter("userPwd");
		
		
		Member loginUser = new MemberService().loginCheck(email, userPwd);
	    System.out.println(loginUser);
		if(loginUser != null){
			
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", loginUser);
			
			if(loginUser.getPwdStatus().equals("NT")){
				request.setAttribute("msg", "로그인 성공");
				session.setAttribute("loginUser", loginUser);
				
				ArrayList<Board> list = new MainService().startMain();
				ArrayList<Product> newFList = new FundingService().newFundingList();
				ArrayList<Product> mainFList = new FundingService().mainFundingList();
				ArrayList<Product> hotFList = new FundingService().hotFundingList();
				ArrayList<Product> closeFList = new FundingService().closeFundingList();
				
				request.setAttribute("list", list);
				request.setAttribute("newFList", newFList);
				request.setAttribute("mainFList", mainFList);
				request.setAttribute("hotFList", hotFList);
				request.setAttribute("closeFList", closeFList);
				
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}else{
				response.sendRedirect("views/member/resetPassword.jsp");
			}
			
		}else{
			//모달로 로그인 실패 알림 구현?
			request.setAttribute("msg", "로그인 실패!!");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
