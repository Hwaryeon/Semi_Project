<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
 
 <meta charset= "UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"  href="<%=request.getContextPath()%>/css/admin/admin.css">
<style>
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
				<h2>펀딩관리 > 펀딩심사</h2><br>
				<table align="center">
				<thead>
					<tr>
						<th width="80%" colspan="3">프로젝트List</th><th width="22%"rowspan="2">승인여부</th>
					</tr>
					<tr>
						<th>No</th><th >프로젝트 이름</th><th>첨부파일</th>
					</tr>
				</thead>
				<tr>
						<td>1</td>
						<td>세미프로젝트</td>
						<td><button>파일 열람</button></td>
						<td class="text-center"><a class='btn btn-info btn-xs' href="#"><span class="glyphicon glyphicon-edit"></span>승인</a> <a href="#" class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-remove"></span>미승인</a></td>

				</tr>
				</table>
	
	</div>

</body>
</html>