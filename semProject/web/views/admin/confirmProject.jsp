<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.kh.sp.admin.model.vo.*"%>
<%
	ArrayList<DetailMember> confirmList = (ArrayList<DetailMember>) request.getAttribute("confirmList");
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
 <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
 
 <meta charset= "UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"  href="<%=request.getContextPath()%>/css/admin/admin.css">
    <script src="http://code.jquery.com/jquery-1.10.2.js"></script> 

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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

th{
background-color:#66CDAA;
}
thead {
	background : yellow;
	}

  table {
    width: 100%;
    border: 1px solid #444444;
    border-collapse: collapse;
  }
  th, td {
    border: 1px solid #444444;
    		text-align:center;
    
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
</style>
</head>
<header class="head_banner" style="margin-bottom: 65px;">
						<div class="hero"><img src="<%=request.getContextPath()%>/images/common/admin.jpg" style="width:100%;"alt="공지사항 배경 이미지 입니다." class="img_rwd"></div>
						<div class="layer">
							<!-- <h1 class="tit_comm">Manager</h1>
							<p class="txt_comm">관리자 페이지</p> -->
						</div>
					</header>
<body>
	<%@ include file="../common/headBar.jsp" %>
	
	<%@ include file="../common/sideMenu2.jsp" %>
<div id="text">
				<form class="form-horizontal" id="pFile"action="<%=request.getContextPath() %>/pFileDown" method="post">
				
				
				<!-- 여기안에 반복문으로 프로젝트 리스트 가져와야함 -->
				<h2>펀딩관리 > 펀딩심사</h2><br>
				<table align="center">
				<thead>
					<tr>
						<th width="80%" colspan="3">프로젝트List</th><th width="22%"rowspan="2">승인여부</th>
					</tr>
					<tr>
						<th>사업자 ID</th><th>사업자 이름</th><th>프로젝트 ID</th><th>프로젝트 이름</th><th>첨부파일</th>
					</tr>
				</thead>
				<%for (DetailMember dm : confirmList) {%>
				<input type="hidden" id="userId" name="user_id">
				<tr>
						<td><%= dm.getUserId() %></td>
						<td><%= dm.getUserName() %></td>
						<td><%= dm.getP_pId() %></td>
						<td><%= dm.getP_pName() %></td>
						<td><button class="downBtn">파일 열람</button></td>
						<td class="text-center"><a class='btn btn-info btn-xs'name="yes"><span 
						class="glyphicon glyphicon-edit"></span>승인</a><a href="#" 
						class="btn btn-danger btn-xs" name="nob"><span
						 class="glyphicon glyphicon-remove"></span>미승인</a></td>

				</tr>
				<%
				}
				%>
				}
				</table>
				
				<!-- 여기까지 -->
				
				
				<input type="hidden" id="projectId" name="projectId" value="">
				</form>
	
	</div>
	<script>
	$('.downBtn').click(function(){
		var checkBtn = $(this);
		var tr = checkBtn.parent().parent();
		var td = tr.children();
		
		var no = td.eq(0).text();
		
		console.log(no);
		
		document.getElementById('projectId').value=no;
		
		
	
	
	});
	
	</script>

</body>
</html>