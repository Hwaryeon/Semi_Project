package com.kh.sp.admin.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.sp.admin.model.service.AdminService;
@WebServlet("/dlineProject2.adm")
public class updateDlineServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public updateDlineServlet2() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	System.out.println("미승인 처리 서블릿 가즈아");
	int p_Id = Integer.parseInt(request.getParameter("p_id2"));
	
	System.out.println(p_Id);
	int result = new AdminService().updateDline2(p_Id);
	
	String page = "";
	
	if(result > 0){
		page = "dlineSelectAll.adm";
		request.setAttribute("msg", "성공성공");
		 
	}else{
		page ="views/common/errorPage.jsp";
		request.setAttribute("msg", "업데이트 실패");
	}
	RequestDispatcher view = request.getRequestDispatcher(page);
	view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
