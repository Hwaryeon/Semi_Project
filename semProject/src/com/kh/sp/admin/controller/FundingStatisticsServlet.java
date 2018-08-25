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

import com.kh.sp.admin.model.service.AdminService;
import com.kh.sp.admin.model.vo.OpenFundingStatistics;
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
		if(term == null){
			list = new AdminService().selectOpenFundingList("month");
			request.setAttribute("num","0");
		}else{
			list = new AdminService().selectOpenFundingList("year");
			request.setAttribute("num","1");
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
		
	 
		request.setAttribute("list", list);
		request.getRequestDispatcher("views/admin/fundingStatistics.jsp").forward(request, response);
		/*for(int i = 0; i < list1.size(); i++){
			System.out.println(list1.get(i));
		}*/
		
		//list2 = new AdminService().selectSuccessFundingList("month");
		//list2 = new AdminService().selectSuccessFundingList("year");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
