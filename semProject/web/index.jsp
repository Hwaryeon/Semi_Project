<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.sp.board.model.vo.*, com.kh.sp.funding.model.vo.*"%>
<%
ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
ArrayList<Product> newFList = (ArrayList<Product>)request.getAttribute("newFList");
ArrayList<Product> mainFList = (ArrayList<Product>)request.getAttribute("mainFList");
ArrayList<Product> hotFList = (ArrayList<Product>)request.getAttribute("hotFList");
ArrayList<Product> closeFList = (ArrayList<Product>)request.getAttribute("closeFList");
%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main Page</title> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link href="https://fonts.googleapis.com/css?family=Sunflower:300" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Limelight|Sunflower:300" rel="stylesheet">
<script src="<%=request.getContextPath()%>/js/common/jquery.vticker-min.js"></script>
  
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon" rel="stylesheet">

<<<<<<< HEAD
<script>
=======

<script >
>>>>>>> refs/remotes/origin/sojin
$(function(){
	$('#news-container').vTicker({ 
		speed: 500,
		pause: 3000,
		animation: 'fade',
		mousePause: false,
		showItems: 1
	});
        $('#news-container1').vTicker({
		speed: 700,
		pause: 4000,
		animation: 'fade',
		mousePause: false,
		showItems: 1
	});
});
</script>


<style>

@import url(//fonts.googleapis.com/earlyaccess/nanumpenscript.css);

#messageArea{
	position: fixed;
    bottom: 0%;
    right: 3%;
    background: #89cc84;
    width: 200px;
    text-align: center;
    height: 35px;
    padding-top: 5px;
    border-radius: 9px;
    cursor:pointer;
}
#messageArea a{
	color:#f7dfdf;
}



</style>

</head>
<body >
<%@ include file="/views/common/headBar.jsp" %>
	 <div class="wrap" style=" background:#f8f8f8; margin-top:50px;">
		<div class="containerBox" style="width: 100%;">



			<div class="container" style="width:100%; min-width:1000px;">
				<div id="myCarousel" class="carousel slide" data-ride="carousel">
					<ol class="carousel-indicators">
						<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
						<li data-target="#myCarousel" data-slide-to="1"></li>
					</ol>

					<div class="carousel-inner">

						<div class="item active">
							<div class="text-box">
					
					<h4 id="test1" >
					이곳은 펀딩 설명하는 부분<br>
					<label style="font-size:15px;">펀딩이랑 관련없지만 배너사진을 못구해서 넣어봄</label>
					</h4>
			</div>
							<img src="images/main/banner1.jpg" alt="main1" style="width: 100%; height:380px; ">
						</div>

						 <div class="item">
							<div class="text-box">
				<h4 id="test1" >
					이것도 마찬가지<br>
					<label style="font-size:15px;">아무 사진이나 넣어봄</label>
					</h4>
			</div>
							<img src="images/main/banner3.jpg" alt="main2" style="width: 100%; height:380px;">
						</div> 

					</div>

					<a class="left carousel-control" href="#myCarousel"
						data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left"></span> <span
						class="sr-only">Previous</span>
					</a> <a class="right carousel-control" href="#myCarousel"
						data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right"></span> <span
						class="sr-only">Next</span>
					</a>
				</div>
			</div>
		</div>

					



		<div class="containerBox"
			style="width: 100%; height: 400px; /* background: white; */ margin-top: 3%;">
			<div class="text-box2" >

					<div class="title_box">
				<strong> <span
					style="font-size: 30px; font-family: 'Do Hyeon', sans-serif;">
						<em class="title_line">주요 소식</em><br>
				</span>
				</strong> 
					</div>
			
			  <div class="funding_area1" >
			
				<%int k=0; %>
				<% for(Product p : mainFList) { %>
				<% if(k == 0){ %>
				<div class="funding_p" style="margin-left: 72px;">
				<% }else{ %>
						<div class="funding_p">
					
					<% } %>
					<% k++; %>
					<div class="fPic">
					<em class="picks-img">
					<span class="scale" >
					<!-- <img src="images/main/h1_2.jpg" style="width: 100%; height:229px;"> -->
					<img src="<%=request.getContextPath()%>/board_uploadFiles/<%=p.getChange_name() %>" style="width: 100%; height:229px;">
					</span>
					</em>
					<div class="progressbar-wrap">
                                   <dl>
                                       <dt><span style="width:<% if(p.getTotal_amount() * 100 / Integer.parseInt(p.getcAmount()) < 100){ %>
                                       <%= p.getTotal_amount() * 100 / Integer.parseInt(p.getcAmount()) %><% }else{%>100<% } %>%"></span></dt>
                                       <dd>
                                           <span class="percent"><%= p.getTotal_amount() * 100 / Integer.parseInt(p.getcAmount()) %>%</span>
                                           <%String str = String.format("%,d", p.getTotal_amount()); %>
                                           <span class="amount"><%=str %>원 달성</span>
                                           
                                           	
                                           	<span class="days"><%=p.getOpenDate() %>일 남음</span>
                                           
                                       </dd>
                                   </dl>
                                </div>
					</div> 
					
					 <div class="fCon" style="background:#a7d7ec;">
						<p class="category"><em>마감임박</em><em class="type" >투자</em></p>
						<p class="title"><%= p.getP_name() %>
						<p class="pText"><%= p.getCorporate_name()%></p>
						<% if(p.getP_code().equals("1") ) { %>
							<p class="badge">※80%이상 리워드</p>
						<% }else if(p.getP_code().equals("2")){ %>
							<p class="badge">※100%시 마감 및 리워드</p>
						<% }else{ %>
							<p class="badge">※100%이상 리워드</p>
						<% } %>
					</div>
				</div>
				
				
				<% } %> 
				
