package com.kh.sp.myPage.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.sp.member.model.service.MemberService;
import com.kh.sp.member.model.vo.Member;

@WebServlet("/update.me")
public class UpdateUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateUserServlet() { super(); }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html); charset=UTF-8");
		
		String platform = request.getParameter("platformType");
		String userId = request.getParameter("userId");
		String userEmail = request.getParameter("email");
		String nickname = request.getParameter("nickName");
		String phone = request.getParameter("tel");
		
		Member m = new Member();
		
		m.setEmail(userEmail);//이메일
		m.setNickName(nickname);//닉네임
		if(platform.equals("email")) {
			String password = request.getParameter("userPwd");
			if(!(password.equals(""))){
				m.setUserPwd(password);
			}
		}
		m.setPhone(phone);//전화번호
		m.setUserId(Integer.parseInt(userId));//유저아이디
		m.setPlatformType(platform);//플랫폼타입
		
		int result = new MemberService().updateMember(m);
		
		//처리 결과에 따른 뷰 페이지 결정
		String page = "";
				
		if(result > 0) {
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", m);
			response.sendRedirect("views/myPage/updateMember.jsp");
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "회원 정보 수정에 실패하였습니다!!");
			//뷰 페이지로 전달
			RequestDispatcher view = request.getRequestDispatcher(page);
			view.forward(request, response);
					
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
