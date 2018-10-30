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

//ユーザー個人情報を修正
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
		String userName = request.getParameter("userName");
		String nickname = request.getParameter("nickName");
		String phone = request.getParameter("tel");
		
		Member m = new Member();
		
		//requestから情報をもらって修正する
		m.setEmail(userEmail);
		m.setUserName(userName);
		m.setNickName(nickname);
		if(platform.equals("email")) {
			String password = request.getParameter("userPwd");
			if(!(password.equals(""))){
				m.setUserPwd(password);
			}
		}
		m.setPhone(phone);
		m.setUserId(Integer.parseInt(userId));
		m.setPlatformType(platform);
		
		int result = new MemberService().updateMember(m);
		Member m2 = new MemberService().checkEmail(userEmail);

		String page = "";
				
		//修正に成功した時
		if(result > 0) {
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", m2);
			page = "views/myPage/mypageIndex.jsp";
			request.setAttribute("msg", "회원 정보 수정에 성공하였습니다.");
		} else { //修正に失敗した時
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "회원 정보 수정에 실패하였습니다!!");
		}
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
