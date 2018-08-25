<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.sp.admin.model.vo.*"%>
<!DOCTYPE html>
<%
ArrayList<SuccessFundingStatistics> list =
    (ArrayList<SuccessFundingStatistics>)request.getAttribute("list");
String num = (String)request.getAttribute("num");
%>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta charset= "UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"  href="<%=request.getContextPath()%>/css/admin/admin.css">

<style>
html {
	    margin-top: 86px;
}
body {
    background-color:#F7F7F7;
}

 .table {
    width: 90%;
    font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
    background-color:#428BCA;
    color:white;
    margin-left:auto;
    margin-right:auto;
  } 
th, td {
font-size:14px;
   text-align: center;
}
td{
    color:black;
    background-color:white;
}
select{
    color:black;
}
 
#text {
	background-color: white;
	padding: 20px;
	width: 70%;
	height: 530px;
	float: left;
	border: 1px solid #d6d6d6;
	margin-left:2%;
	margin-top:-30px;
	margin-bottom:50px;
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
	<%@ include file="../common/sideMenu.jsp" %>
	

<div id="text">
<div id="container">
   <ul class="nav nav-tabs">
				<li role="presentation" style="font-size: 14px;"><a href="<%=request.getContextPath()%>/fundingSt.adm">&nbsp;&nbsp;&nbsp;&nbsp;펀딩 개설 통계&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
				<li role="presentation" class="active" style="font-size: 14px;"><a href="#">&nbsp;&nbsp;&nbsp;&nbsp;펀딩 성공 통계&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
   </ul>
   <br>
   <table class="table table-hover">
   <thead>
   <tr>
   <th>구분</th>
   <th>마감 건수</th>
   <th>성공 건수</th>
   <th>성공 비율</th>
   <th colspan="3">마감방식별 성공 비율</th>
   </tr>
   <tr>
   <th>
   <select>
   <option id="month">월별</option>
   <option id="year">년도별</option>
   </select>
   </th>
   <th></th>
   <th></th>
   <th></th>
   <th>80%이상 성공</th>
   <th>100%달성 마감</th>
   <th>100%초과 마감</th>
   </tr>
   </thead>
   <tbody>
   <% for(SuccessFundingStatistics f : list){ %>
				<tr>
					<td><%= f.getTerm() %></td>
					<td><%= f.getEndCount() %>건</td>
					<td><%= f.getSuccessCount() %>건</td>
					<td><%= f.getSuccessRate() %>%</td>
					<td><%= f.getType1SuccessRate() %>%</td>
					<td><%= f.getType2SuccessRate() %>%</td>
					<td><%= f.getType3SuccessRate() %>%</td>
				</tr>
				<% } %>
   </tbody>
  </table>
</div>
</div>
<script>
$(function(){
	if(<%= num %>=="0"){
		$("#month").attr("selected", "selected");
	}else{
		$("#year").attr("selected", "selected");
	}
	
	$('select').change(function(){
	    if($("#year").is(':selected')) {
	    	location.href = "<%= request.getContextPath() %>/fundingSt2.adm?term=year";
	    }else if($("#month").is(':selected')){
	    	location.href = "<%= request.getContextPath() %>/fundingSt2.adm";
	    }
	});
});
</script>
<%--  <div><%@ include file="../common/footer.jsp" %></div> --%>

</body>
</html>
