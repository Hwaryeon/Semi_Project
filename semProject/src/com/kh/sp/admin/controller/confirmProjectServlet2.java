package com.kh.sp.admin.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.sp.admin.model.service.AdminService;

@WebServlet("/confirmProject2.adm")
public class confirmProjectServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public confirmProjectServlet2() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("컨펌 미승인 서블릿 왔쥬");
		
		int p_Id = Integer.parseInt(request.getParameter("p_id2"));
		
		System.out.println(p_Id);

		int result = new AdminService().updateConfirm2(p_Id);
		
		String page = "";
		
		if(result > 0){
			page = "confirmSelectAll.adm";
			request.setAttribute("msg", "성공성공");
			 
		}else{
			page ="views/common/errorPage.jsp";
			request.setAttribute("msg", "업데이트 실패");
		}
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
		
		}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
