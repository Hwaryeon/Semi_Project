<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.sp.board.model.vo.*"%>
<%
ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"> 
<html>
<head>
<meta charset="UTF-8">
<title>Main Page</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="css/main/style.css">

<!-- <!-- 합쳐지고 최소화된 최신 CSS
<link rel="stylesheet" href="/hp/css/bootstrap.min.css">
부가적인 테마
<link rel="stylesheet" href="/hp/css/bootstrap-theme.min.css">
합쳐지고 최소화된 최신 자바스크립트
<script src="/hp/js/bootstrap.min.js"></script> --> 

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.js"></script>

<link href="https://fonts.googleapis.com/css?family=Sunflower:300"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Limelight|Sunflower:300"
	rel="stylesheet">

<%-- <script src="<%=request.getContextPath()%>/js/common/jquery.js"></script> --%>

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

.containerBox {
	position: relative;
	display: inline-block;
}

.text-box {
	position: absolute;
	height: 100%;
	text-align: center;
	width: 100%;
}

.text-box:before {
	content: '';
	display: inline-block;
	height: 100%;
	vertical-align: middle;
}

.text-box2 {
	position: absolute;
	/* height: 62%; */
	height:0px;
	text-align: center;
	width: 100%;
}

.text-box2:before {
	content: '';
	display: inline-block;
	height: 50%;
	vertical-align: middle;
}

.text-box3 {
	position: absolute;
	height: 100%;
	text-align: center;
	width: 100%;
	/* padding-left: 15%; */
}

.text-box3:before {
	content: '';
	display: inline-block;
	height: 50%;
	vertical-align: middle;
}

.text-box4 {
	position: absolute;
	height: 50%;
	text-align: left;
	width: 100%;
	padding-left: 15%;
	padding-top: 3%;
}

.text-box4:before {
	content: '';
	display: inline-block;
	height: 50%;
	vertical-align: middle;
}

h4 {
	display: inline-block;
	font-size: 35px; /*or whatever you want*/
	color: #FFF;
}

img {
	display: block;
	max-width: 100%;
	height: auto;
}

bu1 {
	background: rgb(207, 193, 0) border-radius: 30px;
	padding: 9px 0px;
	vertical-align: middle;
	display: table-cell;
	width: 116px;
	height: 41px;
	margin-top: 3%;
}

@import url(//fonts.googleapis.com/earlyaccess/nanumpenscript.css);

.menubar ul li {
	font-family: 'Sunflower';
}

#test1{
	    color: white;
    background: rgba(0, 0, 0, 0.5);
    height: 35%;
    width: 38%;
    text-align: center;
    padding-top: 3%;
    font-family: 'Limelight';
    float: left;
    margin-top: 223px;
}


.funding_area1{
    width: 100%;
    text-align: center;
    height: 550px;
    /* border: 1px solid black; */
    padding: 20px;
    margin: 15px;
    background:#f8f8f8;
}

.funding_p{
	/* float: left; */
    display: inline-block;
    width: 300px;
    height: 502px;
	border: 1px solid lightgray;
	    margin-right: 100px;
}

.funding_p2{
	/* float: left; */
    display: inline-block;
    width: 300px;
    height: 405px;
	border: 1px solid lightgray;
	    margin-right: 100px;
}

.fPic{
    width: 100%;
    height: 229px;
}
.fPic2{
    width: 100%;
    height: 225px;;
}
.fCon{
	width: 100%;
    height: 272px;
    background: beige;
	padding: 55px 20px;
    text-align: center;
}

.category {
    text-align: center;
    margin-bottom: 24px;
}

.category em {
    display: inline-block;
    height: 28px;
    line-height: 28px;
    letter-spacing: -.02em;
    padding: 0 10px;
    font-size: 13px;
    color: black;
    border: 1px solid black;
     font-family: 'Limelight';
}

.title {
    margin-bottom: 16px;
    text-align: center;
    font-size: 19px;
    color: black;
    line-height: 24px;
    letter-spacing: -.02em;
    height: 48px;
    overflow: hidden;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    word-wrap: break-word;
    font-family: 'Limelight';
}

.pText {
    font-size: 15px;
    text-align: center;
    color: black;
    line-height: 18px;
    letter-spacing: -.02em;
    height: 50px;
    overflow: hidden;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-line-clamp: 3;
    -webkit-box-orient: vertical;
    word-wrap: break-word;
    font-family: 'Limelight';
}

.badge {
    display: inline-block;
    margin-top: 8px;
    border-radius: 10px;
    background: #fff;
    padding: 0 6px;
    min-height: 20px;
    line-height: 20px;
    color: rgba(0,0,0,.54);
    font-size: 12px;
    font-weight: 400;
}

.picks-img {
    display: block;
    position: relative;
    border-bottom: none;
}

.picks-img span {
    display: block;
    width: 100%;
    /* padding-top: 76.66666%; */
    /* background: no-repeat 50% / cover; */
}

#fTitle {
    margin-bottom: 10px;
    text-align: center;
    font-size: 19px;
    line-height: 24px;
    letter-spacing: -.02em;
}
#fText {
    text-align: center;
    font-size: 13px;
    line-height: 20px;
}
.containerBox{
margin-top: 100px;
}


