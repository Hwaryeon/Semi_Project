package com.kh.sp.funding.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/image.fn")
public class InsertImageFundingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InsertImageFundingServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println("이미지 업로드 호출");
		
		
		String wno = request.getParameter("wNo");
		System.out.println("wno : " + wno);
		
		 request.setCharacterEncoding("UTF-8");
		 String realFolder = "";
		 String filename1 = "";
		 int maxSize = 1024*1024*10;
		 String encType = "UTF-8";
		 String savefile = "img/funding";
		 ServletContext scontext = getServletContext();
		 realFolder = scontext.getRealPath(savefile);
		 
		 try{
		  MultipartRequest multi=new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());

		  Enumeration<?> files = multi.getFileNames();
		     String file1 = (String)files.nextElement();
		     filename1 = multi.getFilesystemName(file1);
		 } catch(Exception e) {
		  e.printStackTrace();
		 }
		 
		 String fullpath = realFolder + "\\" + filename1;

		 System.out.println("경로 : " +fullpath);
		 System.out.println("경로2 : " + request.getContextPath()+"/img/" + filename1);
		 String path2 = request.getContextPath()+"/img/funding/" + filename1;
		 System.out.println("filename : " + filename1);
		 
		 JSONObject jobj = new JSONObject();
			jobj.put("url", path2); 
			
			String data = jobj.toString();
			System.out.println("url : " + data);
			
			response.setContentType("application/json"); // 데이터 타입을 json으로 설정하기 위한 세팅
			response.setCharacterEncoding("UTF-8");
			
			PrintWriter out = response.getWriter();
			out.print(jobj.toJSONString());
			out.flush();
			out.close();
		/*	out.print(jobj.toJSONString());*/ 
	
	
	
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