<<<<<<< HEAD
			 	<div class="funding_p">
					<div class="fPic" style="height:330px;">
					<em class="picks-img">
					<span class="scale" >
					<img src="images/main/event.jpg" style="width: 100%; height:330px;">
					</span>
					</em>
					</div>
					<div class="fCon" style="height:170px; background:#c5e4c6; /* padding: 33px 20px; */">
						<p class="title" id="fTitle">구매후기쓰고<br>선물 받으세요!</p>
						<p class="text" id="fText">이미 지난 이벤트지만 <br> 노출/SNS 광고 혜택 받으세요!</p>
					</div>
				</div> 
				
			 </div>
=======
			</div>
>>>>>>> refs/remotes/origin/sojin
			
			</div>
		</div>

	<br>

			<div class="containerBox"
			style="width: 100%; height: 400px; /* background: white; */ margin-top: 15%;">
			<div class="text-box2" style="margin-top: 30px;">
				<div class="title_box" >
				<strong> <span
					style="font-size: 30px; font-family: 'Do Hyeon', sans-serif;"><em class="title_line">인기있는 프로젝트</em><br>
				</span>
				</strong> 
				</div>
				
			<div class="funding_area1" >
				<!-- new 펀딩 상품  시작 -->
				<% int j = 0; %>
				<% for(Product p : hotFList) { %>
					<% if(j == 0){ %>
						<div class="funding_p2" style="margin-left: 72px;">
					<% }else{ %>
						<div class="funding_p2">
					
					<% } %>
					<% j++; %>
					<div class="fPic2">
					<em class="picks-img">
					<span class="scale" >
				 <img src="images/main/h1_3.jpg" style="width: 100%; height:225px;">
					
					<img src="<%=request.getContextPath()%>/board_uploadFiles/<%=p.getChange_name() %>" style="width: 100%; height:225px;">
					
					</span>
					</em>
					<div class="progressbar-wrap">
                                   <dl>
                                       <dt><span style="width:<% if(p.getTotal_amount() * 100 / Integer.parseInt(p.getcAmount()) < 100){ %>
                                       <%= p.getTotal_amount() * 100 / Integer.parseInt(p.getcAmount()) %><% }else{%>100<% } %>%"></span></dt>
                                                                              <dd>
                                           <span class="percent">
                                           
                                           
                                           <%= p.getTotal_amount() * 100 / Integer.parseInt(p.getcAmount()) %>%
                                            </span>
                                            <%String str = String.format("%,d", p.getTotal_amount()); %>
                                           <span class="amount"><%=str %>원 달성</span>
                                           
                                           <%=p.getTotal_amount() %>	
                                           	<span class="days"><%=p.getOpenDate() %>일 남음</span>
                                           
                                       </dd>
                                   </dl>
                                </div>
					</div>
					<div class="fCon2" style="background:#a7d7ec;">
						<p class="title" ><%= p.getP_name() %></p>
						<p class="pText"><%= p.getCorporate_name()%></p>
						
						<% if(p.getP_code().equals("1") ) { %>
							<p class="badge">※80%이상 리워드</p>
						<% }else if(p.getP_code().equals("2")){ %>
							<p class="badge">※100%시 마감 및 리워드</p>
						<% }else{ %>
							<p class="badge">※100%이상 리워드</p>
						<% } %>
					</div>
				</div>
				<% } %>
			</div>
			
			
			
			
			</div>
			
			
			</div>
		</div>
		
		<div class="containerBox"
			style="width: 100%; height: 400px; /* background: white; */ margin-top: 10%;">
			<div class="text-box2" style="margin-top: 30px;">
				<div class="title_box">
				<strong> <span
					style="font-size: 30px; font-family: 'Do Hyeon', sans-serif;"><em class="title_line">신규 오픈 프로젝트</em><br>
				</span>
				</strong> 
				</div>
				
				
			<div class="funding_area1" >
				<!-- new 펀딩 상품  시작 -->
				<% int i = 0; %>
				<% for(Product p : newFList) { %>
					<% if(i == 0){ %>
						<div class="funding_p2" style="margin-left: 72px;">
					<% }else{ %>
						<div class="funding_p2">
					
					<% } %>
					<% i++; %>
					<div class="fPic2">
					<em class="picks-img">
					<span class="scale" >
					<!-- <img src="images/main/h1_3.jpg" style="width: 100%; height:225px;"> -->
					
					<img src="<%=request.getContextPath()%>/board_uploadFiles/<%=p.getChange_name() %>" style="width: 100%; height:225px;">
					
					</span>
					</em>
					<div class="progressbar-wrap">
                                   <dl>
                                       <dt><span style="width:<% if(p.getTotal_amount() * 100 / Integer.parseInt(p.getcAmount()) < 100){ %>
                                       <%= p.getTotal_amount() * 100 / Integer.parseInt(p.getcAmount()) %><% }else{%>100<% } %>%"></span></dt>
                                       <dd>
                                           <span class="percent">
                                           
                                           
                                           <%= p.getTotal_amount() * 100 / Integer.parseInt(p.getcAmount()) %>%
                                            </span>
                                            <%String str = String.format("%,d", p.getTotal_amount()); %>
                                           <span class="amount"><%=str %>원 달성</span>
                                           
                                           <%=p.getTotal_amount() %>	
                                           	<span class="days"><%=p.getOpenDate() %>일 남음</span>
                                           
                                       </dd>
                                   </dl>
                                </div>
					</div>
					<div class="fCon2" style="background:#ccf2c9;">
						<p class="title" ><%= p.getP_name() %></p>
						<p class="pText"><%= p.getCorporate_name()%></p>
						
						<% if(p.getP_code().equals("1") ) { %>
							<p class="badge">※80%이상 리워드</p>
						<% }else if(p.getP_code().equals("2")){ %>
							<p class="badge">※100%시 마감 및 리워드</p>
						<% }else{ %>
							<p class="badge">※100%이상 리워드</p>
						<% } %>
					</div>
				</div>
				<% } %>
			</div>
			
			
			
			
			</div>
		</div>
		
		<div class="containerBox"
			style="width: 100%; height: 400px; /* background: white; */ margin-top: 11%;">
			<div class="text-box2" >
				<div class="title_box">
				<strong> <span
					style="font-size: 30px; font-family: 'Do Hyeon', sans-serif;"><em class="title_line">마감 직전 프로젝트</em><br>
				</span>
				</strong> 
				</div>
			<div class="funding_area1" >
				<!-- new 펀딩 상품  시작 -->
				<% int m = 0; %>
				<% for(Product p : closeFList) { %>
					<% if(m == 0){ %>
						<div class="funding_p2" style="margin-left: 72px;">
					<% }else{ %>
						<div class="funding_p2">
					
					<% } %>
					<% m++; %>
					<div class="fPic2">
					<em class="picks-img">
					<span class="scale" >
					
					<img src="<%=request.getContextPath()%>/board_uploadFiles/<%=p.getChange_name() %>" style="width: 100%; height:225px;">
					</span>
					</em>
					<div class="progressbar-wrap">
                                   <dl>
                                       <dt><span style="width:<% if(p.getTotal_amount() * 100 / Integer.parseInt(p.getcAmount()) < 100){ %>
                                       <%= p.getTotal_amount() * 100 / Integer.parseInt(p.getcAmount()) %><% }else{%>100<% } %>%"></span></dt>
                                       <dd>
                                           <span class="percent">
                                           
                                           
                                           <%= p.getTotal_amount() * 100 / Integer.parseInt(p.getcAmount()) %>%
                                            </span>
                                            <%String str = String.format("%,d", p.getTotal_amount()); %>
                                           <span class="amount"><%=str %>원 달성</span>
                                           
                                           <%=p.getTotal_amount() %>	
                                           	<span class="days"><%=p.getOpenDate() %>일 남음</span>
                                           
                                       </dd>
                                   </dl>
                                </div>
					</div>
					<div class="fCon2" style="background:#c7c1c1;">
						<p class="title" ><%= p.getP_name() %></p>
						<p class="pText"><%= p.getCorporate_name()%></p>
						
						<% if(p.getP_code().equals("1") ) { %>
							<p class="badge">※80%이상 리워드</p>
						<% }else if(p.getP_code().equals("2")){ %>
							<p class="badge">※100%시 마감 및 리워드</p>
						<% }else{ %>
							<p class="badge">※100%이상 리워드</p>
						<% } %>
					</div>
				</div>
				<% } %>
			</div>
			
			
			
			
			</div>
			
			</div>
		</div>
		
		<div id="main-notice">
		        <div id="news-container1" style="width:150px;
		        	margin-left:auto;margin-right:auto; float:left; margin-top: 21px;">
					<ul>
					<li style="font-size:18px;">공지 사항 </li>
					<li style="font-size:18px;">클릭 해보세요</li>
					<!-- <li>News content3</li>
					<li>News content4</li>
					<li>News content5</li> -->
					</ul>
					</div>
					<div style="overflow: hidden; position: relative; 
					height: 73px; width:75%;padding-left: 151px;
					cursor:pointer;" id="news-container">
						<ul style="position: absolute; margin: 0pt; padding: 0pt; top: 0px; margin-left: 130px;  list-style:none;">
							   
							
							 <% for(Board b : list) { %>
							<li class="noticeTitle"style="margin: 0pt; padding: 0pt; height: 59px; display: list-item;">
								<div class="noticeArea">
								
								<input type="hidden" id="wNo" name="wNo" value="<%=b.getwNo()%>"></input>
								
								<% if(b.getNoticeYn().equals("Y")) { %>[공지]&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<%= b.getTitle() %>
								
										<% }else{ %>
										<% if(b.getNoticeType().equals("A")){ %>
										[안내]
										<% } else if(b.getNoticeType().equals("B")) {%>
										[모집]
										<% } else if(b.getNoticeType().equals("C")) {%>
										[이벤트]
										<% } else if(b.getNoticeType().equals("D")) {%>
										[일반]
										<% } else { %>
										[펀딩tip]
										<% } %>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<%= b.getTitle() %>
										<% } %> 
							</div>
							</li>
							
							
							<% } %>
							</ul>
					</div>
		</div>

		<br>
		
		<a style="display: scroll; position: fixed; bottom: 8%; right: 3%;"
			href="#" title="맨 위로"> <img src="images/common/top.PNG"></a> <a
			style="display: scroll; position: fixed; bottom: 5%; right: 3%;"
			href="#outer" title="맨 아래로"> <img src="images/common/bottom.PNG"></a>


		
			<div id="messageArea">
			 	<a onclick="messageopen()">1:1 메세지 보내기</a>
			</div>

	</div>
	<input type="hidden" value="11" id="chat_id" size="10"/>
	
	<script>
		$(".noticeArea").click(function(){
			
			var wNo = $(this).children('#wNo').val(); 
			 location.href='<%=request.getContextPath()%>/boardRead.jsp?num='+wNo;
		}); 
			
		
<<<<<<< HEAD
	
	
	</script> --%>
=======
	</script>
>>>>>>> refs/remotes/origin/sojin
	<%@ include file="/views/common/footer.jsp" %> 
</body>
</html>