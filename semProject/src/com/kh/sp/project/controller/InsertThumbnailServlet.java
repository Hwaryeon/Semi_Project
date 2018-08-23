package com.kh.sp.project.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.sp.common.MyFileRenamePolicy;
import com.kh.sp.project.model.vo.Attachment2;
import com.kh.sp.project.model.vo.Application;
import com.kh.sp.project.model.service.ProjectService;
import com.oreilly.servlet.MultipartRequest;


/**
 * Servlet implementation class InsertThumbnailServlet
 */
@WebServlet("/insert.tn")
public class InsertThumbnailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertThumbnailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 1024 * 1024 * 10;
			String root = request.getSession().getServletContext().getRealPath("/");
			
			System.out.println(root);
			
			String savePath = root + "thumbnail_uploadFiles/";
				
			System.out.println(savePath);
			/*MultipartRequest multiRequest = new MultipartRequest(request,savePath,maxSize,"UTF-8",new DefaultFileRenamePolicy());*/
			
			MultipartRequest multiRequest = new MultipartRequest(request,savePath,maxSize,"UTF-8",new MyFileRenamePolicy());
			
			ArrayList<String> saveFiles = new ArrayList<String>();
			ArrayList<String> originFiles = new ArrayList<String>();
			
			Enumeration<String> files = multiRequest.getFileNames();
			
			while(files.hasMoreElements()) {
				String name = files.nextElement();
				
				saveFiles.add(multiRequest.getFilesystemName(name));
				originFiles.add(multiRequest.getOriginalFileName(name));
			}
			
			String intro = multiRequest.getParameter("intro");
			String projectPrepare = multiRequest.getParameter("projectPrepare");
			String projectIntro = multiRequest.getParameter("projectIntro");
			String projectPlan = multiRequest.getParameter("projectPlan");
			System.out.println(intro);
			System.out.println(projectPrepare);
			System.out.println(projectIntro);
			System.out.println(projectPlan);
			System.out.println(saveFiles);
			System.out.println(originFiles);
			
			Application a = new Application();
			a.setIntro(intro);
			a.setProjectPrepare(projectPrepare);
			a.setProjectIntro(projectIntro);
			a.setProjectPlan(projectPlan);
			
			
			
			ArrayList<Attachment2> fileList = new ArrayList<Attachment2>();
			
			for(int i = originFiles.size() -1 ;i>=0;i--) {
				Attachment2 at = new Attachment2();
				at.setFilePath(savePath);
				at.setOriginName(originFiles.get(i));
				at.setChangeName(saveFiles.get(i));
				
				fileList.add(at);
			}
			
			int result = new ProjectService().insertThumbnail(a,fileList);
			
			if(result > 0) {
				System.out.println("성공");
			}else {
				for(int i = 0 ; i<saveFiles.size(); i++) {
					File failedFile = new File(savePath + saveFiles.get(i));
					
					failedFile.delete();
				}
				System.out.println("실패 다시 해봐");
				request.setAttribute("msg", "사진게시판 등록 실패!");
				request.getRequestDispatcher("views/common/errorPage.jsp");
			}
			
			
			
			
			
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