.progressbar-wrap{
    position: relative;
    left: 0;
    bottom: 0;
    width: 94%;
    height: 34px;
    box-sizing: border-box!important;
    background: linear-gradient(to bottom, rgba(0,0,0,0), rgba(0,0,0,.3));
    z-index: 10;
        margin-left: 3%;
        margin-top:10px;
}

.progressbar-wrap dt span {
    display: block;
    height: 6px;
    background: #1c62ab;
}

.progressbar-wrap dd {
    position: relative;
    text-align: center;
    line-height: 20px;
    height: 20px;
}
.progressbar-wrap dd span.percent {
    position: absolute;
    left: 0;
    top: 0;
    text-align: left;
}
.progressbar-wrap dd span.amount {
    text-align: left;
    position: absolute;
    left: 70px;
    top: 0;
}
.progressbar-wrap dd span.days {
    position: absolute;
    right: 0;
    top: 0;
    text-align: right;
}

.progressbar-wrap dd span {
    font-size: 14px;
    color: #fff;
    font-weight: 500;
    letter-spacing: -.02em;
    display: block;
        font-family: Roboto,Noto Sans KR,-apple-system,Dotum,sans-serif;
        line-height: 20px;
        font-weight:bold;
}

.fCon2{
	width: 100%;
    height: 178px;
    background: beige;
    padding: 55px 20px;
    text-align: center;

}

.fCon2 .title{
	text-align: left;
}
.fCon2 .pText{
	text-align: left;
	font-size: 13px;
	color: #90949c;
	margin-bottom: -25px;
}


.fCon2 .badge{

	margin-top: 0px;
    font-weight: 1;
    color: #23c78c;
}

.funding_p:hover{

	border:1.5px solid green;
	box-shadow: 0 0 3px 4px #bae2bb;
	/* margin-top: 64px; */
	
}

.funding_p:hover .title{

	color:#1d62ab;
}

.funding_p2:hover{

	border:1.5px solid green;
	box-shadow: 0 0 3px 4px rgb(94, 158, 214);
	/* margin-top: 64px; */
}

.funding_p2:hover .title{

	color:#1d62ab;
}

.title_box {
    margin-bottom: 30px;
    padding: 0;
    text-align: center;
    /* height: 30px; */
    background: url(images/main/bg_line_title.png) repeat-x 0 center;
    width: 1095px;
    margin-left: auto;
    margin-right: auto;
}

.title_box .title_line {
    padding: 0 20px;
    display: inline-block;
    width: auto;
    height: 30px;
    line-height: 30px;
    font-size: 33px;
    font-weight: normal;
    background: #f8f8f8;
}

.fPic, .fPic2 {
  transform: scale(1);
  -webkit-transform: scale(1);
  -moz-transform: scale(1);
  -ms-transform: scale(1);
  -o-transform: scale(1);
  transition: all 0.1s ease-in-out;   /* 부드러운 모션을 위해 추가*/
}
.fPic:hover, .fPic2:hover{
  transform: scale(1.03);
  -webkit-transform: scale(1.03);
  -moz-transform: scale(1.03);
  -ms-transform: scale(1.03);
  -o-transform: scale(1.03);
}
.img {width:298px; height:229px; overflow:hidden }   /* 부모를 벗어나지 않고 내부 이미지만 확대 */

#news-container
{
	width: 605px;
	/* margin: auto; */
	margin-top: 30px;
	border: 1px solid #333333;
	background:#48494a;
}

#news-container ul li div
{
	/* border: 1px solid #aaaaaa; */
	/* background: #ffffff; */
}

#main-notice{

	margin-top: 185px;
	margin-left: 188px;
}

.noticeArea{

    font-size: .875em;
    color: #fff;
	font-weight: 400;
    font-size: 17px;
    line-height: 1.5;
    font-family: Spoqa Han Sans,Apple SD Gothic Neo,Malgun Gothic,Dotum,Hevetica,Arial,sans-serif;
 	margin-top: 17px;

}

.noticeTitle:hover{
	console.log("11");
	color:red;
}

#news-container:hover{
	console.log("11");
	color:red;
}

</style>

</head>
<body >
<%@ include file="/views/common/headBar.jsp" %>
	<div class="wrap" style="min-width:1600px; background:#f8f8f8; margin-top:50px;">
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
		<br><br><br><br><br><br><br><br><br><br><br><br>
		<br><br><br><br><br><br><br><br>
		
		<a style="display: scroll; position: fixed; bottom: 8%; right: 3%;"
			href="#" title="맨 위로"> <img src="images/common/top.PNG"></a> <a
			style="display: scroll; position: fixed; bottom: 5%; right: 3%;"
			href="#footer" title="맨 아래로"> <img src="images/common/bottom.PNG"></a>


	</div>
	<script>
		$(".noticeArea").click(function(){
			
			var wNo = $(this).children('#wNo').val();
			location.href='<%=request.getContextPath()%>/boardRead.jsp?num='+wNo;
		});
			
		
	
	
	</script>

</body>
</html>