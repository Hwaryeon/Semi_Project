package com.kh.sp.board.controller;

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

import com.kh.sp.board.model.service.BoardService;
import com.kh.sp.board.model.vo.Attachment;
import com.kh.sp.board.model.vo.Board;
import com.kh.sp.common.MyFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;

@WebServlet("/write")
public class WriteBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public WriteBoardServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println("write 호출됨");

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		
		if(ServletFileUpload.isMultipartContent(request)){
			
			
			int maxSize = 1024 * 1024 * 10;
			
			String root = request.getSession().getServletContext().getRealPath("/");
			
			String savePath = root + "board_uploadFiles/";
			
			MultipartRequest multiRequest 
			= new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			String title = multiRequest.getParameter("noticeTitle");	// 글제목
			String text = multiRequest.getParameter("mainText");	// 글내용
			int count = Integer.parseInt(multiRequest.getParameter("count"));
			
			System.out.println("text : " + text);
			System.out.println("count : " + count);
			
			int uId = 001;		// 작성자 아이디
			
			String noticeYn = multiRequest.getParameter("viewType");	// 공지사항여부
			String noticeType = multiRequest.getParameter("classify");	// 글타입
			
			//다중 파일을 묶어서 업로드 하기 위해 컬렉션을 생성한다
			//저장한 파일의 이름을 저장할 arrayList를 생성한다
			ArrayList<String> saveFiles = new ArrayList<String>();
			
			//원본파일의 이름을 저장할 arrayList를 생성한다.
			ArrayList<String> originFiles = new ArrayList<String>();
			
			//파일이 전송된 이름을 반환한다.
			Enumeration<String> files = multiRequest.getFileNames();
			
			while(files.hasMoreElements()){
				
				if(count == 3){
					break;
				}
				
				String name = files.nextElement();
			
				if(!name.equals("files")){
				
					//원래 파일이름을 넣어야지 바뀐 이름을 알 수 있다.
					saveFiles.add(multiRequest.getFilesystemName(name));
					originFiles.add(multiRequest.getOriginalFileName(name));
					
					System.out.println("반복!");
					System.out.println("originFiles : " + name);
				}
			}

			
			Board board = new Board(title, text, uId, noticeYn, noticeType);
			
			
			//Attachment객체 생성해서 arrayList객체 생성
			ArrayList<Attachment> fileList = new ArrayList<Attachment>();
			//전송순서 역순으로 파일이 list에 저장되기 때문에 반복문을 역으로 수행
			
			System.out.println("originFiles Size : " + originFiles.size());
			
			for(int i=originFiles.size() -1; i >=0; i--){
				Attachment at = new Attachment();
				
				at.setFilePath(savePath);
				at.setOriginName(originFiles.get(i));
				at.setChangeName(saveFiles.get(i));
				
				System.out.println("filepath : " + at.getFilePath());
				System.out.println("oriFiles : " + at.getOriginName());
				System.out.println("saveFiles : " + at.getChangeName());
				
				fileList.add(at);
				
			}
			
			int result = 0;
			//Service로 전송
				result = new BoardService().insertAttachment(board, fileList, count, uId);
			
			if(result >0){
				response.sendRedirect("/sp/allBoard");
			}else{
				//실패시 저장된 사진 삭제
				for(int i=0; i < saveFiles.size(); i++){
					//파일시스템 에 저장된 이름으로 파일 객체 생성함
					File failedFile = new File(savePath + saveFiles.get(i));
					failedFile.delete();
				}
				
				//에러페이지로 forward
				request.setAttribute("msg", "공지사항 등록 실패!");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
				
			}
			
			
		}
		
		
		
		


		/*Board board = new Board(title, text, uId, noticeYn, noticeType);*/

	/*	new BoardService().insertBoard(board);

        
        response.sendRedirect("/sp/allBoard");*/


	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
