<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.sp.board.model.vo.*"%>
<%
ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
%>    
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">  -->
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
 
 

<script >
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

</style>

</head>
<body >
<%@ include file="/views/common/headBar.jsp" %>
	<div class="wrap" style=" background:#f8f8f8; margin-top:50px;">
		<div class="containerBox" style="width: 100%;">



			<div class="container" style="width:71%;">
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
							<img src="images/main/banner2.jpg" alt="main2" style="width: 100%; height:380px;">
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
					style="font-size: 30px; font-family: 'Limelight'">
						<em class="title_line">Main News</em><br>
				</span>
				</strong> 
					</div>
			
			<div class="funding_area1" >
			
				<div class="funding_p" style="margin-left: 72px;">
					<div class="fPic">
					<em class="picks-img">
					<span class="scale" style="overflow:hidden" >
					<img src="images/main/h1_1.jpg" style="width: 100%; height:229px;  overflow:hidden">
					</span>
					</em>
					<div class="progressbar-wrap">
                                   <dl>
                                       <dt><span style="width:16%"></span></dt>
                                       <dd>
                                           <span class="percent">16%</span>
                                           <span class="amount">13,250,000원 달성</span>
                                           
                                           	
                                           	<span class="days">24일 남음</span>
                                           
                                       </dd>
                                   </dl>
                                </div>
					
                                
                                
                                
					</div>
					<div class="fCon">
						<p class="category"><em>마감임박</em><em class="type" >투자</em></p>
						<p class="title">꽃바다를 부탁해<br>한번에</p>
						<p class="pText">어디어디회사<br>http://www.사이트주소.com</p>
						<p class="badge">※원금손실가능</p>
					</div>
					
				</div>
				
				<div class="funding_p">
					<div class="fPic">
					<em class="picks-img">
					<span class="scale" >
					<img src="images/main/h1_2.jpg" style="width: 100%; height:229px;">
					</span>
					</em>
					<div class="progressbar-wrap">
                                   <dl>
                                       <dt><span style="width:77%"></span></dt>
                                       <dd>
                                           <span class="percent">77%</span>
                                           <span class="amount">777,777,777원 달성</span>
                                           
                                           	
                                           	<span class="days">77일 남음</span>
                                           
                                       </dd>
                                   </dl>
                                </div>
					</div>
					<div class="fCon" style="background:#a7d7ec;">
						<p class="category"><em>마감임박</em><em class="type" >투자</em></p>
						<p class="title">영양좋고 맛 좋은 과자를<br>다함께</p>
						<p class="pText">사단 법인<br>두리하나다읍</p>
						<p class="badge">※원금보장</p>
					</div>
				</div>
				
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
			
			</div>
		</div>

			<div class="containerBox"
			style="width: 100%; height: 400px; /* background: white; */ margin-top: 15%;">
			<div class="text-box2">
				<div class="title_box">
				<strong> <span
					style="font-size: 30px; font-family: 'Limelight'"><em class="title_line">Hot Funding</em><br>
				</span>
				</strong> 
				</div>
			<div class="funding_area1" >
			
					<div class="funding_p2" style="margin-left: 72px;">
					<div class="fPic2">
					<em class="picks-img">
					<span class="scale" >
					<img src="images/main/h2_1.jpg" style="width: 100%; height:225px;">
					</span>
					</em>
					<div class="progressbar-wrap">
                                   <dl>
                                       <dt><span style="width:91%"></span></dt>
                                       <dd>
                                           <span class="percent">91%</span>
                                           <span class="amount">1,213,123,512원 달성</span>
                                           
                                           	
                                           	<span class="days">10일 남음</span>
                                           
                                       </dd>
                                   </dl>
                                </div>
					</div>
					<div class="fCon2" style="background:#a7d7ec;">
						<p class="title" >제목을 길게쓰면 어는정도 까지 들어갈 수 있을까</p>
						<p class="pText">소니</p>
						<p class="badge">※100%이상 리워드</p>
					</div>
				</div>
				
				<div class="funding_p2">
					<div class="fPic2">
					<em class="picks-img">
					<span class="scale" >
					<img src="images/main/h2_2.jpg" style="width: 100%; height:225px;">
					</span>
					</em>
					<div class="progressbar-wrap">
                                   <dl>
                                       <dt><span style="width:85%"></span></dt>
                                       <dd>
                                           <span class="percent">85%</span>
                                           <span class="amount">212,123,554원 달성</span>
                                           
                                           	
                                           	<span class="days">5일 남음</span>
                                           
                                       </dd>
                                   </dl>
                                </div>
					</div>
					<div class="fCon2" style="background:#a7d7ec;">
						<p class="title" >이거 한글폰트 엄청 안이쁘다 다른거 구해야겠다</p>
						<p class="pText">삼성</p>
						<p class="badge">※100%시 마감 및 리워드</p>
					</div>
				</div>
				
				<div class="funding_p2">
					<div class="fPic2">
					<em class="picks-img">
					<span class="scale" >
					<img src="images/main/h2_3.jpg" style="width: 100%; height:225px;">
					</span>
					</em>
					<div class="progressbar-wrap">
                                   <dl>
                                       <dt><span style="width:99%"></span></dt>
                                       <dd>
                                           <span class="percent">99%</span>
                                           <span class="amount">999,999,999원 달성</span>
                                           
                                           	
                                           	<span class="days">1일 남음</span>
                                           
                                       </dd>
                                   </dl>
                                </div>
					</div>
					<div class="fCon2" style="background:#a7d7ec;">
						<p class="title" >없음</p>
						<p class="pText">네이버</p>
						<p class="badge">※80%이상 리워드</p>
					</div>
				</div>
				
			</div>
			
			</div>
		</div>
		
		<div class="containerBox"
			style="width: 100%; height: 400px; /* background: white; */ margin-top: 10%;">
			<div class="text-box2">
				<div class="title_box">
				<strong> <span
					style="font-size: 30px; font-family: 'Limelight'"><em class="title_line">New Funding</em><br>
				</span>
				</strong> 
				</div>
			<div class="funding_area1" >
			
					<div class="funding_p2" style="margin-left: 72px;">
					<div class="fPic2">
					<em class="picks-img">
					<span class="scale" >
					<img src="images/main/h1_3.jpg" style="width: 100%; height:225px;">
					</span>
					</em>
					<div class="progressbar-wrap">
                                   <dl>
                                       <dt><span style="width:91%"></span></dt>
                                       <dd>
                                           <span class="percent">91%</span>
                                           <span class="amount">1,213,123,512원 달성</span>
                                           
                                           	
                                           	<span class="days">10일 남음</span>
                                           
                                       </dd>
                                   </dl>
                                </div>
					</div>
					<div class="fCon2" style="background:#ccf2c9;">
						<p class="title" >제목을 길게쓰면 어는정도 까지 들어갈 수 있을까</p>
						<p class="pText">소니</p>
						<p class="badge">※100%이상 리워드</p>
					</div>
				</div>
				
				<div class="funding_p2">
					<div class="fPic2">
					<em class="picks-img">
					<span class="scale" >
					<img src="images/main/product2.jpg" style="width: 100%; height:225px;">
					</span>
					</em>
					<div class="progressbar-wrap">
                                   <dl>
                                       <dt><span style="width:85%"></span></dt>
                                       <dd>
                                           <span class="percent">85%</span>
                                           <span class="amount">212,123,554원 달성</span>
                                           
                                           	
                                           	<span class="days">5일 남음</span>
                                           
                                       </dd>
                                   </dl>
                                </div>
					</div>
					<div class="fCon2" style="background:#ccf2c9;">
						<p class="title" >이거 한글폰트 엄청 안이쁘다 다른거 구해야겠다</p>
						<p class="pText">삼성</p>
						<p class="badge">※100%시 마감 및 리워드</p>
					</div>
				</div>
				
				<div class="funding_p2">
					<div class="fPic2">
					<em class="picks-img">
					<span class="scale" >
					<img src="images/main/product3.jpg" style="width: 100%; height:225px;">
					</span>
					</em>
					<div class="progressbar-wrap">
                                   <dl>
                                       <dt><span style="width:99%"></span></dt>
                                       <dd>
                                           <span class="percent">99%</span>
                                           <span class="amount">999,999,999원 달성</span>
                                           
                                           	
                                           	<span class="days">1일 남음</span>
                                           
                                       </dd>
                                   </dl>
                                </div>
					</div>
					<div class="fCon2" style="background:#ccf2c9;">
						<p class="title" >없음</p>
						<p class="pText">네이버</p>
						<p class="badge">※80%이상 리워드</p>
					</div>
				</div>
				
			</div>
			
			</div>
		</div>
		
		<div class="containerBox"
			style="width: 100%; height: 400px; /* background: white; */ margin-top: 11%;">
			<div class="text-box2">
				<div class="title_box">
				<strong> <span
					style="font-size: 30px; font-family: 'Limelight'"><em class="title_line">Closing Time Funding</em><br>
				</span>
				</strong> 
				</div>
			<div class="funding_area1" >
			
					<div class="funding_p2" style="margin-left: 72px;">
					<div class="fPic2">
					<em class="picks-img">
					<span class="scale" >
					<img src="images/main/product1.png" style="width: 100%; height:225px;">
					</span>
					</em>
					<div class="progressbar-wrap">
                                   <dl>
                                       <dt><span style="width:91%"></span></dt>
                                       <dd>
                                           <span class="percent">91%</span>
                                           <span class="amount">1,213,123,512원 달성</span>
                                           
                                           	
                                           	<span class="days">10일 남음</span>
                                           
                                       </dd>
                                   </dl>
                                </div>
					</div>
					<div class="fCon2" style="background:#9E9E9E;">
						<p class="title" >제목을 길게쓰면 어는정도 까지 들어갈 수 있을까</p>
						<p class="pText">소니</p>
						<p class="badge">※100%이상 리워드</p>
					</div>
				</div>
				
				<div class="funding_p2">
					<div class="fPic2">
					<em class="picks-img">
					<span class="scale" >
					<img src="images/main/product2.jpg" style="width: 100%; height:225px;">
					</span>
					</em>
					<div class="progressbar-wrap">
                                   <dl>
                                       <dt><span style="width:85%"></span></dt>
                                       <dd>
                                           <span class="percent">85%</span>
                                           <span class="amount">212,123,554원 달성</span>
                                           
                                           	
                                           	<span class="days">5일 남음</span>
                                           
                                       </dd>
                                   </dl>
                                </div>
					</div>
					<div class="fCon2" style="background:#9E9E9E;">
						<p class="title" >이거 한글폰트 엄청 안이쁘다 다른거 구해야겠다</p>
						<p class="pText">삼성</p>
						<p class="badge">※100%시 마감 및 리워드</p>
					</div>
				</div>
				
				<div class="funding_p2">
					<div class="fPic2">
					<em class="picks-img">
					<span class="scale" >
					<img src="images/main/product3.jpg" style="width: 100%; height:225px;">
					</span>
					</em>
					<div class="progressbar-wrap">
                                   <dl>
                                       <dt><span style="width:99%"></span></dt>
                                       <dd>
                                           <span class="percent">99%</span>
                                           <span class="amount">999,999,999원 달성</span>
                                           
                                           	
                                           	<span class="days">1일 남음</span>
                                           
                                       </dd>
                                   </dl>
                                </div>
					</div>
					<div class="fCon2" style="background:#9E9E9E;">
						<p class="title" >없음</p>
						<p class="pText">네이버</p>
						<p class="badge">※80%이상 리워드</p>
					</div>
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
								
								<% if(b.getNoticeYn().equals("A")) { %>[공지]&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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


	</div>
	<script>
		$(".noticeArea").click(function(){
			
			var wNo = $(this).children('#wNo').val();
			location.href='<%=request.getContextPath()%>/boardRead.jsp?num='+wNo;
		});
			
		
	
	
	</script>
	<%@ include file="/views/common/footer.jsp" %>
</body>
</html>