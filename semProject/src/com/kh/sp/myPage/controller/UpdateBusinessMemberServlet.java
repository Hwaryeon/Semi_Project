package com.kh.sp.myPage.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.sp.member.model.service.MemberService;
import com.kh.sp.member.model.vo.Member;

@WebServlet("/updateBusinessMember")
public class UpdateBusinessMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateBusinessMemberServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String businessLicenseNo = request.getParameter("businessLicenseNo");
		String corporateRegistrationNo = request.getParameter("corporateRegistrationNo");
		String corporateName = request.getParameter("corporateName");
        
		Member member = new Member();
		member.setUserId(Integer.parseInt(userId));
		member.setBusinessLicenseNo(businessLicenseNo);
		member.setCorporateRegistrationNo(corporateRegistrationNo);
		member.setCorporateName(corporateName);
		
		int result = new MemberService().updateBusinessMember(member);
		
		if(result > 0){
			request.setAttribute("msg", "사업자회원정보 변경 완료 되었습니다.");
		}else{
			request.setAttribute("msg", "사업자회원정보 변경에 실패하였습니다.");
		}
		RequestDispatcher view = request.getRequestDispatcher("views/myPage/mypageIndex.jsp");
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
