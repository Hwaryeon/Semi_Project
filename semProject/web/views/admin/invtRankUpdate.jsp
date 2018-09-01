<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*, com.kh.sp.member.model.vo.*, 
	com.kh.sp.admin.model.vo.*"%>
<%
	ArrayList<Member> rankList = (ArrayList<Member>) request.getAttribute("rankList");
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
    <script src="http://code.jquery.com/jquery-1.10.2.js"></script> 

<meta charset="UTF-8">
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/admin/admin.css">

<style>


	

	
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

.modal {
	text-align: center;
}

@media screen and (min-width: 768px) {
	.modal:before {
		display: inline-block;
		vertical-align: middle;
		content: " ";
		height: 100%;
	}
}

.modal-dialog {
	display: inline-block;
	text-align: left;
	vertical-align: middle;
}

th {
	background-color: #66CDAA;
}

thead {
	background-color: #66CDAA;
}

table {
	width: 100%;
	border: 1px solid #444444;
	border-collapse: collapse;
}

th, td {
	border: 1px solid #444444;
	text-align: center;
}

table tr td a {
	text-decoration: none;
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
</style>
</head>
<body>
	<%@ include file="../common/headBar.jsp"%>
	<header class="head_banner" style="margin-bottom: 65px;">
		<div class="hero">
			<img src="<%=request.getContextPath()%>/images/common/admin.jpg"
				style="width: 100%;" alt="공지사항 배경 이미지 입니다." class="img_rwd">
		</div>
		<div class="layer">
			<!-- <h1 class="tit_comm">Manager</h1>
							<p class="txt_comm">관리자 페이지</p> -->
		</div>
	</header>
	<%@ include file="../common/sideMenu2.jsp"%>
	<div id="text">
		<h2>회원관리 > 투자자 등급 심사</h2>
		<br>

		<form id="updateRankForm"
			action="<%=request.getContextPath()%>/updateInvRank.adm" method="get">

			<table align="center">
				<thead>
					<tr>
						<th width="80%" colspan="5">투자자List</th>
						<th width="22%" rowspan="2">승인여부</th>
					</tr>
					<tr>
						<th>투자자ID</th>
						<th>이름</th>
						<th>현재 등급</th>
						<th>변경 요청한 등급</th>
						<th>증빙서류</th>
					</tr>
				</thead>
				<%for (Member m : rankList) {%>
					<input type="hidden" id="userId" name="user_id">
				<tr>
					<td><%= m.getUserId() %></td>
					<td><%= m.getUserName() %></td>
					<td><%= m.getInvestorGrade() %></td>
					<td></td>
					<td><button>파일 열람</button></td>
					<!-- data-target="#myModal"
						onClick="updateRank();" data-toggle="modal" href="#" -->
					<td><a id="confirmBtn"  class='btn btn-info btn-xs' name="yes"><span
							class="glyphicon glyphicon-edit"></span>승인</a> <a 
						class="btn btn-danger btn-xs" name="nob"><span
							class="glyphicon glyphicon-remove"></span>미승인</a></td>
				</tr>
				
				<%
							}
						%>
			</table>
	</form>

	
			<div>
				<%-- 페이지처리 --%>
				<div class="pageArea" align="center">
					<button
						onclick="location.href='<%=request.getContextPath()%>/selectAllRank.adm.adm?currentPage=1'"><<</button>
					<%
							if (currentPage <= 1) {
						%>
					<button disabled><</button>
					<%
							} else {
						%>
					<button
						onclick="location.href='<%=request.getContextPath()%>/selectAllRank.adm.adm?currentPage=<%=currentPage - 1%>'"><</button>
					<%
							}
						%>
					<%
							for (int p = startPage; p <= endPage; p++) {
								if (p == currentPage) {
						%>
					<button disabled><%=p%></button>
					<%
							} else {
						%>
					<button
						onclick="location.href='<%=request.getContextPath()%>/selectAllRank.adm?currentPage=<%=p%>'"><%=p%></button>
					<%
							}
						%>

					<%
							}
						%>

					<%
							if (currentPage >= maxPage) {
						%>
					<button disabled>></button>
					<%
							} else {
						%>
					<button
						onclick="location.href='<%=request.getContextPath()%>/selectAllRank.adm?currentPage=<%=currentPage + 1%>'">></button>
					<%
							}
						%>
					<button
						onclick="location.href='<%=request.getContextPath()%>/selectAllRank.adm?currentPage=<%=maxPage%>'">>></button>

				</div>
			</div>
	</div>
	</div>
		<form id="updateRankForm2"
			action="<%=request.getContextPath()%>/updateRank2.adm" method="get">
					<input type="hidden" id="userId2" name="user_id2" >

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
    	
    	<br><p><br>미승인 처리하시겠습니까?<br></p>
    	<hr>
    	<br>
    	<button id="confirm2">미승인</button>
        <button id="popCloseBtn2">취소</button>
    </div>
        
    
    <script>
    
    $(document).ready(function(){
    	var id = null;
        $("[name=yes]").click(function(event){   
			id = $(this).parent().parent().children().eq(0).text();
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
		  		 	$("#userId").val(id); 

					console.log("id : " +id); 
					$("#updateRankForm").submit(); 

		
		    	});
		    	 $("[name=nob]").click(function(event){   
		  			
			 			id = $(this).parent().parent().children().eq(0).text();

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
				  		 	$("#userId2").val(id); 

		 					console.log("id : " +id); 
		 					$("#updateRankForm2").submit(); 

		 				 
		 		
		     });
    });
    
 
    </script>
	

</body>

</html>