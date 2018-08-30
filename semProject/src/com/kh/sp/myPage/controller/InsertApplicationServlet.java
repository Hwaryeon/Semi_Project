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
@WebServlet("/insert.urf")
public class InsertApplicationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public InsertApplicationServlet() { super(); }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(ServletFileUpload.isMultipartContent(request)){
			//System.out.println("이것은 멀티파트콘텐츠다");
			//전송 파일에 대한 용량 제한 : 10MB
			int maxSize = 1024*1024*10;
			
			String root = request.getSession().getServletContext().getRealPath("/");
			//System.out.println("경로 : " + root);
			String savePath = root + "updateRanking_uploadFiles\\";
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			//저장할 파일의 이름을 저장할 arrayList
			ArrayList<String> saveFiles = new ArrayList<String>();
			//원본파일 이름 저장할 arrayList
			ArrayList<String> originFiles = new ArrayList<String>();
			//파일이 전송된 이름을 반환
			Enumeration<String> files = multiRequest.getFileNames();
			
			//각 파일의 정보를 구해온 후 DB에 저장할 목적의 데이터를 꺼내준다.
			while(files.hasMoreElements()) { 
				String name = files.nextElement();
				
				saveFiles.add(multiRequest.getFilesystemName(name));
				originFiles.add(multiRequest.getOriginalFileName(name));
			}
			//String userId = request.getParameter("userid");
			//String ptype = request.getParameter("ptype");
			int userId = Integer.parseInt(request.getParameter("userid"));
			int ptype = Integer.parseInt(request.getParameter("ptype"));
			String userEmail = request.getParameter("userEmail");
			System.out.println("UserId : " + userId);
			System.out.println("ptype : " + ptype);
			System.out.println("userEmail : " + userEmail);
			
			//Member m = new Member();
			//m.setUserId(userId);
			
			ArrayList<Attachment>fileList = new ArrayList<Attachment>();
			
			for(int i=originFiles.size() -1;i>=0;i--) {
				Attachment at = new Attachment();
				
				at.setFilePath(savePath);
				at.setOriginName(originFiles.get(i));
				at.setChangeName(saveFiles.get(i));
				
				System.out.println("filepath : " + at.getFilePath());
				System.out.println("originFiles : " + at.getOriginName());
				System.out.println("saveFiles : " + at.getChangeName());
				
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

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
