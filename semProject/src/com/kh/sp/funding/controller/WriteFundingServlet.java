package com.kh.sp.funding.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.sp.funding.model.service.FundingService;
import com.kh.sp.funding.model.vo.Product;

@WebServlet("/write.fn")
public class WriteFundingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public WriteFundingServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("펀딩 등록 서블릿 호출");
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String title = request.getParameter("fundingTitle");	// 펀딩 제목
		String closeType = request.getParameter("closeType");	// 마감종류 선택
		String feeType = request.getParameter("feeType");		// 수수료
		String text = request.getParameter("mainText");			// 펀딩 내용
		String cAmount = request.getParameter("cAmount");
		String openDate = request.getParameter("openDate"); 	// 오픈 기간
		
		System.out.println(title);
		System.out.println(closeType);
		System.out.println(feeType);
		System.out.println(text);
		System.out.println(cAmount);
		System.out.println(openDate);
		
		
		int user = 999; 	// 유저 아이디 임시로 넣어놈
		System.out.println(user);
		Product p = new Product(closeType, user, title, feeType, text, Integer.parseInt(openDate), cAmount);
		
		int result = new FundingService().insertFunding(p);
		
		if(result > 0){
			System.out.println("등록성공");
			request.getRequestDispatcher("views/funding/funding1.jsp").forward(request, response);
		}else{
			request.setAttribute("msg", "공지사항 등록 실패!");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
