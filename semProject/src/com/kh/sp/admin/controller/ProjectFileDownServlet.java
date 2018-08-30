package com.kh.sp.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/pFileDown")
public class ProjectFileDownServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ProjectFileDownServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("펀딩 파일 다운로드 서블릿 ");
	
		int num = Integer.parseInt(request.getParameter("projectId"));
		
		System.out.println("파일번호 : " +num);
		
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
