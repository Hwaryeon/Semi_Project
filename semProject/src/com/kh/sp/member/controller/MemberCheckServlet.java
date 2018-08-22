package com.kh.sp.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.sp.member.model.service.MemberService;
import com.kh.sp.member.model.vo.Member;

@WebServlet("/memberCheck.me")
public class MemberCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberCheckServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nickName = request.getParameter("nickName");
		String businessLicenseNo = request.getParameter("businessLicenseNo");
		
		Member m = null;
		
		if(nickName != null){
			m = new MemberService().checkNickName(nickName);
		}else if(businessLicenseNo != null){
			m = new MemberService().checkBusinessLicenseNo(businessLicenseNo);
		}
		
		if(m != null){
			response.getWriter().println(1);
		}else{
			response.getWriter().println(0);
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
