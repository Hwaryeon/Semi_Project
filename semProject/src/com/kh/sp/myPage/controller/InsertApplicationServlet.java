package com.kh.sp.myPage.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.sp.board.model.vo.Attachment;
import com.kh.sp.common.MyFileRenamePolicy;
import com.kh.sp.member.model.service.MemberService;
import com.kh.sp.member.model.vo.Member;
import com.kh.sp.myPage.model.service.MypageDetailService;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class InsertApplicationServlet
 */

//投資者格付け申請用の書類を提出するservlet
@WebServlet("/insert.urf")
public class InsertApplicationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public InsertApplicationServlet() { super(); }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(ServletFileUpload.isMultipartContent(request)){
			
			//転送するファイルの容量制限：　10MB
			int maxSize = 1024*1024*10;
			
			String root = request.getSession().getServletContext().getRealPath("/");
			
			String savePath = root + "updateRanking_uploadFiles\\";
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			//保存するファイルの名前を保存する arrayList
			ArrayList<String> saveFiles = new ArrayList<String>();
			//原本ファイル名を保存する arrayList
			ArrayList<String> originFiles = new ArrayList<String>();
			//ファイルが転送された名前をreturn
			Enumeration<String> files = multiRequest.getFileNames();
			
			//各ファイルの情報を入手した後,DBに保存する目的のデータを取り出す。
			while(files.hasMoreElements()) { 
				String name = files.nextElement();
				saveFiles.add(multiRequest.getFilesystemName(name));
				originFiles.add(multiRequest.getOriginalFileName(name));
			}
			int userId = Integer.parseInt(request.getParameter("userid"));
			int ptype = Integer.parseInt(request.getParameter("ptype"));
			String userEmail = request.getParameter("userEmail");
			
			ArrayList<Attachment>fileList = new ArrayList<Attachment>();
			
			for(int i=originFiles.size() -1;i>=0;i--) {
				Attachment at = new Attachment();
				
				at.setFilePath(savePath);
				at.setOriginName(originFiles.get(i));
				at.setChangeName(saveFiles.get(i));
				
				fileList.add(at);
			}
			
			int result = 0;
			result = new MypageDetailService().insertAttachment(fileList, userId, ptype);
			Member m = new MemberService().checkEmail(userEmail);
			String page = "";
			if(result > 0) {
				HttpSession session = request.getSession();
				session.setAttribute("loginUser", m);
				page = "views/myPage/mypageIndex.jsp";
				request.setAttribute("msg", "등급 변경 신청에 성공했습니다");
			} else {
				page = "views/common/errorPage.jsp";
				request.setAttribute("msg", "등급 변경 신청에 실패하였습니다.");
			}
			RequestDispatcher view = request.getRequestDispatcher(page);
			view.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
