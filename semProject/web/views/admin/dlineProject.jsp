<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset= "UTF-8">
 <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">

<title>Insert title here</title>
<style>

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
</style>
</head>
<body>
		<%@ include file="../common/headBar.jsp" %>
	
	<%@ include file="../common/sideMenu2.jsp" %>
<div id="text">
				<h2>펀딩관리 > 펀딩 마감 승인</h2><br>
				<table align="center">
				<thead>
					<tr>
						<th width="80%" colspan="7">프로젝트List</th><th width="22%"rowspan="2">승인여부</th>
					</tr>
					<tr>
						<th>프로젝트No</th><th>프로젝트 이름</th><th>업체명</th><th>목표금액</th><th>달성금액</th><th>달성률</th><th>수수료</th>
					</tr>
				</thead>
				<tr>
						<td>1</td>
						<td>세미프로젝트</td>
						<td>kh정보교육원</td>
						<td>40,000,000</td>
						<td>38,400,000</td>
						<td>96%</td>
						<td>15%</td>
						<td class="text-center"><a class='btn btn-info btn-xs' href="#"><span class="glyphicon glyphicon-edit"></span>승인</a> <a href="#" class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-remove"></span>미승인</a></td>
				</tr>
				</table>
	
	</div>

</body>
</html>