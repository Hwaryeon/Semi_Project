package com.kh.sp.admin.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.kh.sp.admin.model.dao.AdminDao;
import com.kh.sp.admin.model.service.AdminService;
import com.kh.sp.admin.model.vo.OpenFundingStatistics;
import com.kh.sp.admin.model.vo.PageInfo;
import com.kh.sp.admin.model.vo.SalesStatistics;
import com.kh.sp.admin.model.vo.SuccessFundingStatistics;

@WebServlet("/fundingSt.adm")
public class FundingStatisticsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
    public FundingStatisticsServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<OpenFundingStatistics> list = null;
		String term = request.getParameter("term");
		
		//페이징 처리
		int currentPage;		//현재 페이지를 표시할 변수
		int limit;				//한 페이지에 게시글이 몇 개가 보여질 것인지
		int maxPage;			//전체 페이지에서 가장 마지막 페이지
		int startPage;			//한번에 표시될 페이지가 시작할 페이지
		int endPage;			//한번에 표시될 페이지가 끝나는 페이지

		//게시판은 1페이지부터 시작함
		currentPage = 1;
		// 1페이지가  아닐때
		if(request.getParameter("currentPage") != null){
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
         
		//전체 목록 갯수와 목록 전체를 리턴받음
		int listCount = new AdminService().getOpenFundingListCount(term);
		//System.out.println("listCount : " + listCount);

		//한페이지에 보여줄 갯수
		limit = 8;

		//총 페이지 수 계산
		maxPage = (int)((double)listCount / limit + 0.9);

		//현재 페이지에 보여줄 시작 페이지 수
		startPage = (((int)((double)currentPage / limit + 0.9)) -1) * limit + 1;

		//목록 아래 보여질 마지막 페이지 수
		endPage = startPage + limit - 1;

		if(maxPage < endPage){
			endPage = maxPage;
		}

		//페이지 정보를 공유할 vo객체 생성
		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
				
		if(term == null){
			list = new AdminService().selectOpenFundingList("month", currentPage, limit);
			request.setAttribute("num","0");
			request.setAttribute("pi", pi);
		}else{
			list = new AdminService().selectOpenFundingList("year", currentPage, limit);
			request.setAttribute("num","1");
			request.setAttribute("pi", pi);
		}
	    
		/*JSONArray result = new JSONArray();
		JSONObject fundingInfo = null;
		for(OpenFundingStatistics funding : list1){
			
			fundingInfo = new JSONObject();
			
			fundingInfo.put("term", funding.getTerm());
			fundingInfo.put("enrollCount", funding.getEnrollCount());
			fundingInfo.put("openCount", funding.getOpenCount());
			fundingInfo.put("approvalRate", funding.getApprovalRate());
			fundingInfo.put("type1OpenCount", funding.getType1OpenCount());
			fundingInfo.put("type2OpenCount", funding.getType2OpenCount());
			fundingInfo.put("type3OpenCount", funding.getType3OpenCount());
		
			result.add(fundingInfo);
		
		}
		
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		out.print(result.toJSONString());
		out.flush();
		out.close();*/
		for(int i = 0; i < list.size(); i++){
		System.out.println(list.get(i));
	}
	
	   
		request.setAttribute("list", list);
		request.getRequestDispatcher("views/admin/fundingStatistics.jsp").forward(request, response);
		
		//list2 = new AdminService().selectSuccessFundingList("month");
		//list2 = new AdminService().selectSuccessFundingList("year");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
