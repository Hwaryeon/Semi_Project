<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.kh.sp.admin.model.vo.*"%>

<%
	ArrayList<DetailMember> dlineList = (ArrayList<DetailMember>) request.getAttribute("dlineList");
	PageInfo pi = (PageInfo) request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset= "UTF-8">
 <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="http://code.jquery.com/jquery-1.10.2.js"></script> 

<title>Insert title here</title>
<link rel="stylesheet" type="text/css"  href="<%=request.getContextPath()%>/css/admin/admin.css">
<style>
#sortBtn {
    width: 80px;
    background:#3276b1;
    color:white;
    font-size:15px;
    }
	#confirm,#confirm2,#popCloseBtn,#popCloseBtn2{
	width:100px;
	height:30px;	border:1px solid;
	background-color: #05a7e2;
	color: #fff;
	}
	
	#popupDiv,#popupDiv2 {
    top : 0px;
    position: absolute;
    background: #fff;
    width: 400px;
    height: 220px;
    display: none; 
    text-align:center;
    font-size:17pt;
    }
    
    #popup_mask,#popup_mask2 { 
        position: fixed;
        width: 100%;
        height: 1000px;
        top: 0px;
        left: 0px;
         display: none; 
         background-color:#000;
         opacity: 0.8;
    }
	
html {
	    margin-top: 86px;
}
th{
background-color:#66CDAA;
}
thead {
	background : yellow;
	}
td, th {
		text-align:center;
	}
  table {
    width: 100%;
    border: 1px solid #444444;
    border-collapse: collapse;
  }
  th, td {
    border: 1px solid #444444;
  }
  
  table tr td a {
  text-decoration : none;
	color: black;
  }
#text {
	background-color: white;
	padding: 20px;
	width: 60%;
	height: 530px;
	float: left;
	border: 2px solid;
	border-color: darkgray;
}
/* 페이징 처리 CSS부분*/
.pageArea a {
display: inline-block;
    width: 32px;
    height: 32px;
    margin: 0 2px;
    border: 1px solid #d6d6d6;
    font-size: .75em;
    line-height: 32px;
    color: #999; 
    text-align: center;
    vertical-align: top;
    cursor:pointer;
}
/* .pageArea {
    margin: 40px 0;
    text-align: center;
    margin-top: 200px;
} */
.pageArea a:hover{
          color: #999; 
       }
</style>
</head>
<body>
		<%@ include file="../common/headBar.jsp" %>
	<header class="head_banner" style="margin-bottom: 65px;">
						<div class="hero"><img src="<%=request.getContextPath()%>/images/common/admin.jpg" style="width:100%;"alt="공지사항 배경 이미지 입니다." class="img_rwd"></div>
						<div class="layer">
							<!-- <h1 class="tit_comm">Manager</h1>
							<p class="txt_comm">관리자 페이지</p> -->
						</div>
					</header>
	<%@ include file="../common/sideMenu2.jsp" %>
