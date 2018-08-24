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

@WebServlet("/insertMember.me")
public class InsertMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
    public InsertMemberServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("email");
		String userName = request.getParameter("userName");
		String userPwd = request.getParameter("userPwd");
		String phone = request.getParameter("phone");
		String nickName = request.getParameter("nickName");
		String businessLicenseNo = request.getParameter("businessLicenseNo");
		String corporateRegistrationNo = request.getParameter("corporateRegistrationNo");
		String corporateName = request.getParameter("corporateName");
		
		Member member = new Member();
		
		member.setEmail(email);
		member.setUserName(userName);
		member.setUserPwd(userPwd);
		member.setPhone(phone);
		member.setNickName(nickName);
		member.setBusinessLicenseNo(businessLicenseNo);
		member.setCorporateRegistrationNo(corporateRegistrationNo);
		member.setCorporateName(corporateName);
		
		int result = new MemberService().insertMember(member);
		if(result > 0){
			request.setAttribute("msg", "회원 가입이 완료 되었습니다. 로그인 해주세요.");
		}else{
			request.setAttribute("msg", "회원 가입에 실패하였습니다. 다시 시도해 주세요.");
		}
		
		
		RequestDispatcher view = request.getRequestDispatcher("views/member/loginForm.jsp");
		view.forward(request, response);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
