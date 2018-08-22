<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<% ArrayList<HashMap<String,Object>> list =(ArrayList<HashMap<String,Object>>)request.getAttribute("list"); %>

<!DOCTYPE html>

<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> --%>
<html>
<head>
<meta charset="UTF-8">
  
<title>투자 페이지</title>
	<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/2.0.1/TweenMax.min.js"></script> -->
<style>

	
	
	<script>
	
	(function() {
	var container;
	var current = 0;
	var max = 0;
	
	function init(){
		container = jQuery(".slide ul");
		max=container.children().length;
		events();
	}
	
	function events(){
		jQuery("button.prev").on("click",prev);
		jQuery("button.next").on("click",next);
	}
	
	
	function prev( e ){
		current--;
		if(current < 0 ) current = 0;
		animate();
	}
	function next( e ){
		current++;
		if(current > max-1) current = max-1;
		animate();
	}
	function animate(){
		var moveX = current * 600;
		TweenMax.to(container,0.8,{marginLeft:-moveX, ease:Expo.easeOut});
	}
	jQuery(document).ready(init);
})();
	</script>
	*{margin:0;padding:0;}
	body{
		background:#f5f5f5;
	}
	
	.slide{
		width:1200px;
		overflow:hidden;
		margin : 5px auto;
		position:relative;
		background:#f5f5f5;
	}
	.slide ul{
		width:4800px;
		list-style: none;
		font-size:0;
	}
	.slide ul li{
		display: inline-block;
		}
	.slide button.prev{
		border:0;
		background:none;
		width:100px;
		height:50px;
		position: absolute;
		left:70px;
		top:110px;
		}
	.slide button.next{
		border:0;
		background:none;
		position:absolute;
		width:100px;
		height:50px;
		left : 1050px;
		top:110px;
	} 
	.sort{
		margin:0 auto;
		width:100%;
		height:50px;
		background:#f5f5f5;
	}
	.sort div.box1 select{
		position:absolute;
		margin:0 auto;
		margin-top:10px;
		width:200px;
		left:76.5%;
		font-size:15pt;
	}
	.sort div.box2 select{
		position:absolute;
		margin:0 auto;
		width:200px;
		left:61.5%;
		font-size:15pt;
		margin-top:10px;
	}
	#header{
		height:120px;
		line-height:100px;
		font-size:30px;
		border-bottom:3px solid #000;
		text-align:center;
		background:white;
		}
	#footer{
		border-top:1px solid #666;
		height:70px;
		line-height:70px;
		text-align:center;
	}
	#productArea{
		width:1200px;
		height:3000px;
		margin:0 auto;
	}
	.input li{
		width:350px;
		height:350px;
		margin:10px;
		margin-right:15px;
		margin-left:15px;
		display: inline-block;
		text-align:center;
		border: 1px solid green;
	}
	.thumbnailArea {
		width:760px;
		height:550px;
		margin-left:auto;
		margin-right:auto;
	}
	.searchArea {
		width:420px;
		margin-left:auto;
		margin-right:auto;
	}
	.thumb-list {
		width:220px;
		boder:1px solid white;
		display:inline-block;
		margin:10px;
		align:center;
	}
	.thumb-list:hover {
		cursor:pointer;
		opacity:0.8;
	}
</style>
</head>
<body>
	
	
	<%@ include file="../common/headBar.jsp"%> 
	
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<div class="slide">
		<button class="prev" type="button"><img src="../images/left.png" alt=""/></button>
		<ul>
			<li><img src="../../images/coffee.png" alt=""/></li>
			<!-- <li><img src="images/summer.jpg" alt=""/></li>
			<li><img src="images/summer.jpg" alt=""/></li>
			<li><img src="images/summer.jpg" alt=""/></li> -->
		</ul>
		<button class="next" type="button"><img src="../images/right.png" alt=""/></button>
	</div>
		
	<div class="sort">
		<div class="box1">
			<select style=height:40px;>
				<option value="test1">선택1</option>
				<option value="test2">선택2</option>
				<option value="test3">선택3</option>
			</select>
		</div>
		<div class="box2">
			<select style=height:40px;>
				<option value="1">인기순</option>
				<option value="2">달성률</option>
				<option value="3">최신순</option>
			</select>
		</div>			
	</div>
<div class="productArea">
 	<br>
 	<h2 align="center">제품list</h2>
 	<button onclick="location='views/funding/product.jsp'">제품상세보기</button>
 	<button onclick="location='views/funding/project.jsp'">프로젝트 신청</button>
 	
 	<ul class="input" align="center">
 	<% for(int i = 0; i <list.size(); i++){
 			HashMap<String,Object> hmap = list.get(i);
 		%>
					<li><img src="/se1/thumbnail_uploadFiles/<%=hmap.get("changeName")%>" width="300px" height="186px"><br>그외 텍스트</li>
 		<% } %>	
 	</ul>
</div>
</body>

<!-- <footer id="footer">
	iCrowd | 사업자등록번호 : 851-87-00622 | 서울 강남 제2014-01호 | 대표자 : 김정태<br>
서울특별시 강남구 테헤란로14길 6 남도빌딩 | 1544-9970 | iCrowd_admin@icrowd.com
<hr>
Copyright(c) 2018 All Right Reserved
</footer> -->
</html>