<div id="text">
				<h2>펀딩관리 > 펀딩 마감 승인</h2><br>
				
				<form id="dlineForm"
			action="<%=request.getContextPath()%>/dlineProject1.adm" method="get">
				
				<table align="center">
				<thead>
					<tr>
						<th width="80%" colspan="7">프로젝트List</th><th width="22%"rowspan="2">승인여부</th>
					</tr>
					<tr>
						<th>프로젝트 id</th><th>프로젝트 이름</th><th>마감날짜</th><th>업체명</th><th>목표금액</th><th>달성률</th><th>마감방식</th>
					</tr>
				</thead>
				<% for(DetailMember dm : dlineList) {%>
			<input type="hidden" id="p_Id" name="p_id">
				
				<tr>
						<td><%= dm.getP_pId() %></td>
						<td><%= dm.getP_pName() %></td>
						<td><%= dm.getTest() %></td>
						<td><%= dm.getCorporateName() %></td>
						<td><%= dm.getP_closingAmount() %></td>
						<td><%= dm.getResult() %>%</td>
						<td><%= dm.getFee()%></td>
						<td class="text-center"><a id="confirmBtn" name="yes" class=
						'btn btn-info btn-xs'><span 
						class="glyphicon glyphicon-edit"></span>승인</a> 
						<a class="btn btn-danger btn-xs" name="nob">
						<span class="glyphicon glyphicon-remove"></span>일괄환불</a></td>
				</tr>
				<% 
				}
				%>
				</table>
				</form>
		<div>
			  <%-- 페이지처리 --%>

        <div class="pageArea" id="datePaging" align="center">
			<a onclick="location.href='<%=request.getContextPath() %>/dlineSelectAll.adm?currentPage=1'" class="link_fst">
			<span class="fa fa-angle-double-left" aria-hidden="true"><<</span></a>&#160;
			<% if (currentPage <= 1) { %>
				<a disabled class="link_prev"><</a>&#160;
			<% } else { %>
				<a onclick="location.href='<%=request.getContextPath() %>/dlineSelectAll.adm?currentPage=<%=currentPage -1 %>'" class="link_prev"><</a>&#160;
			<% } %>
			
			<% for(int p = startPage;p<= endPage;p++) { 
					if(p==currentPage) { %>
						<a disabled class="link_page" style="background:lightgray;"><%= p %></a>
			<% 		} else { %>
						<a onclick="location.href='<%=request.getContextPath()%>/dlineSelectAll.adm?currentPage=<%=p %>'" class="link_page"><%= p %></a>
			<%  	} %>
			<% } %>
			
			<% if(currentPage >= maxPage) { %>
				&#160;<a disabled class="link_next">></a>&#160;
			<% } else { %>
				&#160;<a onclick="location.href='<%=request.getContextPath()%>/dlineSelectAll.adm?currentPage=<%=currentPage + 1%>'" class="link_next">></a>&#160;
			<% } %>
			<a onclick="location.href='<%=request.getContextPath()%>/dlineSelectAll.adm?currentPage=<%=maxPage%>'" class="link_lst">>></a>
		</div>
        
        
			
		<form id="dlineForm2"
			action="<%=request.getContextPath()%>/dlineProject2.adm" method="get">
			<input type="hidden" id="p_Id2" name="p_id2">

</form>
	<div id ="popup_mask" ></div>
    
    <div id="popupDiv">
    	
    	<br><p><br>승인 처리하시겠습니까?<br></p>
    	<hr>
    	<br>
    	<button id="confirm">승인</button>
        <button id="popCloseBtn">취소</button>
    </div>
        
        <div id ="popup_mask2" ></div>
    
    <div id="popupDiv2">
    	
    	<br><p><br>환불 처리하시겠습니까?<br></p>
    	<hr>
    	<br>
    	<button id="confirm2">환불</button>
        <button id="popCloseBtn2">취소</button>
    </div>
        
    
    <script>
    
    $(document).ready(function(){
    	var p_id = null;
        $("[name=yes]").click(function(event){   
        	p_id = $(this).parent().parent().children().eq(0).text();
             $("#popupDiv").css({
                "top": (($(window).height()-$("#popupDiv").outerHeight())/2+$(window).scrollTop())+"px",
                "left": (($(window).width()-$("#popupDiv").outerWidth())/2+$(window).scrollLeft())+"px",
            	
             }); 
            
            $("#popup_mask").css("display","block"); 
            $("#popupDiv").css("display","block"); 
            
            $("body").css("overflow","hidden");
        });
        
        $("#popCloseBtn").click(function(event){
            $("#popup_mask").css("display","none"); 
            $("#popupDiv").css("display","none"); 
            $("body").css("overflow","auto");
        });
        
		    
		    	$("#confirm").click(function(){
		  		 	$("#p_Id").val(p_id); 

					console.log("p_id : " +p_id); 
					$("#dlineForm").submit(); 

		
		    	});
		    	 $("[name=nob]").click(function(event){   
		  			
		    		 p_id = $(this).parent().parent().children().eq(0).text();

		              $("#popupDiv2").css({
		                 "top": (($(window).height()-$("#popupDiv2").outerHeight())/2+$(window).scrollTop())+"px",
		                 "left": (($(window).width()-$("#popupDiv2").outerWidth())/2+$(window).scrollLeft())+"px",
		             	
		              }); 
		             
		             $("#popup_mask2").css("display","block"); 
		             $("#popupDiv2").css("display","block"); 
		             
		             $("body2").css("overflow","hidden");
		         });
		         $("#popCloseBtn2").click(function(event){
		             $("#popup_mask2").css("display","none"); 
		             $("#popupDiv2").css("display","none"); 
		             $("body2").css("overflow","auto");
		         });
		         
		 		    
		 		    	$("#confirm2").click(function(){
				  		 	$("#p_Id2").val(p_id); 

		 					console.log("p_id : " +p_id); 
		 					$("#dlineForm2").submit(); 

		 				 
		 		
		     });
    });
    
 
    </script>
	

</body>
</html>