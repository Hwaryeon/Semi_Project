package com.kh.sp.board.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.sp.board.model.service.BoardService;
import com.kh.sp.board.model.vo.Attachment;
import com.kh.sp.board.model.vo.Board;
import com.kh.sp.common.MyFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;

@WebServlet("/updateBoard")
public class UpdateBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateBoardServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println("업데이트 보드 호출");
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		
		if(ServletFileUpload.isMultipartContent(request)){
			int maxSize = 1024 * 1024 * 10;
			String root = request.getSession().getServletContext().getRealPath("/");
			String savePath = root + "board_uploadFiles/";
			MultipartRequest multiRequest 
			= new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			
		
			String updateText = multiRequest.getParameter("updateText");
			System.out.println("text : " + updateText);
			
			String title = multiRequest.getParameter("noticeTitle");	// 글제목
			String text = multiRequest.getParameter("mainText");	// 글내용
			int count = Integer.parseInt(request.getParameter("count"));
			
			int uId = 001;		// 작성자 아이디
			int wNo = Integer.parseInt(multiRequest.getParameter("wNo"));
			
			int deleteResult = new BoardService().deleteAtt(wNo);
			
			if(deleteResult > 0){
				System.out.println("첨부파일 삭제 완료");
			}else{
				System.out.println("첨부파일 삭제 실패");
			}

			String noticeYn = multiRequest.getParameter("viewType");	// 공지사항여부
			String noticeType = multiRequest.getParameter("classify");	// 글타입
			
			ArrayList<String> saveFiles = new ArrayList<String>();
			ArrayList<String> originFiles = new ArrayList<String>();
			Enumeration<String> files = multiRequest.getFileNames();
			
			System.out.println("files : " + files);
			
			while(files.hasMoreElements()){
				
				if(count == 3){
					break;
				}
				
				String name = files.nextElement();
				System.out.println("name : " +name);
			
				if(!name.equals("files")){
				
					saveFiles.add(multiRequest.getFilesystemName(name));
					originFiles.add(multiRequest.getOriginalFileName(name));
					
				}
			}
		
			Board board = new Board(wNo, title, text, uId, noticeYn, noticeType);
		
			int result = new BoardService().updateBoard(board);
		
			ArrayList<Attachment> fileList = new ArrayList<Attachment>();
			
			for(int i=originFiles.size() -1; i >=0; i--){
				Attachment at = new Attachment();
				
				at.setFilePath(savePath);
				at.setOriginName(originFiles.get(i));
				at.setChangeName(saveFiles.get(i));
				
				System.out.println("filepath : " + at.getFilePath());
				System.out.println("oriFiles : " + at.getOriginName());
				System.out.println("saveFiles : " + at.getChangeName());
				
				if(at.getOriginName() != null){
					fileList.add(at);
				}
			}
			
			result = new BoardService().updateAttachment(wNo, fileList, count, uId);
			
			if(result > 0){
				response.sendRedirect("/sp/allBoard");
				
			}else{
				String page = "views/common/errorPage.jsp";
				request.setAttribute("msg", "공지사항 수정 실패");
				

				RequestDispatcher view = request.getRequestDispatcher(page);
				view.forward(request, response);
			}
			
			
			
		}
		
		
		
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
