package com.kh.sp.funding.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/deleteImg.fn")
public class DeleteImgFundingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DeleteImgFundingServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String src = request.getParameter("src");
		String data = request.getParameter("data");
		String root = request.getSession().getServletContext().getRealPath("/");
		String[] srcArr = src.split("/");
		
		System.out.println(src);
		
		for(int i = 0; i < srcArr.length; i++){
			src = srcArr[i];
		}
		
		System.out.println(src);
		System.out.println(root + "img/");
		
		String savePath = root + "img/funding/";
		
		File deleteFile = new File(savePath + src);
		deleteFile.delete();
	
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
